import 'package:flutter_main/pages/user_center/promo/view.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class PromoPageRouter extends BaseRouterAbstract {
  static const String promo = '/promo';

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        name: promo,
        page: () => PromoPage(),
      ),
    ]);
  }
}
