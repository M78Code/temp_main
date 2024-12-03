// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/utils/navigator_util.dart';
import 'package:flutter_main/utils/widget_extension.dart';
import 'package:get/get.dart';

import '../../configs/app_colors.dart';
import '../../r.dart';
import '../../widgets/images.dart';


class BaseWidget extends StatelessWidget {
  BaseWidget({Key? key}) : super(key: key);
  Widget body = Container();
  Widget? bottomNavigationBar;
  Widget? titleView;

  ///导航栏文字
  String? title;

  ///是否需要顶部的渐变背景, 默认需要， 如果设置为false就是纯白背景
  bool needShaderBg = false;

  ///返回按钮位置的view
  Widget? leading;
  double? leadingWidth;
  Color? mainBg;

  ///默认有返回按钮
  bool isBack = true;
  List<Widget>? actions;

  ///默认添加safeArea
  bool isSafeArea = true;

  final GlobalController globalController = GlobalController.controller;

  ///用于控制 body 组件是否延伸到 AppBar 后面。当 extendBodyBehindAppBar 为 true 时，body 组件不仅会占用导航栏，还会占用状态栏
  bool extendBodyBehindAppBar = true;
  late BuildContext _context;

  BuildContext get context => _context;
  PreferredSize? appBar;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Obx(() {
      return Scaffold(
          backgroundColor: globalController.mAppBgMode.value == 1
              ? AppColors.lightBackgroundColor01
              : AppColors.darkBackgroundColor01,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          appBar: appBar ??
              AppBar(
                centerTitle: true,
                title: titleView ??
                    Text(
                      title ?? '',
                      style: TextStyle(
                          color: globalController.mAppBgMode.value == 1 ? AppColors.appbarTextColorLight : AppColors.appbarTextColorDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                leadingWidth: leadingWidth ?? 40,
                actions: actions,
                backgroundColor: Colors.transparent,
                leading: leading ?? (isBack ? _leading() : Container()),
              ),
          body: isSafeArea ? body.safeArea() : body,
          bottomNavigationBar: bottomNavigationBar?.safeArea(bottom: false));
    });
  }

  Widget _leading() {
    return Images(path: globalController.mAppBgMode.value == 1 ? R.commonLightIcReturn : R.commonDarkIcReturn, scale: 3,).inkWell(() => backEvent());
  }

  ///返回事件 , isBack == true 才能生效 ,默认有返回按钮
  void backEvent() {
    NavigatorUtil.back();
  }
}

