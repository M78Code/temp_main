import 'dart:convert';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/net/http/http.dart';
import 'package:flutter_main/net/socket/base/Config.dart';
import 'package:flutter_main/net/socket/base/CryptoUnit.dart';
import 'package:flutter_main/net/socket/websocket_manager.dart';
import 'package:flutter_main/utils/jsCall.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/crypto/SocketRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../pages/play/play_router.dart';

class WebSocketHelp {
  static const String TAG = "--WebSocketHelp--";

  /// socket 数据解密
  static Future<String> decryptWsData(data) async {
    try {
      return await executeJS('DataHandle', 'decryptWsData', [data, CRYPTO_KEY]);
    } on Exception catch (e) {
      LogUtil.log('${TAG}-decryptWsData-Exception: $e');
    }
    return '';
  }

  /// socket 数据加密
  static Future<String> encryptWsData(data) async {
    try {
      return await executeJS('DataHandle', 'encryptWsData', [data, CRYPTO_KEY]);
    } on Exception catch (e) {
      LogUtil.log('${TAG}-encryptWsData-Exception: $e');
    }
    return '';
  }

  /// socket 业务数据加密
  static Future<String> encryptWsOperationsData(fun, para) async {
    try {
      return await executeJS('DataHandle', fun, para);
    } on Exception catch (e) {
      LogUtil.log('${TAG}-encryptWsData-Exception: $e');
    }
    return '';
  }

  /// 数据转Uint8List
  /// Android 解析数据：{0: 86, 1: 142, 2: 255, 3: 200, 4: 12, 5: 167, 6: 154, 7: 212, 8: 237, 9: 79, 10: 178}
  /// IOS 返回解析数据：36,17,54,8,18,119,154,85,211,166,53,142,143,242,189,86,247,29,76,60,
  static Future<Uint8List?> getUint8ListData(String data) async {
    try {
      List<int> list = [];
      if (GetPlatform.isAndroid) {
        var split = data.split(',').toList();
        for (int i = 0; i < split.length; i++) {
          var value = split[i];
          var split2 = value.split(":")[1].trim();
          String replaced = split2.replaceFirst("}", "");
          list.add(int.parse(replaced));
        }
      } else if (GetPlatform.isIOS) {
        var split = data.split(',').toList();
        for (int i = 0; i < split.length; i++) {
          var value = split[i].trim();
          list.add(int.parse(value));
        }
      } else {
        LogUtil.log('${TAG}-initLogin-else-');
        return null;
      }

      var uint8list = Uint8List.fromList(list);
      return uint8list;
    } on Exception catch (e) {
      LogUtil.log('${TAG}-getUint8ListData-Exception: $e');
    }
    return null;
  }

  static Future<String> initWebSocketUrl() async {
    var webSocketServer = GlobalController.controller.webSocketServer ?? '';
    if (webSocketServer.isEmpty) {
      LogUtil.log('$TAG initWebSocketUrl-webSocketServer.isEmpty');
      return '';
    }
    var playerId = GlobalController.controller.appConfigModel?.playerId ?? 0;
    if (0 == playerId) {
      LogUtil.log('$TAG initWebSocketUrl-playerId==0');
      return '';
    }

    var token = GlobalController.controller.token ?? '';
    if (token.isEmpty) {
      LogUtil.log('$TAG initWebSocketUrl-token.isEmpty');
      return '';
    }
    var ip = await HttpUtil.getIp();
    if (ip.isEmpty) {
      LogUtil.log('$TAG initWebSocketUrl-ip.isEmpty');
      return '';
    }

    final baseUrl =
        '${webSocketServer}/?playerId=${playerId}&deviceId=${AppUtil.deviceId}&jwtToken=${token}';

    LogUtil.log('$TAG initWebSocketUrl-baseUrl=$baseUrl');

    final length = baseUrl.split("?")[1].length * 323;
    final fullUrl =
        '$baseUrl&platformId=1&applicationId=7&version=$GAME_VERSION_CODE&l=$length&ext=${CryptoUnit.ipToInt(ip)}';
    return fullUrl;
  }

