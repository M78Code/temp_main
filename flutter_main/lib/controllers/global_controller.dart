import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/language/translations_service.dart';
import 'package:flutter_main/models/app_config_model.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

import '../net/socket/base/URLManager.dart';

/// 基于GetX 全局状态管理
class GlobalController extends GetxController {
  static const String TAG = "--GlobalController--";

  static GlobalController get controller => Get.find<GlobalController>();

  /// 暂定 白天 黑夜 全局变量 深色背景默认路纸颜色 1浅色 2深色
  /// 全局更换皮肤方法改用：skinSet
  /// 取值不变，原来怎么用的还是怎么用
  RxInt mAppBgMode = 1.obs;

  bool get isDark => (mAppBgMode.value == 2);

  /// 路纸模式 0浅色 1深色
  RxInt lzBgMode = 0.obs;

  /// 桌台模式 全局变量 荷官模式 1 极简模式2 路子模式3 现场模式4
  RxInt modeType = 4.obs;

  /// 大厅模式 全局变量 0	全部厅 1	旗舰厅 3	亚太厅 5	国际厅
  RxInt gameCasinoId = 0.obs;

  ///排行
  RxInt sort = 0.obs;

  /// 牌局状态变化
  /// 0--准备中， 1--洗牌中，2--下注中，3--开牌中，4--结算中，6--维护中，11-维护中
  RxInt obsGameStatus = 0.obs;

  ///是否打开游戏设置  是 推送单独通知，否 不推送
  bool isOpenGameSetting = false;

  /// 登录后 解密的 配置信息
  Rx<AppConfigModel> mAppConfigModel = AppConfigModel().obs;

  /// 是否开启现场视频 ture开启  false关闭
  RxBool isSeneVideo = false.obs;

  /// 是否开启快速换桌 ture开启  false关闭
  RxBool isQChangeTable = false.obs;

  /// 是否开启快速下注 ture开启  false关闭
  RxBool isQuikBet = false.obs;

  ///好路游戏类型
  List<int> gameList = [];

  ///好路类型
  List<int> roadList = [];

  /// 声音总开关 ture开启  false关闭
  RxBool soundSwitch = false.obs;

  /// 语音 0普通话 1普通话（林志林） 2英语 3泰国话 4韩国话 5越南话
  RxInt voice = 0.obs;

  /// 游戏语音
  RxDouble gameVoice = 50.0.obs;

  /// 游戏音效
  RxDouble gameYinX = 50.0.obs;

  /// 现场音效
  RxDouble sceneVoice = 50.0.obs;

  /// 全局的网络状态
  static bool mNetworkAvailable = true;

  static String mHttpServer = "";
  static String mWebSocketServer = "";

  late StreamSubscription _connectivitySubscription;

  /// 全局 更新服务器 时间
  int? mServerTime = 0;

  /// 黑白模式切换 参数任意类型 返回 白 或 黑
  dynamic checkWhiteBlack(white, black) {
    return mAppBgMode.value == 2 ? black : white;
  }

  /// 黑白模式切换 参数任意类型 返回 白 或 黑
  static dynamic CheckWhiteBlack(white, black) {
    return GlobalController.controller.checkWhiteBlack(white, black);
  }

  final _connectivity = Connectivity();

  @override
  void onReady() {}

  // void jumpToLoginPage() {
  //   NavigatorUtil.offAllToNamed(LoginRouter.login);
  // }


  void addListenerWithNative() {
    print("listenNative ===============");
    const EventChannel("native_to_flutter").receiveBroadcastStream('init').listen(_onEvent);
  }

  void _onEvent(Object? event) {
    if(event != null) {
      print("event=====${event!}");
      String jsonStr = event.toString();
      if (jsonStr.isNotEmpty) {
        UrlManager.decryptData(jsonStr).then((result) {
          var appConfigModel = appConfigModelFromJson(result!);
          controller.loginSuccess(appConfigModel);
        });
      }

    }
  }

  @override
  void onInit() {
    super.onInit();
    addListenerWithNative();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    var appBgMode = StorageUtil().getInt(StorageUtil.KEY_APP_BG_MODE);
    if (appBgMode == 100) appBgMode = 2;
    skinSet(appBgMode);

    // 路纸模式
    lzBgMode.value = StorageUtil().getInt(StorageUtil.KEY_ROAD_MODE);

    // 现场视频
    isSeneVideo.value = StorageUtil().getBool(StorageUtil.KEY_SCENE_VIDEO);

    // 快速换桌
    isQChangeTable.value = StorageUtil().getBool(StorageUtil.KEY_CHANGE_TALBE);

    // 快速下注
    isQuikBet.value = StorageUtil().getBool(StorageUtil.KEY_QUIK_BET);

    // 声音总开关
    soundSwitch.value = StorageUtil().getBool(StorageUtil.KEY_VOICE_SWITCH);

    // 语音 语种
    final voiceV = StorageUtil().getInt(StorageUtil.KEY_VOICE);
    voice.value = voiceV == 100 ? 0 : voiceV;

    // 游戏语音
    gameVoice.value = StorageUtil().getDouble(StorageUtil.KEY_GAME_VOICE);

    // 游戏音效
    gameYinX.value = StorageUtil().getDouble(StorageUtil.KEY_GAME_YINX);

    // 现场音效
    sceneVoice.value = StorageUtil().getDouble(StorageUtil.KEY_SCENE_VOICE);
    gameList =
        StorageUtil().getList('gameType').map((e) => int.parse(e)).toList();
    roadList =
        StorageUtil().getList('roadType').map((e) => int.parse(e)).toList();
  }

