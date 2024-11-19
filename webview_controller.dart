import 'package:flutter/material.dart';
import 'package:flutter_main/utils/navigator_util.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../loading.dart';

class WebPageController extends GetxController {
  late final WebViewController webC;
  final defaultUrl = ''; // 默认地址
  var htmlUrl = '';
  var pageTitle = ''.obs;

  // h5交互channel
  final h5Channel = 'FlutterWebviewPlugin';
  // h5交互关闭msg
  final closeH5 = 'closeH5';

  @override
  void onInit() async {
    await initWebC();
    super.onInit();
  }

  @override
  void onClose() async {
    // await onClearCache();
    super.onClose();
  }

  initWebC() {
    webC = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..addJavaScriptChannel(h5Channel, onMessageReceived: (message) {
        final msg = message.message;
        debugPrint("Received message: $msg");
        if (msg == closeH5) {
          closeH5Event();
        }
      })
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            if (progress == 100) {
              Loading.dismiss();
            }
            final currentTime = DateTime.now();
            debugPrint('网页加载进度：$progress time: $currentTime');
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            if (url.startsWith('http')) {
              pageTitle.value = await webC.getTitle() ?? '';
            } else {
              pageTitle.value = Get.arguments["title"] ?? '';
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );
    Loading.show();
    if (Get.arguments == null) {
      onLoadUrlString(defaultUrl);
    } else {
      final url = Get.arguments['url'];
      if (url == null) {
        final html = Get.arguments['html'];
        if (html == null) {
          onLoadUrlString(defaultUrl);
        } else {
          onLoadHtmlString(html);
        }
      } else {
        if ('$url'.startsWith('http')) {
          htmlUrl = url;
          onLoadUrlString(url);
        } else {
          // 参数不合规，加载默认地址
          onLoadUrlString(defaultUrl);
        }
      }
    }
  }

  Future<void> onLoadHtmlString(String html) {
    return webC.loadHtmlString(html);
  }

  Future<void> onLoadUrlString(String url) {
    return webC.loadRequest(Uri.parse(url));
  }

  Future<void> onClearCache() async {
    await webC.clearCache();
    await webC.clearLocalStorage();
  }

  closeH5Event() async {
    await onClearCache();
    NavigatorUtil.back();
    // await webC.reload();
  }
}
