import 'package:flutter/material.dart';
import 'package:flutter_main/components/road/custom_switch_btn.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/pages/userProfile/user_profile_router.dart';
import 'package:get/get.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:volume_controller/volume_controller.dart';

///  首页好路 顶部 用户个人信息
class RoadHomeAccountInfo extends StatefulWidget {
  RoadHomeAccountInfo({super.key});
// 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;
  @override
  State<RoadHomeAccountInfo> createState() => _RoadHomeAccountInfoState();
}

class _RoadHomeAccountInfoState extends State<RoadHomeAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return buildAccountInfo(widget.globalController);
  }

  /// 构建顶部账户信息部分 (分为上下两部分组成)
  Widget buildAccountInfo(GlobalController globalController) {
    return Obx(() {
      return Container(
        // padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 0), //设置外边距
        decoration: BoxDecoration(
          color: globalController.mAppBgMode.value == 1
              ? AppColors.lightBackgroundColor03
              : AppColors.darkBackgroundColor03,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), // 左上角圆角半径
            topRight: Radius.circular(20), // 右上角圆角半径
            bottomLeft: Radius.circular(10), // 左下角圆角半径
            bottomRight: Radius.circular(10), // 右下角圆角半径
          ),
          border: Border(
            // 设置边框
            left: BorderSide(
              color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightCommonColor01
                  : AppColors.darkLineColor01, // 左边框颜色
              width: 1.0, // 左边框宽度
            ),
            right: BorderSide(
              color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightCommonColor01
                  : AppColors.darkLineColor01, // 右边框颜色
              width: 1.0, // 右边框宽度
            ),
            bottom: BorderSide(
              color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightCommonColor01
                  : AppColors.darkLineColor01, // 下边框颜色
              width: 1.0, // 下边框宽度
            ),
          ),
        ),
        child: Column(
          children: [
            // 上半部分(头像 金额 日间夜间模式 声音)
            buildAccountInfoTop(globalController),
            // 下半部分(文字跑马灯 桌号)
            buildAccountInfoBottom(globalController),
          ],
        ),
      );
    });
  }

  /// 构建用户info的上半部分
  Widget buildAccountInfoTop(GlobalController globalController) {
    // 是否打开了小眼睛按钮  true:打开状态  false:关闭状态
    RxBool _isOpenEye = true.obs;
    String headPic =
        WebsocketController.controller.mWs10000Model.value.data?.headPic ?? '';
    return Obx(() {
      return Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0), //设置内部边距
        height: 40,
        decoration: BoxDecoration(
          // color:  globalController.checkWhiteBlack(AppColors.lightBackgroundColor02, AppColors.darkBackgroundColor02), //AppColors.lightBackgroundColor02, // 背景颜色
          gradient: LinearGradient(
            colors: globalController.mAppBgMode.value == 1
                ? [
                    AppColors.lightBackgroundColor02,
                    AppColors.lightBackgroundColor02
                  ] // 白天模式渐变
                : [
                    AppColors.darkBackgroundColor02,
                    AppColors.darkBackgroundColor05
                  ], // 夜间模式渐变
            begin: Alignment.centerLeft, // 从左侧开始
            end: Alignment.centerRight, // 到右侧结束
          ),
          borderRadius: BorderRadius.circular(20), // 圆角
          border: Border.all(
            // 设置边框
            color: globalController.mAppBgMode.value == 1
                ? AppColors.lightCommonColor01
                : AppColors.darkLineColor01, // 边框颜色
            width: 1.0, // 边框宽度
          ),
          // 设置一个阴影效果 立体感
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center, // 子组件横向居中对齐
          crossAxisAlignment: CrossAxisAlignment.center, // 子组件纵向居中对齐
          children: [
            // 头像
            GestureDetector(
                onTap: () {
                  Get.toNamed(UserProfileRouter.UserProfile);
                },
                child: headPic.isEmpty
                    ? const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.grey),
                      )
                    : CircleAvatar(
                        radius: 14,
                        backgroundImage: NetworkImage(
                          headPic,
                        ),
                      )),
            const SizedBox(width: 8),
            // 红色背景的Container
            Container(
              // color: Colors.red,// 背景颜色
              width: 16, // 给Container设置宽度
              height: 16, // 给Container设置高度
              alignment: Alignment.center, // 内容居中对齐
              child: Image.asset(globalController.mAppBgMode.value == 1
                  ? 'assets/images/road/dark/black_icon_coin.png'
                  : 'assets/images/road/light/icon_coin.png'), // Text可设置为需要的内容或占位符
            ),
            const SizedBox(width: 8),
            // 金钱的值
            Text(
                _isOpenEye.value
                    ? "${WebsocketController.controller.mBalance.value}"
                    : "********",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: globalController.mAppBgMode.value == 1
                        ? AppColors.lightTextColor02
                        : AppColors.darkTextColor02)),
            const SizedBox(width: 8),
            // 小眼睛按钮（打开 隐藏）
            Container(
              // color: Colors.red,// 背景颜色
              width: 16, // 给Container设置宽度
              height: 16, // 给Container设置高度
              alignment: Alignment.center, // 内容居中对齐
              child: GestureDetector(
                child: _isOpenEye.value
                    ? Image.asset(globalController.mAppBgMode.value == 1
                        ? 'assets/images/road/dark/black_yue_icon_kai2.png'
                        : 'assets/images/road/light/yue_icon_on.png')
                    : Image.asset(globalController.mAppBgMode.value == 1
                        ? 'assets/images/road/dark/black_yue_icon_off.png'
                        : 'assets/images/road/light/yue_icon_off.png'),
                onTap: () {
                  _isOpenEye.value = !_isOpenEye.value;
                },
              ),
            ),

            // 中间控件占据剩余空间
            const Spacer(),
            // 日间夜间切换按钮
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13), // 圆角
                border: Border.all(
                  // 设置边框
                  color: globalController.mAppBgMode.value == 1
                      ? AppColors.lightCommonColor01
                      : AppColors.darkLineColor01, // 边框颜色
                  width: 1.0, // 边框宽度
                ),
                // 设置一个阴影效果 立体感
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CustomSwitchBtn(
                // 0是白天  1是黑天
                initialValue: globalController.mAppBgMode.value == 1,
                onChanged: (value) {
                  print('Switch is now: $value');
                  globalController.skinSet(value ? 1 : 0);
                },
                onText: '日间',
                offText: '夜间',
                onImage: Image.asset('assets/images/road/light/day_on.png'),
                // 自定义开按钮图片
                offImage:
                    Image.asset('assets/images/road/dark/black_day_off.png'),
                // 自定义关按钮图片
                width: 56,
                // 自定义开关宽度
                height: 26,
                // 自定义开关高度
                imageSize: 24,
                // 自定义按钮图片大小
                backgroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    colors: globalController.mAppBgMode.value == 1
                        ? [
                            AppColors.lightBackgroundColor02,
                            AppColors.lightBackgroundColor02
                          ]
                        : [
                            AppColors.darkBackgroundColor02,
                            AppColors.darkBackgroundColor02
                          ],
                  ),
                ),
                // 自定义背景装饰
                onTextStyle: TextStyle(
                  color: AppColors.lightTextColor03,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                // 开状态的文字样式
                offTextStyle: TextStyle(
                  color: AppColors.lightTextColor03,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ), // 关状态的文字样式
              ),
            ),

            const SizedBox(width: 8),
            // 声音打开关闭按钮
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13), // 圆角
                border: Border.all(
                  // 设置边框
                  color: globalController.mAppBgMode.value == 1
                      ? AppColors.lightCommonColor01
                      : AppColors.darkLineColor01, // 边框颜色
                  width: 1.0, // 边框宽度
                ),
                // 设置一个阴影效果 立体感
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CustomSwitchBtn(
                initialValue: true,
                onChanged: (value) {
                  print('Switch is now: $value');
                  VolumeController()
                      .setVolume(true ? 0 : 1, showSystemUI: true);
                },
                onText: '声音',
                offText: '静音',
                onImage: Image.asset(
                    'assets/images/road/${globalController.mAppBgMode.value == 1 ? 'dark/black_' : 'light/'}sound_on.png'),
                // 自定义开按钮图片
                offImage: Image.asset(
                    'assets/images/road/${globalController.mAppBgMode.value == 1 ? 'dark/black_' : 'light/'}sound_off.png'),
                // 自定义关按钮图片
                width: 56,
                // 自定义开关宽度
                height: 26,
                // 自定义开关高度
                imageSize: 24,
                // 自定义按钮图片大小
                backgroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: globalController.mAppBgMode.value == 1
                        ? [
                            AppColors.lightBackgroundColor02,
                            AppColors.lightBackgroundColor02
                          ]
                        : [
                            AppColors.darkBackgroundColor02,
                            AppColors.darkBackgroundColor02
                          ],
                  ),
                ),
                // 自定义背景装饰
                onTextStyle: TextStyle(
                  color: AppColors.lightTextColor03,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                // 开状态的文字样式
                offTextStyle: TextStyle(
                  color: AppColors.lightTextColor03,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ), // 关状态的文字样式
              ),
            ),
          ],
        ),
      );
    });
  }

  /// 构建用户info的下半部分
  Widget buildAccountInfoBottom(GlobalController globalController) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0), //设置内部边距
        height: 26,
        // color: Colors.yellow,
        child: Row(
          children: [
            // 左侧的铃铛图片
            Container(
              // 背景颜色
              // color: Colors.red,
              // 给Container设置宽度
              width: 12,
              // 给Container设置高度
              height: 12,
              // 内容居中对齐
              alignment: Alignment.center,
              // 小铃铛图片
              child: globalController.mAppBgMode.value == 1
                  ? Image.asset(
                      'assets/images/road/dark/black_main_icon_gonggao-1.png')
                  : Image.asset(
                      'assets/images/road/light/main_icon_gonggao.png'),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                width: 200,
                child: TextScroll(
                  '${WebsocketController.controller.mNoticeContent.value}',
                  mode: TextScrollMode.endless,
                  // 滚动模式
                  velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                  // 滚动速度
                  delayBefore: Duration(milliseconds: 500),
                  // 延迟时间
                  pauseBetween: Duration(seconds: 1),
                  // 每次滚动后的暂停时间
                  style: TextStyle(
                      fontSize: 11,
                      color: globalController.mAppBgMode.value == 1
                          ? AppColors.lightTextColor03
                          : AppColors.darkTextColor03),
                  textAlign: TextAlign.right, // 文本对齐方式
                ),
              ),
            ),

            SizedBox(width: 8),

            Container(
              width: 16,
              height: 10,
              child: globalController.mAppBgMode.value == 1
                  ? Image.asset(
                      'assets/images/road/dark/black_main_icon_zhuotai.png')
                  : Image.asset(
                      'assets/images/road/light/main_icon_zhuotai.png'),
            ),

            SizedBox(width: 4),

            Text(
                "${WebsocketController.controller.mWs10000Model.value.data?.totalTable ?? 0}",
                style: TextStyle(
                    fontSize: 11,
                    color: globalController.mAppBgMode.value == 1
                        ? AppColors.lightTextColor03
                        : AppColors.darkTextColor03)),
          ],
        ),
      );
    });
  }
}