  static Future<bool> initLogin() async {
    LogUtil.log("${TAG}--initLogin-");

    try {
      final timestamp = AppUtil.currentTimeMillis;

      Map<String, dynamic> processData = {};
      processData['jwtToken'] = GlobalController.controller.token ?? '';
      processData['clientDeviceType'] = DeviceTypeEnum.WEB.value;
      processData['deviceType'] =
          GlobalController.controller.mAppConfigModel.value.deviceType;
      processData['deviceId'] = AppUtil.deviceId;

      IRequestJsonData jsonData = IRequestJsonData()
        ..id = SocketType.LOGIN.value
        ..param = jsonEncode(processData);
      String jsonDataText = jsonEncode(
          {'id': SocketType.LOGIN.value, 'param': jsonEncode(processData)});

      final data = await encryptWsOperationsData('createNonce', []);

      int nonce = int.parse(data);

      final sign = await encryptWsOperationsData(
          'createSign', [jsonDataText, nonce, timestamp, CRYPTO_KEY]);

      final request = SocketRequest(
          SocketType.LOGIN, // 心跳的请求ID
          {'id': SocketType.LOGIN.value, 'param': jsonEncode(processData)},
          GameType.MULTI_PLAY,
          ServiceTypeId.HALL,
          timestamp,
          processData,
          jsonDataText,
          GlobalController.controller.appConfigModel?.playerId ?? 0,
          nonce,
          sign,
          null);

      final buffer = await encryptWsData(jsonEncode(request.toObject()));

      var uint8list = await getUint8ListData(buffer);

      Future.delayed(const Duration(seconds: 3), () {
        WebSocketManager().goLogin(uint8list);
      });
      return true;
    } on Exception catch (e) {
      LogUtil.log('${TAG}-initLogin-Exception: $e');
    }
    return false;
  }

  static switchTab() async {
    LogUtil.log("--GlobalController--switchTab-");

    var currentTimeMillis = AppUtil.currentTimeMillis;

    Map<String, dynamic> processData = {};
    processData['groupId'] = 9;
    processData['isAll'] = 1;
    processData['clientDeviceType'] = 1;
    processData['deviceType'] =
        GlobalController.controller.mAppConfigModel.value.deviceType;
    processData['deviceId'] = AppUtil.deviceId;

    String jsonDataText = json.encode({
      'id': SocketType.GAME_LIST_SWITCH_TAB.value,
      'param': json.encode(processData)
    });

    final data = await encryptWsOperationsData('createNonce', []);

    int nonce = int.parse(data);

    final sign = await encryptWsOperationsData(
        'createSign', [jsonDataText, nonce, currentTimeMillis, CRYPTO_KEY]);

    var request = SocketRequest(
        SocketType.GAME_LIST_SWITCH_TAB,
        {'groupId': 9, 'isAll': 1, 'clientDeviceType': 1},
        GameType.MULTI_PLAY,
        ServiceTypeId.HALL,
        currentTimeMillis,
        processData,
        jsonDataText,
        GlobalController.controller.appConfigModel?.playerId ?? 0,
        nonce,
        sign,
        currentTimeMillis + 1);

    var jsonEncode = json.encode(request.toObject());

    WebSocketManager().sendEncryptUint8ListMessage(jsonEncode);
  }

  /// 开关 快速换桌
  static sendSocket10091(bool isQChange) {
    WebSocketManager.sendMessageSocket(
        socketType: SocketType.QUICK_CUT_TABLE,
        param: {'isQuickCutTable': isQChange ? 1 : 0},
        serviceType: 7,
        tableId: PlayRouter.mCurrentTableId,
        gameTypeId: PlayRouter.mGameTypeId);
  }
}
