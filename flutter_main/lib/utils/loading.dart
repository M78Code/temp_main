import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// 提示框
class Loading {
  static const int _milliseconds = 500; // 提示 延迟毫秒, 提示体验 秒关太快
  static const int _dismissMilliseconds = 20 * 000; // dismiss 延迟毫秒

  Loading() {
    EasyLoading.instance
      ..displayDuration =
      const Duration(milliseconds: _dismissMilliseconds) // 关闭延迟
      ..loadingStyle = EasyLoadingStyle.custom // loading样式 自定义
      ..backgroundColor = const Color(0x66000000) // 背景颜色
      ..textColor = Colors.white // 文字颜色
      ..userInteractions = false // 用户交互
      ..indicatorColor = Colors.white // 指示器颜色
      ..progressColor = Colors.white; // 遮罩颜色
  }

  // 显示
  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.show(status: text ?? 'Loading...');
  }

  // 错误
  static void error([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
          () => EasyLoading.showError(text ?? 'Error'),
    );
  }

  // 成功
  static void success([String? text]) {
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
          () => EasyLoading.showSuccess(text ?? 'Success'),
    );
  }

  // toast
  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  // 关闭
  static Future<void> dismiss() async {
    await Future.delayed(
      const Duration(milliseconds: _dismissMilliseconds),
          () {
        EasyLoading.instance.userInteractions = true; // 恢复交互操作
        EasyLoading.dismiss();
      },
    );
  }

  static void showNetLoading([String? text]) {
    if(EasyLoading.isShow) return;
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.show(status: text ?? 'Loading...', indicator: const LoadingWidget());
  }

  static void hideNetLoading() {
    if(EasyLoading.isShow) {
      EasyLoading.dismiss(animation: false);
    }
  }
}


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}