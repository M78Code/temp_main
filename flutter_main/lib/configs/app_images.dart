class AppImages {
  static String themeTagWith({required bool isDark}) {
    return isDark ? "dark" : "light";
  }

  /// 余额图片（参考个人中心余额）
  static String balanceImageWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/balance.png";

  /// 眼睛图标（参考个人中心）
  static String eyeImageWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/eye.png";

  /// 投注记录
  static String bettingRecordsWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/betting_records.png";

  /// 余额记录
  static String quotaRecordWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/quota_record.png";

  /// 游戏设置
  static String gameSettingWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/game_setting.png";

  /// 优惠活动
  static String discountActivityWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/discount_activity.png";

  /// 新手进阶
  static String noviceAdvancedWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/novice_advanced.png";

  /// 设置arrow
  static String rightArrowWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/right_arrow.png";

  /// 胶囊按钮背景图（投注记录顶部）
  static String capsuleBgImageNormalWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/capsule_normal.png";

  /// 胶囊按钮背景图-选中（投注记录顶部）
  static String capsuleBgImageSelectedWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/capsule_selected.png";

  /// 胶囊按钮背景图（优惠活动顶部）
  static String capsuleBgImageNormalWith1({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/capsule_normal1.png";

  /// 胶囊按钮背景图-选中（优惠活动顶部）
  static String capsuleBgImageSelectedWith1({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/capsule_selected1.png";

  static const arrowBottom = "assets/images/userProfile/arrow_bottom.png";

  static String checkboxNormalWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/checkbox_normal.png";

  static String checkboxSelectedWith({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/checkbox_selected.png";

  static const video = "assets/images/userProfile/video.png";

  static String videoButtonBgWith({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/video_button.png";

  static String roundButtonBg01_36With({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/round_button_bg01_36.png";

  static String roundButtonBg02_36With({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/round_button_bg02_36.png";

  static String roundButtonBg03_36With({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/round_button_bg03_36.png";

  static String diceIcon = "assets/images/userProfile/dice_icon.png";

  static String defaultHeaderWith({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/default_header.png";

  /// 矩形背景01
  static String reactBg01With({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/react_bg01.png";

  /// 优惠活动图片加载中的站位图
  static String activityLoad({required bool isDark}) =>
      "assets/images/userProfile/${themeTagWith(isDark: isDark)}/activity_load.png";

  /// 信号
  static String get signal03 => "assets/images/userProfile/signal03.png";

  /// 游戏内页-icon-start
  static const playRoomVideo = "assets/images/play/video.png";

  /// 键盘按钮背景图
  static String keyboardNormalBgWith({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/keyboard_normal.png";
  static String keyboardDoneBgWith({required bool isDark}) =>
      "assets/images/userProfile/singleImgs/${themeTagWith(isDark: isDark)}/keyboard_done.png";
  static String playRoomMore({required bool isClick}) => isClick
      ? "assets/images/play/more_s.png"
      : "assets/images/play/icon_play_more.png";
  static const playRoomHelp = "assets/images/play/help.png";
  static const playRoomInfo = "assets/images/play/info.png";
  static const playRoomGift = "assets/images/play/gift.png";
  static const playRoomTable = "assets/images/play/table.png";
  static const playRoomVoice = "assets/images/play/voice.png";
  static const playRoomMsg = "assets/images/play/icon_play_msg.png";
  static const playRoomRoad = "assets/images/play/icon_play_road.png";
  static const playRoomZhuan = "assets/images/play/icon_play_zhuan.png";
  static const betOnHelp = "assets/images/play/bet_on_top_help.png";
  static const betOnWarm = "assets/images/play/icon_warm.png";

  static const betOnBottomBg = "assets/images/play/bet_on_bottom_bg.png";
  //绿
  static const betOnTopAllGreenBg =
      "assets/images/play/bet_on_top_all_green_bg.png";
  //黄
  static const betOnTopAllYBg = "assets/images/play/bet_on_top_all_y_bg.png";
  //蓝绿红
  static const betOnTopBGRBg = "assets/images/play/bet_on_top_bgr_bg.png";
  //蓝红
  static const betOnTopBRBg = "assets/images/play/bet_on_top_br_bg.png";
  //蓝黄红
  static const betOnTopBYRBg = "assets/images/play/bet_on_top_byr_bg.png";

  /// 游戏内页-icon-end
}
