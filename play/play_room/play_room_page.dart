import 'package:flutter/material.dart';
import 'package:flutter_main/pages/play/operation/index.dart';
import 'package:flutter_main/pages/play/play_room/play_room_controller.dart';
import 'package:flutter_main/pages/play/table/index.dart';
import 'package:flutter_main/pages/play/widgets/bet_result_page.dart';
import 'package:get/get.dart';

import '../american/corona_page.dart';
import '../bet_on/bet_on_page.dart';
import '../gift/gift_page.dart';

class PlayRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayRoomController>(builder: (c) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: RoomAppBar(),
          body: Stack(
            children: [
              //背景层
              TablePage(),
              if (c.mGroupId == 29) CoronaPage(),
              if ([27, 35, 0].contains(c.mGroupId)) BetOnPage(),
              //操作层
              OperationPage(),
              IgnorePointer(
                ignoring: true, // true时事件会穿透
                child: GiftPage(),
              ),
              BetResultPage(),
            ],
          ),
        ),
      );
    });
  }
}
