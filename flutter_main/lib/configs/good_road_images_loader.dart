import 'package:get/get.dart';

/// 好路图片资源加载
///

class GoodRoadImagesLoader {
  static String themeTagWith({ required bool isDark }) {
    return isDark ? "dark" : "light";
  }

  // 设置
  static String goodRoadSettingIconWith(bool isDark) =>
      "assets/images/goodRoad/${themeTagWith(isDark: isDark)}/good_road_setting.png";
  // 刷新
  static String goodRoadRefreshIconWith(bool isDark) =>
      "assets/images/goodRoad/${themeTagWith(isDark: isDark)}/good_road_refresh.png";
  // 底部背景bar
  static String goodRoadBottomBarWith(bool isDark) =>
      "assets/images/goodRoad/${themeTagWith(isDark: isDark)}/good_road_bottom_bar.png";
  // 列表锁
  static String goodRoadItemLockWith(bool isDark) =>
      "assets/images/goodRoad/${themeTagWith(isDark: isDark)}/good_road_item_lock.png";
  static String goodRoadItemUnLockWith(bool isDark) =>
      "assets/images/goodRoad/${themeTagWith(isDark: isDark)}/good_road_item_unlock.png";

  /// @param goodRoadType:
  /// [
  ///  0: 无类型，1: 连闲，2: 连庄，3: 连跳(单挑)，4：长路转单跳，5：一庄两闲，6：一闲两庄 ，7：逢庄跳，8：逢闲跳，9：逢庄连，10：逢闲连，11：排排连
  /// ]
  /// @param num: 如果数字大于0，需要在标签前增加数字标签
  ///
  static List<String> goodRoadTagWith(int goodRoadType, {required int num}) {
    final languageCode = Get.locale?.languageCode ?? "cn";
    List<String> tagImgs = [];
    if (num > 0) {
      tagImgs.add('assets/images/goodRoad/tag/pic_haolu_no$num.png');
    }
    tagImgs.add('assets/images/goodRoad/tag/$languageCode/$goodRoadType.png');
    return tagImgs;
  }

  /// 下注区状态，闲、和、庄
  /// @param status: xian、he、zhuang
  static String bettingStatusWith(String status) {
    final languageCode = Get.locale?.languageCode ?? "cn";
    return "assets/images/goodRoad/$languageCode/$status.png";
  }

  /// 赔率
  /// 闲
  static String get oddsXian => "assets/images/goodRoad/odds/xian.png";
  /// 和
  static String get oddsHe => "assets/images/goodRoad/odds/he.png";
  /// 庄 1:1
  static String get oddsZhuang01 => "assets/images/goodRoad/odds/zhuang01.png";
  /// 庄 1:0.95
  static String get oddsZhuang02 => "assets/images/goodRoad/odds/zhuang02.png";
  static String oddsWith({ required String type }) => "assets/images/goodRoad/odds/$type.png";

  /// 下注取消
  static String get bettingCancel => "assets/images/goodRoad/cancel.png";
  /// 下注确定
  static String get bettingDone => "assets/images/goodRoad/done.png";
}