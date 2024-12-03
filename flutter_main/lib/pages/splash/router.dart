import 'package:flutter_main/pages/splash/index.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashRouter extends BaseRouterAbstract {

  static const String splash = '/';

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        name: splash,
        page: () => const SplashPage(),
      ),
    ]);
  }

}