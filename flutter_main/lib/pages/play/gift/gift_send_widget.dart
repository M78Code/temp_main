import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:flutter_main/utils/base/base_text.dart';
import 'package:get/get.dart';

import '../../../models/event_model/websocket_event.dart';
import '../../../models/ws/ws_50023_model.dart';
import '../../../models/ws/ws_50024_model.dart';
import '../../../net/socket/base/Enum.dart';
import '../../../net/socket/websocket_manager.dart';
import '../../../utils/event_bus_util.dart';
import '../../../utils/hex_color.dart';
import '../play_room/play_room_controller.dart';

class GiftSendWidget extends StatefulWidget {
  static Future ShowCustomModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.red,
        context: context,
        builder: (BuildContext context) {
          return HYContainer(
            backgroundColor: HexColor.ColorHex('#252B3D'),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            padding: const EdgeInsets.only(top: 15),
            child: SafeArea(
              child: GiftSendWidget(),
            ),
          );
        });
  }

  @override
  _GiftSendWidgetState createState() {
    return _GiftSendWidgetState();
  }
}

class _GiftSendWidgetState extends State<GiftSendWidget> {
  RxInt selectRow = 0.obs;
  RxList<Ws50023GiftModel> gifts = <Ws50023GiftModel>[].obs;

  PlayRoomController controller = PlayRoomController.controller;

  @override
  void initState() {
    EventBusUtil.listen<WebSocketEvent>((e) {
      if (e.protocolId == 50023) {
        gifts.clear();
        var list =
            (e.value as List).map((e) => Ws50023GiftModel.fromJson(e)).toList();
        gifts.addAll(list);
        setState(() {});
      } else if (e.protocolId == 50024) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              giftViewBuild(context),
              buildBottom(context),
            ],
          )),
    );
  }

  Widget giftViewBuild(c) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: gifts.length,
        padding: const EdgeInsets.fromLTRB(7.5, 20, 7.5, 20),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 70 / 80,
        ),
        itemBuilder: (c, index) => itemBuild(c, index));
  }

  Widget itemBuild(BuildContext c, int index) {
    Ws50023GiftModel model = gifts[index];
    return Obx(() => GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              border: selectRow.value == index
                  ? Border.all(color: HexColor.ColorHex('#3AA0FE'), width: 2)
                  : null,
              color: Colors.blueGrey, // 设置边框颜色和宽度
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: model.presentImgUrl!.startsWith('http')
                          ? Image.network(
                              model.presentImgUrl ?? '',
                              width: 42,
                              height: 42,
                            )
                          : Image.asset(
                              'assets/images/play/${model.presentImgUrl ?? ''}.png',
                              width: 42,
                              height: 42,
                            ),
                    ),
                    Text(
                      model.presentName ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  height: 24,
                  alignment: Alignment.center,
                  color: selectRow.value == index
                      ? Colors.blue
                      : Colors.transparent,
                  child: Text(
                    '${model.presentPrice ?? 0}',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            selectRow.value = index;
          },
        ));
  }

  Widget buildBottom(BuildContext c) {
    return Obx(() {
      bool isShow = false;
      if (gifts.length > selectRow.value) {
        var model = gifts[selectRow.value];
        isShow = (WebsocketController.controller.mBalance.value ?? 0) >=
            (model.presentPrice ?? 0);
      }

      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '打赏荷官：性感荷官',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            HYContainer(
              padding: const EdgeInsets.fromLTRB(38, 10, 38, 10),
              backgroundImage: 'assets/images/common/light/back.png',
              backgroundImageFit: BoxFit.fitWidth,
              alignment: Alignment.center,
              child: ZsText(
                '打赏',
                color: Colors.white,
              ),
              onTap: () async {
                if (gifts.length <= selectRow.value) {
                  return;
                }
                var model = gifts[selectRow.value];
                PlayRoomController _controller = PlayRoomController.controller;
                var processData = {
                  "realTableId": _controller.model.tableId,
                  "rewardInfos": [
                    {
                      "type": 1, //类型：1、荷官打赏 2、桌边主播打赏 3、美女主播送礼
                      "bizId": 92628, //主播 id 或荷官 id
                      "rewardAmount": model.presentPrice, //打赏金额
                      "presentId": model.id //礼物 id
                    }
                  ],
                };
                await WebSocketManager.sendMessageSocket(
                    socketType: SocketType.LIVE_SEND_GIFT_REQUEST,
                    param: processData,
                    gameTypeId: _controller.model.gameTypeId,
                    tableId: _controller.model.tableId,
                    serviceType: 4);
                Ws50024Model model1 = Ws50024Model();
                var r1 = Result()
                  ..name = model.presentName
                  ..animationEffectFileUrls = model.animationEffectFileUrls
                  ..presentImgUrl = model.presentImgUrl;

                model1.result = [
                  r1,
                ];
                Navigator.pop(c);
                EventBusUtil.fire(WebSocketEvent(50024, value: model1));
              },
            ),
          ],
        ),
      );
    });
  }
}
