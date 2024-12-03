import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BasePage extends StatelessWidget {
  BasePage({super.key});

  final GlobalController globalController = GlobalController.controller;

  String get appBarTitle => "";
  bool get isHiddeNav => false;

  /// 是否需要全局 监听 变更 一般不需要 所以默认false
  bool get isGlobal => false;

  Widget createBody(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget buildContent(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(isHiddeNav ? 0 : 44.h),
          child: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.pageBackgroundColor(
                globalController.mAppBgMode.value == 2),
            title: Text(appBarTitle,
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColor01(
                        globalController.mAppBgMode.value == 2))),
            iconTheme: IconThemeData(
                color: AppColors.textColor01(
                    globalController.mAppBgMode.value == 2)),
          ),
        ),
        backgroundColor: AppColors.pageBackgroundColor(
            globalController.mAppBgMode.value == 2),
        body: createBody(context));
  }

  @override
  Widget build(BuildContext context) {
    return isGlobal ? Obx(() => buildContent(context)) : buildContent(context);
  }
}
