import 'package:flutter/material.dart';
import 'package:flutter_main/pages/play/bet_on/index.dart';
import 'package:flutter_main/pages/play/operation/index.dart';
import 'package:flutter_main/pages/play/play_room/play_room_controller.dart';
import 'package:flutter_main/pages/play/table/index.dart';
import 'package:get/get.dart';

import '../gift/gift_page.dart';

class PlayRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayRoomController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: RoomAppBar(),
          body: Stack(
            children: [
              //背景层
              TablePage(),
              BetOnPage(),
              //操作层
              OperationPage(),
              IgnorePointer(
                ignoring: true, // true时事件会穿透
                child: GiftPage(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
