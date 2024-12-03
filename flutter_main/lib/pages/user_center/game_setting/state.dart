import 'package:get/get.dart';

class GameSettingState {
  GameSettingState() {
    ///Initialize variables
  }

  ///皮肤模式 0浅 1深 2自动（7-22点为  白天皮肤  22-05点 夜晚皮肤）
  var skinSwitcherSelectIndex = 0.obs;

  /// 语言
  var languageString = '简体中文'.obs;

  /// 语音
  var voiceString = '普通话'.obs;

  /// 声音总开关
  var soundSwitch = false.obs;

  /// 游戏语音
  RxDouble gameVoice = 50.0.obs;

  /// 游戏音效
  RxDouble gameYinX = 50.0.obs;

  /// 现场音效
  RxDouble sceneVoice = 50.0.obs;

  ///路纸模式 0浅 1深
  var luzhiSwitcherSelectIndex = 0.obs;

  /// true显示 false隐藏
  RxBool isDisplay = false.obs;

  ///现场视频开关
  var videoSwitch = false.obs;

  ///快速换桌
  var quickChangeTable = false.obs;

  /// 快速投注
  var quickBet = false.obs;
}
