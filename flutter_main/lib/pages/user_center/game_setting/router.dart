import 'package:flutter_main/pages/user_center/game_setting/view.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class GameSettingRouter extends BaseRouterAbstract {
  static const String gameSetting = '/game_setting';

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        name: gameSetting,
        page: () => GameSettingPage(),
      ),
    ]);
  }
}
