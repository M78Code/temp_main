import 'package:flutter/foundation.dart';
import 'package:flutter_js/extensions/fetch.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/language/translations_service.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

import '../../../dialogs/Single_sel_dialog.dart';
import '../../../net/socket/websocket_help.dart';
import '../../../utils/storage_util.dart';
import 'state.dart';

class GameSettingLogic extends GetxController {
  final GameSettingState state = GameSettingState();
  final globalController = GlobalController.controller;

  final languageNames = [
    '简体中文', // cn 简体中文
    '繁体中文', // tc 繁体中文
    'English', // en 英文
    'แบบไทย', // th 泰文
    '한국인', // kr 韩语
    'Tiếng Việt', // vi 越南文
  ];

  final Map<String, int> lConfig = {
    'cn': 0,
    'tc': 1,
    'en': 2,
    'th': 3,
    'kr': 4,
    'vi': 5,
  };
  // 选中的 语言下标
  int lSelIndex = 0;

  // 语音
  final voiceNames = [
    '普通话', // 0
    '普通话(林志玲)', // 1
    'English', // 2
    'แบบไทย', // 3 泰文
    '한국인', // 4 韩语
    'Tiếng Việt', // 5 越南文
  ];
  // 选中的语音下标
  int vSelIndex = 0;

  ///白天黑夜模式切换
  skinModelChange(int index) {
    state.skinSwitcherSelectIndex.value = index;
    globalController.skinSet(index);
    LogUtil.log('change index->$index');
    updateLuZModeDisplay(index);
  }

  ///弹出选择语言的弹框
  showLanguageDialog() {
    SingleSelectDialog.show(
        title: 'gset_yylanguage'.tr,
        defaultIdex: lSelIndex,
        languageNames, (int idex) {
      LogUtil.log('select language: $idex');
      updateLanguage(idex);
    });
  }

  /// 语言设置并更新
  updateLanguage(int selIdex) {
    lSelIndex = selIdex;
    String code = '';
    switch (selIdex) {
      case 0:
        code = 'cn';
        break;
      case 1:
        code = 'tc';
        break;
      case 2:
        code = 'en';
        break;
      case 3:
        code = 'th';
        break;
      case 4:
        code = 'kr';
        break;
      case 5:
        code = 'vi';
        break;
      default:
        code = 'cn';
    }
    TranslationService.updateLocaleWithCode(code);
    state.languageString.value = languageNames[selIdex];
  }

  /// 更新路纸模式显示状态
  updateLuZModeDisplay(int index) {
    if (index == 1) {
      state.isDisplay.value = true;
    } else if (index == 2) {
      //自动 （7-22点为  白天皮肤  22-05点 夜晚皮肤）
      final hour = DateTime.now().hour;
      if (hour >= 7 && hour <= 22) {
        state.isDisplay.value = false;
      } else {
        state.isDisplay.value = true;
      }
    } else {
      state.isDisplay.value = false;
    }
  }

  /// 更新路纸模模式
  updateLuZMode(int index) {
    state.luzhiSwitcherSelectIndex.value = index;
    globalController.luzhiSet(index);
  }

  ///弹出选择语音的弹框
  showBottomDialog() {
    SingleSelectDialog.show(
        title: 'gset_yylanguage'.tr,
        defaultIdex: vSelIndex,
        voiceNames, (int idex) {
      updatVoice(idex);
      LogUtil.log('select voice: $idex');
    });
  }

  /// 语音音效
  updatVoice(int selIdex) {
    vSelIndex = selIdex;
    state.voiceString.value = voiceNames[vSelIndex];

    /// TODO： 本地存储 具体业务待处理
    globalController.setVoiceType(selIdex);
  }

  /// 现场视频
  updateSeneVideo(bool isSeneVideo) {
    state.videoSwitch.value = isSeneVideo;
    globalController.setSeneVideo(isSeneVideo);

    /// TODO： 具体业务
  }

  /// 快速换桌
  updateQChangeTable(bool isQChange) {
    state.quickChangeTable.value = isQChange;
    globalController.quikChangeTable(isQChange);

    // 发送socket消息：快速换桌
    WebSocketHelp.sendSocket10091(isQChange);
  }

  updateQuikBet(bool isQuik) {
    state.quickBet.value = isQuik;
    globalController.quikBet(isQuik);

    /// TODO： 具体业务
  }

  /// *************** 声音部分
  /// 声音总开关
  switchAllVoice(bool isOpen) {
    debugPrint('switchAllVoice is $isOpen');
    state.soundSwitch.value = isOpen;
    globalController.setVoiceSwitch(isOpen);

    updateGameVoice(isOpen ? 50 : 0);
    updateGameYinX(isOpen ? 50 : 0);
    updateSeneVoice(isOpen ? 50 : 0);
  }

  /// 游戏声音
  updateGameVoice(double gameVoice) {
    state.gameVoice.value = gameVoice;
    globalController.setGameVoice(gameVoice);

    /// TODO:
  }

  /// 游戏音效
  updateGameYinX(double gameYinX) {
    state.gameYinX.value = gameYinX;
    globalController.setGameYinX(gameYinX);

    /// TODO:
  }

  /// 现场音效
  updateSeneVoice(double seneVoice) {
    state.sceneVoice.value = seneVoice;
    globalController.setSeneVoice(seneVoice);

    /// TODO:
  }

  @override
  void onInit() {
    super.onInit();

    // 皮肤 浅色、深色、自动
    final bgmode = StorageUtil().getInt(StorageUtil.KEY_APP_BG_MODE);
    state.skinSwitcherSelectIndex.value = bgmode;
    updateLuZModeDisplay(bgmode);

    // 语言 简体中文
    final languageCode = TranslationService.locale?.languageCode;
    lSelIndex = lConfig[languageCode] ?? 0;
    state.languageString.value = languageNames[lSelIndex];

    // 路纸模式
    final luzhiV = globalController.lzBgMode.value;
    state.luzhiSwitcherSelectIndex.value = luzhiV;

    // 现场视频
    final seneVideo = globalController.isSeneVideo.value;
    state.videoSwitch.value = seneVideo;

    // 快速换桌
    final changeTable = globalController.isQChangeTable.value;
    state.quickChangeTable.value = changeTable;

    // 快速下注
    final quikBet = globalController.isQuikBet.value;
    state.quickBet.value = quikBet;

    // 声音总开关
    final voice = globalController.soundSwitch.value;
    state.soundSwitch.value = voice;

    // 游戏语音
    final gvoice = globalController.gameVoice.value;
    state.gameVoice.value = gvoice;

    // 游戏音效
    final gYinx = globalController.gameYinX.value;
    state.gameYinX.value = gYinx;

    // 游戏音效
    final sVoice = globalController.sceneVoice.value;
    state.sceneVoice.value = sVoice;

    // 语音 语种
    vSelIndex = globalController.voice.value;
    state.voiceString.value = voiceNames[vSelIndex];
  }
}
