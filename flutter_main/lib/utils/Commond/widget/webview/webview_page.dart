import 'package:flutter/material.dart';
import 'package:flutter_main/pages/base/base_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview_controller.dart';

/// 参数说明
/// title 标题，不传去document.title
/// url 加载网页链接
/// html 加载html字符串
/// url和html 必须传，不然加载默认地址
class WebPage extends BasePage {
  WebPage({super.key});

  final controller = Get.put(WebPageController());

  @override
  bool get isHiddeNav => true;

  @override
  Widget createBody(BuildContext context) {
    return WebViewWidget(
      controller: controller.webC,
    );
  }
}
