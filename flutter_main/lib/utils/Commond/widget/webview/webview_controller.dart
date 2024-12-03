import 'package:flutter/material.dart';
import 'package:flutter_main/utils/navigator_util.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageController extends GetxController {
  late final WebViewController webC;
  final defaultUrl = ''; // 默认地址
  var htmlUrl = '';
  var pageTitle = ''.obs;

  final closeH5 = 'closeH5';

  // final htmlString = '''
  //   <!DOCTYPE html>
  //   <head>
  //   <title>webview demo | IAM17</title>
  //   <meta name="viewport" content="width=device-width, initial-scale=1.0,
  //     maximum-scale=1.0, user-scalable=no,viewport-fit=cover" />
  //   <style>
  //   *{
  //     margin:0;
  //     padding:0;
  //   }
  //   body{
  //     background:#BBDFFC;
  //     display:flex;
  //     justify-content:center;
  //     align-items:center;
  //     height:100px;
  //     color:#C45F84;
  //     font-size:20px;
  //   }
  //   </style>
  //   </head>
  //   <html>
  //  <body>
  //   <div class="content">大家好，我是 17</div>
  //   <script>
  //       const resizeObserver = new ResizeObserver(entries =>
  //             ABD.postMessage('test_adf'))
  //       resizeObserver.observe(document.body)
  //   </script>
  //   </body>
  //   </html>
  //   ''';
  // 调用js：webC.runJavaScriptReturningResult('document.scrollingElement.scrollHeight');

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
      ..addJavaScriptChannel('closeH5', onMessageReceived: (message) {
        closeH5Event();
      })
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
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
