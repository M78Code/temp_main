import 'package:flutter_main/pages/login/index.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginRouter extends BaseRouterAbstract {

  static const String login = '/login';

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        name: login,
        page: () => const LoginPage(),
      ),
    ]);
  }

}