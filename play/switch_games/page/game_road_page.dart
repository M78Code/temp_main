import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/global_controller.dart';
import '../../../../controllers/websocket_controller.dart';
import '../../../../generated/r.dart';
import '../../../../models/ws/ws_10053_model.dart';
import '../../../road/road_home_setting_page.dart';
import '../../play_router.dart';
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
  int get itemCount => WebsocketController.controller.roadList.length;

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
  Widget buildTop(BuildContext context) {
    return SizedBox(
      height: 15,
    );
  }

  Ws10053TableModel getModel(int index) {
    var id = WebsocketController.controller.roadList[index];
    var model = WebsocketController.controller.roadMap[id]!;
    return model;
  }

  @override
  onTagBottomAction({BuildContext? context}) {
    GemaRoadPage.ShowCustomModalBottomSheet(Get.context!).then((v) {
      if ((v is bool) && v == true) {
        WebsocketController.controller.onUpdateDataRoad();
      }
    });
  }

  @override
  onItemTagClick(Ws10053TableModel md, int row) {
    PlayRouter.pushPlayRoom(
        cellData: md, row: row, list: WebsocketController.controller.roadList);
  }
}
