import 'package:flutter/material.dart';
import 'package:flutter_main/utils/hex_color.dart';

/// 此项目分为日间夜间模式颜色 ❤️请各位小伙伴开发过程中按格式写注释哦 --- by Winter
class AppColors {
  /// 各个颜色有描述使用部位，可对照项目去参考色值
  /// 注释格式: "项目位置(可以写多个) ｜ 使用方式(可以写多个) ｜ 日夜间模式"
  /// 日间 夜间 色值写在一起，方便查看
  ///

  /// Common｜ 背景 纯白 ｜ 日间模式
  static Color lightCommonColor01 = HexColor("#FFFFFF", opacity: 1.0);
  /// Common ｜ 背景 ｜ 夜间模式
  static Color darkCommonColor01 = HexColor("#000000", opacity: 1.0);

  /// 首页头部appbar ｜ 背景 0.5透明度 纯白 ｜ 日间模式
  static Color lightCommonColor02 = HexColor("#FFFFFF", opacity: 0.5);
  /// 首页头部appbar ｜ 背景 ｜ 夜间模式
  static Color darkCommonColor02 = HexColor("#FFFFFF", opacity: 0.5);


  /// 首页好路 ｜ 背景颜色 ｜ 日间模式
  static Color lightBackgroundColor01 = HexColor("#F2F6FF", opacity: 1.0);
  /// 首页好路 ｜ 背景颜色 ｜ 夜间模式
  static Color darkBackgroundColor01 = HexColor("#252831", opacity: 1.0);

  /// 首页头部info ｜ 上半部分背景 ｜ 日间模式
  static Color lightBackgroundColor02 = HexColor("#F6F8FF", opacity: 0.7);
  /// 首页头部info ｜ 上半部分背景 ｜ 夜间模式
  static Color darkBackgroundColor02 = HexColor("#15171F", opacity: 0.7);

  /// 首页头部info ｜ 下半部分背景 ｜ 日间模式
  static Color lightBackgroundColor03 = HexColor("#F6F8FF", opacity: 0.5);
  /// 首页头部info ｜ 下半部分背景 ｜ 夜间模式
  static Color darkBackgroundColor03 = HexColor("#272E41", opacity: 0.5);

  /// 首页弹窗 ｜ 背景 ｜ 日间模式
  static Color lightBackgroundColor04 = HexColor("#F6F8FF", opacity: 1.0);
  /// 首页弹窗 ｜ 背景 ｜ 夜间模式
  static Color darkBackgroundColor04 = HexColor("#F6F8FF", opacity: 1.0);

  /// 首页弹窗 ｜ 背景 ｜ 日间模式
  static Color lightBackgroundColor05 = HexColor("#F6F8FF", opacity: 0.7);
  /// 首页弹窗 ｜ 背景 ｜ 夜间模式
  static Color darkBackgroundColor05 = HexColor("#3F4460", opacity: 0.7);

  /// 首页路子图 ｜ 背景 ｜ 日间模式
  static Color lightBackgroundColor06 = HexColor("#F6F9FF", opacity: 1.0);
  /// 首页路子图 ｜ 背景 ｜ 夜间模式
  static Color darkBackgroundColor06 = HexColor("#292431", opacity: 1.0);

  /// 首页主播列表｜ 上半部分 状态文字 背景 ｜ 日间模式
  static Color lightBackgroundColor07 = HexColor("#000000", opacity: 0.6);
  /// 首页主播列表｜ 上半部分 状态文字 背景 ｜ 夜间模式
  static Color darkBackgroundColor07 = HexColor("#000000", opacity: 0.6);

  /// 首页主播列表｜ 下部分 统计 背景 ｜ 日间模式
  static Color lightBackgroundColor08 = HexColor("#FBFBFF", opacity: 1.0);
  /// 首页主播列表｜ 下部分 统计 背景 ｜ 夜间模式
  static Color darkBackgroundColor08 = HexColor("#333C50", opacity: 1.0);

  /// 首页主播列表｜ 下部分 统计 背景 ｜ 日间模式
  static Color lightBackgroundColor09 = HexColor("#EEF1F4", opacity: 1.0);
  /// 首页主播列表｜ 下部分 统计 背景 ｜ 夜间模式
  static Color darkBackgroundColor09 = HexColor("#282F40", opacity: 1.0);

