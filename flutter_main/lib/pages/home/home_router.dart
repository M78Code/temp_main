import 'package:flutter_main/pages/home/custom-widget-tabs.widget.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:flutter_main/utils/Commond/widget/webview/webview_page.dart';
import 'package:get/get.dart';

class HomeRouter extends BaseRouterAbstract {
  static const String home = '/home';
  static const String webView = '/webView';

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        name: home,
        page: () => const CustomWidgetExample(),
      ),
      GetPage(
        transition: Transition.downToUp,
        name: webView,
        page: () => WebPage(),
      ),
    ]);
  }
}
