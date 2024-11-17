import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controller.dart';
import '../../../generated/r.dart';
import '../../../utils/base/base_text.dart';
import '../play_room/play_room_controller.dart';
import '../play_router.dart';
import 'cell/tabbarCell.dart';
import 'game_controller.dart';
import 'game_model.dart';
import 'page/game_classical_page.dart';
import 'page/gema_dragon_tiger_page.dart';
import 'page/gema_feature_page.dart';
import 'page/gema_roulette_page.dart';
import 'page/gema_sic_bo_page.dart';

class SwitchGamesPage extends StatefulWidget {
  @override
  _SwitchGamesPageState createState() {
    return _SwitchGamesPageState();
  }
}

class _SwitchGamesPageState extends State<SwitchGamesPage>
    with SingleTickerProviderStateMixin {
  RxInt selectRow = 0.obs;

  PlayRoomController controller = PlayRoomController.controller;
  late List<GamePageModel> list = [];
  late TabController _tabController;

  @override
  void initState() {
    list = [
      GamePageModel(name: '经典', groupId: 27, page: GameClassicalPage()),
      GamePageModel(name: '特色', groupId: 35, page: GemaFeaturePage()),
      GamePageModel(name: '龙虎', groupId: 39, page: GemaDragonTigerPage()),
      GamePageModel(name: '轮盘', groupId: 29, page: GemaRoulettePage()),
      GamePageModel(name: '骰宝', groupId: 31, page: GemaSicBoPage()),
    ];
    var index = 0;

    switch (PlayRouter.mGroupId) {
      case 35:
        index = 1;
      case 39:
        index = 2;
      case 29:
        index = 3;
      case 31:
        index = 4;
    }
    selectRow.value = index;

    _tabController = TabController(
        length: list.length, initialIndex: selectRow.value, vsync: this);
    for (GamePageModel item in list) {
      Get.lazyPut(() => GameController(tag: item.name, groupId: item.groupId),
          tag: item.name);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String str =
        GlobalController.CheckWhiteBlack(R.lightTagCenter, R.darkTagCenter);
    Rect? centerSlice;
    if (selectRow.value == 0) {
      str = GlobalController.CheckWhiteBlack(R.lightTagLeft, R.darkTagLeft);
    } else if (selectRow.value == 4) {
      str = GlobalController.CheckWhiteBlack(R.lightTagRight, R.darkTagRight);
    } else {
      centerSlice = Rect.fromLTRB(0, 0, 444, 132);
    }
    return Column(
      children: [
        TabBarCellWidget(
          tabs: buildTagList(),
          controller: _tabController,
          size: 60,
          indicator: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(str),
            fit: BoxFit.fill,
            centerSlice: centerSlice,
          )),
          onTap: (row) {
            setState(() {
              selectRow.value = row;
              _tabController.index = row;
            });

            var md = list[row];
            GameController c = Get.find<GameController>(tag: md.name);
            c.onSendWSocket();
          },
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: list.map((e) => e.page).toList(),
        )),
      ],
    );
  }

  List<Widget> buildTagList() {
    List<Widget> arr = [];
    list.asMap().forEach((index, e) {
      arr.add(itemCell(index, e.name));
    });
    return arr;
  }

  Widget itemCell(int row, String name) {
    if (row == selectRow.value) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            R.darkTagSelete,
            width: 8,
            fit: BoxFit.fitWidth,
          ),
          Expanded(
              child: ZsText(
            name,
            color: GlobalController.CheckWhiteBlack(
                Color(0xFF30425C), Color(0xFFDCDCDC)),
            fontSize: 14,
            left: 5,
          ))
        ],
      );
    }
    return Tab(text: name);
  }

  @override
  void dispose() {
    for (GamePageModel item in list) {
      Get.delete<GameController>(tag: item.name);
    }
    super.dispose();
  }
}
