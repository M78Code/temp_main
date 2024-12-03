import 'dart:convert';
import 'package:flutter_main/net/socket/base/ColorLog.dart';
import 'package:flutter_main/net/socket/base/UrlParams.dart';
import 'package:flutter_main/utils/utils.dart';

import 'package:flutter_main/utils/jsCall.dart';
import 'package:get/get.dart';

enum UrlParamsKeys {
  // ignore: constant_identifier_names
  PARAMS("params"),
  // ignore: constant_identifier_names
  SIGNATURE("signature"),
  // ignore: constant_identifier_names
  TTL("ttl");

  final String value;
  const UrlParamsKeys(this.value);
}

class IUrlParamsData {
  // 商戶ID
  int agentId;
  // 玩家ID
  int playerId;
  // 限紅，試玩時無參數，商戶也可能不傳遞
  int oddType;
  // 退出到商戶的地址
  String backurl;
  // 桌台ID
  int tableId;
  // 新廳跳轉需求，新廳伺服器使用這個參數
  int newTableId;
  // 遊戲ID
  int gameTypeId;
  // 廳id
  String hallType;
  // 大分類id
  String gameGroupId;
  // sessionid
  String sessionid;
  // token
  String token;
  // 伺服器域名
  String backendDomainUrl;
  // 伺服器域名列表，用","分隔
  String backendDomainUrlList;
  // 文件服域名列表，用","分隔
  String fileDomainUrlList;
  // web跳轉域名
  String h5DomainUrlList;
  // 返回舊版的地址
  String oldUiDomainUrl;
  // 主播ID
  int anchorId;
  /**直接進主播列表 */
  int entryAnchorList;
  // 是否為競賽模式
  bool isCompetition;
  // 幣種
  String currency;
  /**C端設備類型 */
  int deviceType;
  // 品牌類型，1=OB真人 2=PM真人
  int brandType;
  // 是否顯示返回舊版按鈕
  bool backUi;
  // 諸葛開關，0不開，1開
  int zhuGeSwitch;
  // 神機開關，0不開，1開
  int shenjiSitch;

  /**亞博專屬標誌 */
  int? yaboTableId;
  // 商戶編碼
  String? agentCode;
  // =1表示不展示。=0或者無表示預設顯示。
  int? showExit;
  // 大廳左上角logo
  String? blogo;
  // 皮膚，0夜間皮膚，1日間皮膚，2自動切換
  int? skin;
  // 默認語言
  String? defaultLanguage;
  // 會員語言
  // 遊戲端的語種選用規則：
  //（1）優先選用介面中提供的語種。
  //（2）語種參數為空或不匹配，使用遊戲端頁面緩存語種。
  //（3）沒有緩存語種，使用商戶設定的會員預設語言。（商戶後台：運營管理-遊戲設置管理-遊戲會員預設語言）
  String? playerLanguage;
  // 網關，1非，2官網
  int? gw;
  // 語言，商戶也可能不傳遞
  int? lang;

  IUrlParamsData({
    required this.agentId,
    required this.playerId,
    required this.oddType,
    required this.backurl,
    required this.tableId,
    required this.newTableId,
    required this.gameTypeId,
    required this.hallType,
    required this.gameGroupId,
    required this.sessionid,
    required this.token,
    required this.backendDomainUrl,
    required this.backendDomainUrlList,
    required this.fileDomainUrlList,
    required this.h5DomainUrlList,
    required this.oldUiDomainUrl,
    required this.anchorId,
    required this.entryAnchorList,
    required this.isCompetition,
    required this.currency,
    required this.deviceType,
    required this.brandType,
    required this.backUi,
    required this.zhuGeSwitch,
    required this.shenjiSitch,
    this.yaboTableId,
    this.agentCode,
    this.showExit,
    this.blogo,
    this.skin,
    this.defaultLanguage,
    this.playerLanguage,
    this.gw,
    this.lang,
  });