  @override
  void onClose() {
    super.onClose();

    _connectivitySubscription.cancel();
  }

  /// 初始化语言数据
  initLanguage() {
    String languageCode =
        StorageUtil().getString(StorageUtil.KEY_APP_LANGUAGE_CODE);
    if (languageCode == '') {
      /// 兼容 历史遗留bug 简体中文zh、cn   繁体中文 tw、tc  韩文ko、kr
      /// flutter 内部统一 简体中文cn    繁体中文 tc  韩文kr
      final code = appConfigModel?.defaultLanguage ?? 'cn';
      if (code == 'zh') {
        languageCode = 'cn';
      } else if (code == 'tw') {
        languageCode = 'tc';
      } else if (code == 'ko') {
        languageCode = 'kr';
      } else {
        languageCode = code;
      }
    }
    TranslationService.updateLocaleWithCode(languageCode);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    LogUtil.log("--GlobalController--_updateConnectionStatus-result=$result");
    mNetworkAvailable = ConnectivityResult.none != result.first;
  }

  String? get httpServer {
    return mHttpServer;
  }

  String? get webSocketServer {
    return mWebSocketServer;
  }

  AppConfigModel? get appConfigModel {
    return mAppConfigModel.value;
  }

  String? get token {
    return mAppConfigModel.value.token;
  }

  int? get deviceType {
    return mAppConfigModel.value.deviceType;
  }

  int? get clientDeviceType {
    return 1;
  }

  int? get playerId {
    return mAppConfigModel.value.playerId;
  }

  /// 登录成功 处理y一些 业务逻辑
  void loginSuccess(AppConfigModel appConfigModel) {
    mAppConfigModel.value = appConfigModel;

    /// 初始化 服务地址
    mHttpServer = 'https://gateway.${appConfigModel.backendDomainUrl}/';
    mWebSocketServer = 'wss://wsproxy.${appConfigModel.backendDomainUrl}';

    // 初始换语言环境
    initLanguage();

    StorageUtil()
        .setJson(StorageUtil.KEY_APP_CONFIG_MODEL, appConfigModel.toJson());

    WebsocketController.controller.initWS();

    // ToastUtil.showToast('登录成功！');
  }

  void updateAppBgMode(int appBgMode) {
    mAppBgMode.value = appBgMode;
  }

  /// 皮肤设置 0浅 1深 2自动  皮肤切换使用字段用原来的，规则不变
  skinSet(int type) {
    int appBgMode = 1; // 和全局值一致 1浅 2深
    if (type == 0) {
      appBgMode = 1;
    } else if (type == 1) {
      appBgMode = 2;
    } else {
      //自动 （7-22点为  白天皮肤  22-05点 夜晚皮肤）
      final hour = DateTime.now().hour;
      if (hour >= 7 && hour <= 22) {
        appBgMode = 1;
      } else {
        appBgMode = 2;
      }
    }
    updateAppBgMode(appBgMode);
    StorageUtil().setInt(StorageUtil.KEY_APP_BG_MODE, type);
  }

  /// 路纸模式 0浅 1深
  luzhiSet(int type) {
    lzBgMode.value = type;
    StorageUtil().setInt(StorageUtil.KEY_ROAD_MODE, type);
  }

  /// 现场视频
  setSeneVideo(bool isSene) {
    isSeneVideo.value = isSene;
    StorageUtil().setBool(StorageUtil.KEY_SCENE_VIDEO, isSene);
  }

  /// 快速换桌
  quikChangeTable(bool isQuikCT) {
    isQChangeTable.value = isQuikCT;
    StorageUtil().setBool(StorageUtil.KEY_CHANGE_TALBE, isQuikCT);
  }

  /// 快速下注
  quikBet(bool isQuikB) {
    isQuikBet.value = isQuikB;
    StorageUtil().setBool(StorageUtil.KEY_QUIK_BET, isQuikB);
  }

  /// 声音总开关
  setVoiceSwitch(bool isOpen) {
    soundSwitch.value = isOpen;
    StorageUtil().setBool(StorageUtil.KEY_VOICE_SWITCH, isOpen);
  }

  /// 语音 语种
  setVoiceType(int type) {
    voice.value = type;
    StorageUtil().setInt(StorageUtil.KEY_VOICE, type);
  }

  /// 游戏声音
  setGameVoice(double gVoice) {
    gameVoice.value = gVoice;
    StorageUtil().setDouble(StorageUtil.KEY_GAME_VOICE, gVoice);
  }

  /// 游戏声音
  setGameYinX(double gYinx) {
    gameYinX.value = gYinx;
    StorageUtil().setDouble(StorageUtil.KEY_GAME_YINX, gYinx);
  }

  /// 现场音效
  setSeneVoice(double sVoice) {
    sceneVoice.value = sVoice;
    StorageUtil().setDouble(StorageUtil.KEY_SCENE_VOICE, sVoice);
  }

  static void updateGameSettingState(bool ok) {
    controller.isOpenGameSetting = ok;
  }
}
