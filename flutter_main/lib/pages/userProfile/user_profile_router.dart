import 'package:flutter_main/pages/userProfile/bettingRecords/betting_records_page.dart';
import 'package:flutter_main/pages/userProfile/user_profile_page.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class UserProfileRouter extends BaseRouterAbstract {

  /// 个人中心
  // ignore: constant_identifier_names
  static const UserProfile = "/user_profile";
  /// 投注记录
  // ignore: constant_identifier_names
  static const BettingRecords = "/betting_records";

  @override
  void addRouters(List<GetPage> pages) {
    pages.addAll([
      GetPage(
        name: UserProfile,
        page: () => UserProfilePage(),
      ),
      GetPage(
        name: BettingRecords,
        page: () => BettingRecordsPage(),
      ),
    ]);
  }

}