  factory IUrlParamsData.fromJson(Map<String, dynamic> json) {
    return IUrlParamsData(
        agentId: int.parse(json['agentId']),
        playerId: json['playerId'],
        oddType: json['oddType'] != null ? int.parse(json['oddType']) : 0,
        backurl: json['backurl'],
        tableId: json['tableId'] != null ? int.parse(json['tableId']) : 0,
        newTableId:
            json['newTableId'] != null ? int.parse(json['newTableId']) : 0,
        gameTypeId:
            json['gameTypeId'] != null ? int.parse(json['gameTypeId']) : 0,
        hallType: json['hallType'] ?? '',
        gameGroupId: json['gameGroupId'] ?? '',
        sessionid: json['sessionid'] ?? '',
        token: json['token'] ?? '',
        backendDomainUrl: json['backendDomainUrl'] ?? '',
        backendDomainUrlList: json['backendDomainUrlList'] ?? '',
        fileDomainUrlList: json['fileDomainUrlList'] ?? '',
        h5DomainUrlList: json['h5DomainUrlList'] ?? '',
        oldUiDomainUrl: json['oldUiDomainUrl'] ?? '',
        anchorId: json['anchorId'] != null ? int.parse(json['anchorId']) : 0,
        entryAnchorList: json['entryAnchorList'] != null
            ? int.parse(json['entryAnchorList'])
            : 0,
        isCompetition: json['isCompetition'] ?? false,
        currency: json['currency'],
        deviceType: json['deviceType'] as int,
        brandType: json['brandType'] as int,
        backUi: json['backUi'] as bool,
        zhuGeSwitch: json['zhuGeSwitch'] as int,
        shenjiSitch: json['shenjiSitch'] as int,
        yaboTableId:
            json['yaboTableId'] != null ? int.parse(json['yaboTableId']) : 0,
        agentCode: json['agentCode'],
        showExit: json['showExit'] != null ? int.parse(json['showExit']) : 0,
        blogo: json['blogo'],
        skin: json['skin'],
        defaultLanguage: json['defaultLanguage'],
        playerLanguage: json['playerLanguage'],
        gw: json['gw'],
        lang: json['lang'] != null ? int.parse(json['lang']) : 0);
  }
}

class UrlManager {
  static String? url;
  static UrlParams? urlParams;
  static IUrlParamsData? decodeJson;

  static initialize(String url) async {
    if (UrlManager.url == url) {
      return;
    }
    final urlObject = Uri.parse(url);
    urlParams = UrlParams(urlObject.query);

    // final params = getUrlParams(UrlParamsKeys.PARAMS.value);
    final params = getUrlParams('params');
    // final ttl = getUrlParams(UrlParamsKeys.TTL.value);
    final ttl = getUrlParams('ttl');
    final decryptData = await aesDecrypt(params!, ttl!);
    decodeJson = IUrlParamsData.fromJson(jsonDecode(decryptData));
    UrlManager.url = url;
  }

  static Future<String?> decryptData(String url) async {
    if (UrlManager.url == url) {
      return null;
    }
    UrlManager.url = url;
    final urlObject = Uri.parse(url);
    urlParams = UrlParams(urlObject.query);

    // final params = getUrlParams(UrlParamsKeys.PARAMS.value);
    final params = getUrlParams('params');
    // final ttl = getUrlParams(UrlParamsKeys.TTL.value);
    final ttl = getUrlParams('ttl');
    final decryptData = await aesDecrypt(params!, ttl!);

    return decryptData;
  }
  static IUrlParamsData getDecodeParams() {
    return decodeJson!;
  }

  static String? getUrlParams(String key) {
    return urlParams?.get(key);
  }

  static dynamic aesDecrypt(String data, String ttl) async {
    // final easData = DataHandle.aesDecrypt(data, '$ttl AES');important
    final String easData =
        await executeJS('DataHandle', 'aesDecrypt', [data, ttl + "AES"]);
    print(easData);
    return easData;
  }

  static String get token {
    final token = getDecodeParams().token;
    if (token == null) {
      print("[UrlManager] Get Token Failed");
    }
    return token;
  }

  static int get playerId {
    return getDecodeParams().playerId;
  }

  static int get deviceType {
    return getDecodeParams().deviceType;
  }

  /** 检查 URL 参数 */
  static bool checkUrlParams([String? url]) {
    final keys = UrlParamsKeys.values;
    final length = keys.length;

    for (var i = 0; i < length; i++) {
      final item = keys[i];
      final param = item;
      final hasCurParams = getPara(param as String);
      final data = getPara(param as String, url);

      if (hasCurParams == null || data == null) {
        RoomColLog.logNormal('跳转链接缺少========> $param <========参数');
        return false;
      }
    }
    return true;
  }

  /** 获取 URL 参数值，没有返回 null */
  static String? getPara(String paraName, [String? paraUrl]) {
    print("paraName: $paraName, paraUrl: $paraUrl");

    if (paraUrl == null) {
      // paraUrl = PC ? window['GameParamsUrl'] : window.location.href;
      print("TODO:// this is PC logic");
    }

    if (paraUrl == null) {
      return null;
    }

    if (paraUrl.contains("?")) {
      final urlPara = "&" + paraUrl.split("?")[1];
      final reg = RegExp(r'&' + RegExp.escape(paraName) + r'=.*?(?:&|$)');
      final result = reg.firstMatch(urlPara);

      if (result != null) {
        return result.group(0)!.split("&")[1].split("=")[1];
      }
    }
    return null;
  }
}