  /// 首页个人Info｜金币值颜色 ｜ 日间模式
  static Color lightTextColor01 = HexColor("#243659", opacity: 1.0);
  /// 首页个人Info｜金币值颜色 ｜ 夜间模式
  static Color darkTextColor01 = HexColor("#DCDCDC", opacity: 1.0);

  /// 首页个人Info｜switch按钮文字颜色 ｜ 日间模式
  static Color lightTextColor02 = HexColor("#293E5F", opacity: 1.0);
  /// 首页个人Info｜switch按钮文字颜色 ｜ 夜间模式
  static Color darkTextColor02 = HexColor("#DCDCDC", opacity: 0.9);


  /// 首页个人Info｜switch按钮文字颜色 ｜ 日间模式
  static Color lightTextColor03 = HexColor("#657293", opacity: 1.0);
  /// 首页个人Info｜switch按钮文字颜色 ｜ 夜间模式
  static Color darkTextColor03 = HexColor("#DCDCDC", opacity: 1.0);

  /// 首页个人Info｜列表文字颜色 ｜ 日间模式
  static Color lightTextColor04 = HexColor("#D5D5D5", opacity: 1.0);
  /// 首页个人Info｜列表文字颜色 ｜ 夜间模式
  static Color darkTextColor04 = HexColor("#D5D5D5", opacity: 1.0);

  /// 首页列表｜底部统计文字颜色 ｜ 日间模式
  static Color lightTextColor05 = HexColor("#7288AA", opacity: 1.0);
  /// 首页列表｜底部统计文字颜色 ｜ 夜间模式
  static Color darkTextColor05 = HexColor("#7288AA", opacity: 1.0);

  /// 首页列表｜极简模式顶部统计文字颜色 ｜ 日间模式
  static Color lightTextColor06 = HexColor("#1C386C", opacity: 1.0);
  /// 首页列表｜极简模式顶部统计文字颜色 ｜ 夜间模式
  static Color darkTextColor06 = HexColor("#DCDCDC", opacity: 1.0);

  /// 首页列表｜极简模式顶部统计文字颜色 比6号签｜ 日间模式
  static Color lightTextColor07 = HexColor("#7288AA", opacity: 1.0);
  static Color lightTextColor08 = HexColor("#7288AA", opacity: 0.8);
  /// 首页列表｜极简模式顶部统计文字颜色 ｜ 夜间模式
  static Color darkTextColor07 = HexColor("#DCDCDC", opacity: 1.0);
  static Color darkTextColor08 = HexColor("#DCDCDC", opacity: 0.6);

  /// 首页个人Info｜线的颜色 ｜ 日间模式
  static Color lightLineColor01 = HexColor("#FFFFFF", opacity: 1.0);
  /// 首页个人Info｜switch按钮文字颜色 ｜ 夜间模式
  static Color darkLineColor01 = HexColor("#FFFFFF", opacity: 0.2);



  /// 首页个人Info｜线的颜色 ｜ 日间模式
  static Color lightRoadLineColor01 = HexColor("#A9ADB43", opacity: 0.5);
  /// 首页个人Info｜switch按钮文字颜色 ｜ 夜间模式
  static Color darkRoadLineColor01 = HexColor("#A9ADB433", opacity: 0.2);

  /// Appbar title字体颜色 ｜ 日间模式
  static Color appbarTextColorLight = HexColor("#30425C", opacity: 1);
  /// Appbar title字体颜色 ｜ 夜间模式
  static Color appbarTextColorDark = HexColor("#DCDCDC", opacity: 1);

  static Color color_A6C3FF = HexColor("#A6C3FF", opacity: 0.1);
  static Color color_A6C3FF01 = HexColor("#A6C3FF", opacity: 0.15);
  static Color color_1f2433 = HexColor("#1f2433", opacity: 1);

  static Color color_55A3FF = HexColor("#55A3FF", opacity: 1);
  static Color color_C2CBD9 = HexColor("#C2CBD9", opacity: 1);

