import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyRefresher extends StatefulWidget {
  const EasyRefresher({
    super.key,
    required this.easyRefreshController,
    this.onLoad,
    this.onRefresh,
    this.textColor = Colors.black,
    required this.childBuilder,
    this.indicatorPosition = IndicatorPosition.above,
  });

  // 颜色
  final Color? textColor;

  // EasyRefreshController实例，用于控制刷新和加载的状态
  final EasyRefreshController? easyRefreshController;

  // 加载回调函数
  final FutureOr<dynamic> Function()? onLoad;

  // 刷新回调函数
  final FutureOr<dynamic> Function()? onRefresh;

  // 构建子组件的回调函数
  final Widget Function(BuildContext context, ScrollPhysics physics)?
      childBuilder;

  // 指示器的位置，默认为上方
  final IndicatorPosition indicatorPosition;

  @override
  State<EasyRefresher> createState() => _EasyRefresherState();
}

class _EasyRefresherState extends State<EasyRefresher> {
  @override
  Widget build(BuildContext context) {
    return EasyRefresh.builder(
      // 在开始刷新时立即触发刷新
      refreshOnStart: true,
      // 刷新完成后重置刷新状态
      resetAfterRefresh: true,
      // 同时触发刷新和加载的回调函数
      simultaneously: true,
      // 加载回调函数
      onLoad: () async {
        await widget.onLoad?.call();
        setState(() {});
      },
      // 刷新回调函数
      onRefresh: () async {
        await widget.onRefresh?.call();
        setState(() {});
      },
      // 指定刷新时的头部组件
      header: ClassicHeader(
          hitOver: true,
          safeArea: true,
          // processedDuration: Duration.zero,
          showMessage: true,
          showText: true,
          position: widget.indicatorPosition,
          // 下面是一些文本配置
          processingText: 'refresh_header1'.tr,
          readyText: 'refresh_header1'.tr,
          armedText: 'refresh_header2'.tr,
          dragText: 'refresh_header3'.tr,
          processedText: 'refresh_header4'.tr,
          failedText: 'refresh_header5'.tr,
          iconTheme: IconThemeData(color: widget.textColor),
          textStyle: TextStyle(
            color: widget.textColor,
          ),
          messageStyle: TextStyle(color: widget.textColor)),
      // 指定加载时的底部组件
      footer: ClassicFooter(
          // processedDuration: Duration.zero,
          hitOver: true,
          showMessage: true,
          showText: true,
          position: widget.indicatorPosition,
          // 下面是一些文本配置
          noMoreText: 'refresh_footer1'.tr,
          processingText: 'refresh_footer2'.tr,
          processedText: 'refresh_footer3'.tr,
          readyText: 'refresh_footer2'.tr,
          armedText: 'refresh_footer4'.tr,
          dragText: 'refresh_footer5'.tr,
          failedText: 'refresh_footer6'.tr,
          iconTheme: IconThemeData(color: widget.textColor),
          textStyle: TextStyle(
            color: widget.textColor,
          ),
          messageStyle: TextStyle(color: widget.textColor)),
      controller: widget.easyRefreshController,
      childBuilder: widget.childBuilder,
    );
  }
}
