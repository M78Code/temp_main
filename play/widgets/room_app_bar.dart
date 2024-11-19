import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:get/get.dart';

class RoomAppBar extends GetView<PlayRoomController>
    implements PreferredSizeWidget {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  @override
  Widget build(BuildContext context) {
    // 获取状态栏高度
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Obx(() {
      return AppBar(
        backgroundColor: globalController.mAppBgMode.value == 1
            ? AppColors.lightBackgroundColor01
            : AppColors.darkBackgroundColor01,
        centerTitle: true,
        // 标题文字
        flexibleSpace: Center(
            child: Padding(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Text("DP真人",
              style: TextStyle(
                  fontSize: 18,
                  color: globalController.mAppBgMode.value == 1
                      ? AppColors.darkCommonColor01
                      : AppColors.lightCommonColor01)),
        )),
        // 左侧退出按钮
        leading: IconButton(
          icon: Icon(Icons.close),
          color: globalController.mAppBgMode.value == 1
              ? AppColors.darkCommonColor01
              : AppColors.lightCommonColor01,
          onPressed: () {
            controller.onTapClose();
          },
        ),
        // 右侧Appbar按钮
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: buildAppBarRightBtn(),
          )
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(44);

  /// 顶部导航栏 右侧按钮 封装 (金币图案+金币值)
  Widget buildAppBarRightBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // 内边距
      decoration: BoxDecoration(
        color: globalController.mAppBgMode.value == 1
            ? AppColors.lightBackgroundColor02
            : AppColors.darkBackgroundColor02, // 背景色
        borderRadius: BorderRadius.circular(30), // 圆角背景
        boxShadow: [
          // 阴影效果
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // 增加模糊半径，使阴影更柔和
            blurRadius: 4, // 调整阴影的偏移
            offset: Offset(0, 2), // 使阴影更贴合组件边缘，减少扩散
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // 适应内容的最小宽度
        children: [
          // 圆形图标部分
          const CircleAvatar(
            radius: 8, // 图标圆形的半径
            backgroundColor: Colors.orange, // 背景颜色
            child: Icon(
              Icons.currency_yuan, // 使用内置的人民币符号
              color: Colors.white,
              size: 12,
            ),
          ),
          SizedBox(width: 8), // 图标和文本的间距
          // 文本部分
          Text(
            '0.00',
            style: TextStyle(
              color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightTextColor01
                  : AppColors.darkTextColor01, // 文本颜色
              fontWeight: FontWeight.bold, // 加粗字体
              fontSize: 12, // 字体大小
            ),
          ),
        ],
      ),
    );
  }
}