  static Color color_748EB2 = HexColor("#748EB2", opacity: 1);
  static Color color_5B708C = HexColor("#5B708C", opacity: 1);
  static Color color_E7EEF6 = HexColor("#E7EEF6", opacity: 1);
  static Color color_F4F9FF = HexColor("#F4F9FF", opacity: 1);
  static Color color_262D40 = HexColor("#262D40", opacity: 1);
  static Color color_7F8FA6 = HexColor("#7F8FA6", opacity: 1);
  static Color color_253D61 = HexColor("#253D61", opacity: 1);
  static Color color_337AF8 = HexColor("#337AF8", opacity: 1);

  /// 页面背景色
  static Color pageBackgroundColor(bool isDark) {
    if (isDark) {
      return const Color(0xFF262D40);
    }
    return const Color(0xFFF2F6FF);
  }

  /// 内容区背景色
  static Color contentBackgroundColor(bool isDark) {
    return isDark ? const Color(0xFF39425E).withOpacity(0.5) : const Color(0xFFFFFFFF).withOpacity(0.6);
  }

  /// 边框色
  static Color borderColor(bool isDark) {
    if (isDark) {
      return const Color(0xFF73A1FF).withOpacity(0.2);
    } else {
      return const Color(0xFFFFFFFF);
    }
  }

  /// 文字颜色 （常用于标题，凸显）
  static Color textColor01(bool isDark) {
    if (isDark) {
      return const Color(0xFFDCDCDC);
    } else {
      return const Color(0xFF1C386C);
    }
  }

  /// 文字颜色（常用于内容 summary）
  static Color textColor02(bool isDark) {
    if (isDark) {
      return const Color(0xFFDCDCDC).withOpacity(0.6);
    }
    return const Color(0xFF7288AA);
  }

  /// 分割线颜色
  static Color dividerColor(bool isDark) {
    if (isDark) {
      return const Color(0xFFA6C3FF).withOpacity(0.15);
    }
    return const Color(0xFFDEE5F4);
  }


  /// 首页路子格子｜线的颜色 ｜ 日间模式
  static Color lightRoadLineColor02 = HexColor("#000000", opacity: 0.04);

  static Color darkRoadLineColor02 = HexColor("#000000", opacity: 0.08);

  static Color lightRoadCircleColor01 = HexColor("#FFFFFF", opacity: 0.2);

  /// 游戏页 整个背景层
  static Color lightRoadBackColor01 = HexColor("#740426", opacity: 1.0);

  static Color lightRoadCircleBackColor01 = HexColor("#0B0B0C", opacity: 0.7);

  static Color lightRoadCircleBackColor02 = HexColor("#0B0B0C", opacity: 0.5);

  /// 游戏页｜游戏切换弹窗背景 ｜ 日间模式
  static Color lightGameSwitchBackColor01 = HexColor("#E2E7F3", opacity: 1.0);
  /// 游戏页｜游戏切换弹窗背景 ｜ 日间模式
  static Color darkGameSwitchBackColor01 = HexColor("#32394D", opacity: 1.0);

  /// 游戏页｜游戏切换背景 ｜ 日间模式
  static Color lightGameSwitchLineColor01 = HexColor("#FFFFFF", opacity: 0.5);
  /// 游戏页｜游戏切换背景 ｜ 日间模式
  static Color darkGameSwitchLineColor01 = HexColor("#52617B", opacity: 0.5);


  /// 游戏页｜游戏切换背景 ｜ 日间模式
  static Color lightGameSwitchFullBackColor01 = HexColor("#F4F9FF", opacity: 1.0);

  /// 游戏页｜游戏切换边框｜ 日间模式
  static Color lightGameSwitchBorderColor01 = HexColor("#6583AE", opacity: 0.8);

  /// 游戏页｜游戏切换文字颜色｜ 日间模式
  static Color lightGameSwitchTextColor01 = HexColor("#7288AA", opacity: 1.0);
  /// 游戏页｜游戏切换文字选中颜色｜ 日间模式
  static Color lightGameSwitchTextColor02 = HexColor("#30425C", opacity: 1.0);




  static Color room_0B0B0C = HexColor("#0B0B0C", opacity: 0.6);

}
