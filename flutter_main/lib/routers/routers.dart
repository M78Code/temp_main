import 'package:flutter_main/pages/home/home_router.dart';
import 'package:flutter_main/pages/login/router.dart';
import 'package:flutter_main/pages/userProfile/user_profile_router.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:get/get.dart';

import '../pages/user_center/game_setting/router.dart';
import '../pages/user_center/promo/router.dart';

class BaseRouter {
  static List<GetPage> get pageRouters {
    final List<GetPage> pages = [];
    LoginRouter().addRouters(pages);
    HomeRouter().addRouters(pages);
    UserProfileRouter().addRouters(pages);
    PlayRouter().addRouters(pages);
    GameSettingRouter().addRouters(pages);
    PromoPageRouter().addRouters(pages);
    return pages;
  }
}

abstract class BaseRouterAbstract {
  void addRouters(List<GetPage> pages);
}