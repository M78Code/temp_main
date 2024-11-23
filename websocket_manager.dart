import 'dart:async';
import 'dart:convert';

import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/net/socket/base/Config.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/crypto/SocketRequest.dart';
import 'package:flutter_main/net/socket/websocket_help.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  static const String TAG = "--WebSocketManager--";

  String wsUrl = "";

  static final WebSocketManager _instance = WebSocketManager._internal();

  factory WebSocketManager() => _instance;

  /// 单例初始
  WebSocketManager._internal() {}

  Future<String> initWebSocketUrl() async {
    if (wsUrl.isEmpty) {
      wsUrl = await WebSocketHelp.initWebSocketUrl();
    }
    return wsUrl;
  }

  IOWebSocketChannel? _channel; // WebSocket
  bool _isConnect = false;
  bool _handleClose = false;

  num _heartTimes = 10000; // 心跳间隔(毫秒)
  num _rcMaxCount = 60; // 重连次数，默认60次
  num _rcTimes = 0; // 重连计数器
  Timer? _rcTimer; // 重连定时器

  Function? openCallback; // 连接开启回调
  Function? errorCallback; // 连接错误回调
  Function? messageCallback; // 接收消息回调

  void initWebSocket({
    Function? openCallback,
    Function? errorCallback,
    Function? messageCallback,
  }) {
    this.openCallback = openCallback;
    this.errorCallback = errorCallback;
    this.messageCallback = messageCallback;
    openSocket();
  }

  /// 开启WebSocket连接
  void openSocket() {
    _handleClose = false;
    closed();

    // _channel = IOWebSocketChannel.connect(wsUrl, pingInterval: Duration(milliseconds: _heartTimes.toInt()));
    _channel = IOWebSocketChannel.connect(Uri.parse(wsUrl));
    // _channel = IOWebSocketChannel.connect(Uri.parse(
    //     'wss://wsproxy.dpzrfat6.com/?playerId=132739&deviceId=1726716409578530606-17869081&jwtToken=eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI1NDFjNWJhNi0yZjdlLTQ2ZGMtODVmOC1lMjZkYjMwOTIzYTgiLCJpYXQiOjE3MjY5MTQ5MjIsInN1YiI6IntcInBsYXllcklkXCI6MTMyNzM5LFwibG9naW5OYW1lXCI6XCJiYmJiYnRyeXBsYXllcjAwMlwiLFwibmlja05hbWVcIjpcInRyeXBsYXllcjAwMlwiLFwiY3VycmVuY3lcIjpcIkNOWVwiLFwiY2F0ZWdvcnlcIjowLFwiYWdlbnRJZFwiOjJ9IiwiZXhwIjoxNzI2OTU4MTIyfQ.R6KrmQaD2RcYDNstZSSBWTKbOLuw-qXhiJ08SIH7Y1M&platformId=1&applicationId=7&version=v1.0.5&l=138890&ext=1733570450&deviceOs=MacOS&screenHeight=2160&screenWidth=3840'));

    // LogUtil.log('$TAG websocket connect:  ${wsUrl}');

    _channel!.stream
        .listen((data) => _onMessage(data), onError: _onError, onDone: _onDone);

    WebSocketHelp.initLogin();
  }

  _onMessage(data) {
    if (!_isConnect) {
      _isConnect = true;

      _rcTimes = 0;
      _rcTimer?.cancel();
      _rcTimer = null;

      if (openCallback != null) {
        openCallback!();
      }
    }

    if (messageCallback != null) {
      messageCallback!(data);
    }
  }

  _onDone() {
    LogUtil.log(
        '$TAG websocket done isconnect: $_isConnect _handleClose: $_handleClose');
    // if (!_handleClose) {
    //   reconnect();
    // }
    reconnect2();
  }

  /// WebSocket连接错误回调
  _onError(e) {
    LogUtil.log('$TAG websocket error: $e');

    if (errorCallback != null) {
      errorCallback!(e);
    }
    closed();
  }

  void closeSocket() {
    _handleClose = true;
    closed();
  }

  /// 关闭WebSocket
  void closed() {
    if (_channel != null) {
      if (_channel!.sink != null) {
        _channel!.sink.close();
        _isConnect = false;

        LogUtil.log('$TAG websocket closed');
      }
    }
  }

  void goLogin(message) {
    // LogUtil.log('$TAG goLogin-isconnect: $_isConnect');
    if (_channel != null) {
      _channel!.sink.add(message);
    }
  }

  void sendMessage(message) {
    LogUtil.log('$TAG sendMessage: $message, isconnect: $_isConnect');
    if (_channel != null && _isConnect) {
      _channel!.sink.add(message);
    }
  }

  void sendEncryptMessage(message) {
    LogUtil.log('$TAG sendEncryptMessage: $message, isconnect: $_isConnect');
    if (_channel != null && _isConnect) {
      WebSocketHelp.encryptWsData(message).then((onValue) {
        LogUtil.log('$TAG sendEncryptMessage-onValue=: $onValue');
        if (onValue.isNotEmpty) {
          _channel!.sink.add(message);
        }
      });
    }
  }

  Future<bool> sendEncryptUint8ListMessage(message) async {
    // LogUtil.log(
    //     '$TAG sendEncryptUint8ListMessage: $message, isconnect: $_isConnect');
    if (_channel == null || !_isConnect) {
      return false;
    }

    try {
      var encryptWsDataStr = await WebSocketHelp.encryptWsData(message);

      if (encryptWsDataStr.isEmpty) {
        return false;
      }

      var uint8list = await WebSocketHelp.getUint8ListData(encryptWsDataStr);

      if (uint8list == null) {
        return false;
      }
      _channel!.sink.add(uint8list);

      return true;
    } on Exception catch (e) {
      LogUtil.log('${TAG}-sendEncryptUint8ListMessage-Exception: $e');
    }
    return false;
  }

  /// 重连机制
  void reconnect() {
    if (_rcTimes < _rcMaxCount) {
      _rcTimes++;

      _rcTimer ??=
          Timer.periodic(Duration(milliseconds: _heartTimes.toInt()), (timer) {
        LogUtil.log('$TAG reconnect:  ${wsUrl}');

        // _channel = IOWebSocketChannel.connect(wsUrl,
        //     pingInterval: Duration(milliseconds: _heartTimes.toInt()));
        _channel = IOWebSocketChannel.connect(Uri.parse(wsUrl));

        _channel!.stream.listen((data) => _onMessage(data),
            onError: _onError, onDone: _onDone);

        WebSocketHelp.initLogin();
      });
    } else {
      LogUtil.log('$TAG reconnect limits');
      _rcTimer?.cancel();
      _rcTimer = null;
      return;
    }
  }

  /// 重连机制
  void reconnect2() {
    _channel = IOWebSocketChannel.connect(Uri.parse(wsUrl));

    _channel!.stream
        .listen((data) => _onMessage(data), onError: _onError, onDone: _onDone);

    WebSocketHelp.initLogin();
  }

  ///id: SocketType.GAME_LIST_SWITCH_TAB.value
  ///param:专属参数
  static Future sendMessageSocket(
      {required SocketType socketType,
      required Map<String, dynamic> param,
      int? tableId = 0,
      int? gameTypeId = 0,
      ServiceTypeId serviceTypeId = ServiceTypeId.GAME}) async {
    var currentTimeMillis = AppUtil.currentTimeMillis;
    // var ip = await HttpUtil.getIp();
    Map<String, dynamic> processData = param;
    processData['playerId'] = GlobalController.controller.playerId;
    processData['clientDeviceType'] =
        GlobalController.controller.clientDeviceType;
    processData['deviceType'] = GlobalController.controller.deviceType;
    processData['deviceId'] = AppUtil.deviceId;
    // processData['ip'] = ip;
    // processData['messageId'] = currentTimeMillis;

    String jsonDataText = json
        .encode({'id': socketType.value, 'param': json.encode(processData)});

    print("${socketType.value}请求 json参数为 ${jsonDataText}");

    final data = await WebSocketHelp.encryptWsOperationsData('createNonce', []);

    int nonce = int.parse(data);

    final sign = await WebSocketHelp.encryptWsOperationsData(
        'createSign', [jsonDataText, nonce, currentTimeMillis, CRYPTO_KEY]);

    var request = SocketRequest(
        socketType,
        processData,
        GameType.getGameTypeFromValue(gameTypeId ?? -1),
        serviceTypeId,
        currentTimeMillis,
        processData,
        jsonDataText,
        GlobalController.controller.appConfigModel?.playerId ?? 0,
        nonce,
        sign,
        tableId);

    var jsonEncode = json.encode(request.toObject());

    // LogUtil.log('-ws-send=${request.toObject()}');

    return WebSocketManager().sendEncryptUint8ListMessage(jsonEncode);
  }

  ///id: SocketType.GAME_LIST_SWITCH_TAB.value
  ///param:专属参数
  ///没有j鉴权
  static Future sendMessage1Socket(
      {required SocketType socketType,
      required Map param,
      int? tableId = 0,
      int? gameTypeId = 0,
      int serviceType = 3}) async {
    var currentTimeMillis = AppUtil.currentTimeMillis;

    Map processData = param;
    processData['clientDeviceType'] = 1;
    processData['deviceType'] =
        GlobalController.controller.mAppConfigModel.value.deviceType;
    processData['deviceId'] = AppUtil.deviceId;

    String jsonDataText = json
        .encode({'id': socketType.value, 'param': json.encode(processData)});

    Map dic = {
      "jsonData": jsonDataText,
      "protocolId": socketType.value,
      "gameTypeId": gameTypeId,
      "playerId": GlobalController.controller.mAppConfigModel.value.playerId,
      "tableId": tableId,
      "serviceTypeId": serviceType,
      "timestamp": currentTimeMillis,
      "messageId": currentTimeMillis + 1
    };

    String jsonEncode = json.encode(dic);

    return WebSocketManager().sendEncryptUint8ListMessage(jsonEncode);
  }
}
