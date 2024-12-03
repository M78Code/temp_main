import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/global_controller.dart';
import '../../../../generated/r.dart';
import '../../../road/road_home_setting_page.dart';
import '../base/game_base_page.dart';

class GemaRoadPage extends GameBasePage {
  ///好路设置
  static Future ShowCustomModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const RoadHomeSettingPage();
        });
  }

  String type = '好路';

  @override
  String? get tag => type;

  @override
  Widget buildFloatingActionBottom() {
    return IconButton(
        onPressed: onTagBottomAction,
        icon: Image.asset(
          GlobalController.CheckWhiteBlack(R.lightGemaRoad, R.darkGemaRoad),
          width: 34,
          height: 34,
        ));
  }

  @override
  onTagBottomAction({BuildContext? context}) {
    GemaRoadPage.ShowCustomModalBottomSheet(Get.context!).then((v) {
      if ((v is bool) && v == true) {
        controller.onUpdateDataRoad();
      }
    });
  }
}
