import 'package:flutter/material.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:flutter_main/utils/base/base_text.dart';
import 'package:flutter_main/utils/base/base_widget.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controller.dart';
import '../../../models/ws/ws_30002_model.dart';
import '../../../utils/hex_color.dart';
import '../play_room/play_room_controller.dart';
import 'chat_model.dart';

class ChatPage extends StatefulWidget {
  static Future ShowCustomModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return HYContainer(
            backgroundColor: GlobalController.CheckWhiteBlack(
                Colors.white, HexColor.ColorHex('#252B3D')),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: SafeArea(
              child: ChatPage(),
            ),
          );
        });
  }

  @override
  _ChatPageState createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {
  ///0：未选中， 1：快捷聊天；2:表情互动
  RxInt selectRow = 0.obs;

  PlayRoomController controller = PlayRoomController.controller;
  GlobalController _globalController = GlobalController.controller;

  ScrollController _scrollController = ScrollController();

  Rect _rect = const Rect.fromLTRB(40, 20, 130, 54);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.65,
      child: Obx(() => Column(
            children: [
              buildTop(context),
              messageBuild(context),
              buildBottom(context),
            ],
          )),
    ).intoInkeWell(onTap: () {
      if (selectRow.value != 0) {
        selectRow.value = 0;
      }
    });
  }

  Widget buildTop(BuildContext context) {
    var config1 = IconTypeConfig(
        selectIconDark: 'assets/images/play/chat/dark/bt_select.png',
        selectIconLight: 'assets/images/play/chat/light/bt_select.png',
        unselectIconDark: 'assets/images/play/chat/dark/bt_unselect.png',
        unselectIconLight: 'assets/images/play/chat/light/bt_unselect.png');
    String img1 = config1.getIcon(
        _globalController.mAppBgMode.value == 1, controller.isShowMass.value);
    return HYContainer(
      backgroundImage: 'assets/images/play/chat/dark/bt_bg.png',
      backgroundImageFit: BoxFit.fill,
      centerSlice: const Rect.fromLTRB(20, 20, 730, 80),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
              onPressed: () {
                controller.isShowMass.value = !controller.isShowMass.value;
              },
              icon: Image.asset(img1),
              label: ZsText(
                '在视频区显示',
                fontSize: 14,
                color: GlobalController.CheckWhiteBlack(
                    const Color(0xFF7288A9), const Color(0xFFDCDCDC)),
              )).marginOnly(left: 20),
          ZsText(
            '聊天',
            color: GlobalController.CheckWhiteBlack(
                const Color(0xFF253D61), Colors.white),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.clear_outlined,
                size: 20,
                color: GlobalController.CheckWhiteBlack(
                    const Color(0xFF253D61), Colors.white),
              )),
        ],
      ),
    );
  }

  Widget messageBuild(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      controller: _scrollController,
      itemBuilder: (c, index) {
        var md = controller.messList[index];
        if (index % 2 == 0) {
          if (md.messageType > 1) {
            return massageItemEmojiBuild(md, isMe: false);
          } else {
            return massageItemTextBuild(md, isMe: false);
          }
        } else {
          if (md.messageType > 1) {
            return massageItemEmojiBuild(md, isMe: true);
          } else {
            return massageItemTextBuild(md, isMe: true);
          }
        }
      },
      itemCount: controller.messList.length,
    ));
  }

  Widget massageItemTextBuild(Ws30002Model model, {bool isMe = true}) {
    return Row(
      children: [
        if (isMe) Expanded(child: Container()),
        HYContainer(
          margin: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          padding: const EdgeInsets.all(20),
          backgroundImage:
              'assets/images/play/chat/${_globalController.isDark ? 'dark' : 'light'}/chat_qipao_${isMe ? 'me' : 'you'}.png',
          backgroundImageFit: BoxFit.fill,
          centerSlice: _rect,
          child: ZsText(
            model.originContent ?? '',
            color: Colors.white,
          ),
        ),
        if (!isMe) Expanded(child: Container()),
      ],
    );
  }

  Widget massageItemEmojiBuild(Ws30002Model model, {bool isMe = true}) {
    String img = '';
    if (model.messageType == 2) {
      img = 'assets/images/play/chat/icon/${model.icon ?? ''}.png';
    } else if (model.messageType == 3) {
      img = 'assets/images/play/chat/chat_icon/${(model.icon ?? '').tr}.png';
    }
    double wh = Get.width * 0.186;
    return Row(
      children: [
        if (isMe) Expanded(child: Container()),
        HYContainer(
          margin: const EdgeInsets.fromLTRB(14, 10, 14, 10),
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          backgroundImage:
              'assets/images/play/chat/${_globalController.isDark ? 'dark' : 'light'}/chat_qipao_${isMe ? 'me' : 'you'}.png',
          backgroundImageFit: BoxFit.fill,
          centerSlice: _rect,
          child: Image.asset(
            img,
            width: wh,
            height: wh,
          ),
        ),
        if (!isMe) Expanded(child: Container()),
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    var config1 = IconTypeConfig(
        selectIconDark: 'assets/images/play/chat/dark/kuaijiedianji.png',
        selectIconLight: 'assets/images/play/chat/light/kuaijiedianji.png',
        unselectIconDark: 'assets/images/play/chat/dark/kuaijiedianji_un.png',
        unselectIconLight:
            'assets/images/play/chat/light/kuaijiedianji_un.png');
    String img1 =
        config1.getIcon(_globalController.isDark, selectRow.value == 1);

    var config2 = IconTypeConfig(
        selectIconDark: 'assets/images/play/chat/dark/biaoqing.png',
        selectIconLight: 'assets/images/play/chat/light/biaoqing.png',
        unselectIconDark: 'assets/images/play/chat/dark/biaoqing_un.png',
        unselectIconLight: 'assets/images/play/chat/light/biaoqing_un.png');
    String img2 =
        config2.getIcon(_globalController.isDark, selectRow.value == 2);

    Color selectColro =
        GlobalController.CheckWhiteBlack(const Color(0xFF1C386C), Colors.white);
    Color unselectColro = GlobalController.CheckWhiteBlack(
        const Color(0xFFA8B4C7), const Color(0xFFA8B4C7));

    return HYContainer(
      backgroundImage: 'assets/images/play/chat/dark/bg.png',
      backgroundImageFit: BoxFit.fill,
      centerSlice: const Rect.fromLTRB(20, 20, 740, 546),
      child: Column(
        children: [
          HYContainer(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: TextButton.icon(
                  onPressed: () {
                    if (controller.playerEnableChat.value == 0) {
                      if (selectRow.value == 1) {
                        selectRow.value = 0;
                      } else {
                        selectRow.value = 1;
                      }
                      _scrollToBottom();
                    } else {
                      controller.showMessToast();
                    }
                  },
                  label: ZsText(
                    '快捷聊天',
                    fontSize: 14,
                    color: selectRow.value == 1 ? selectColro : unselectColro,
                  ),
                  icon: Image.asset(
                    img1,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                )),
                const HYContainer(
                  width: 1,
                  height: 20,
                  backgroundColor: Colors.grey,
                ),
                Expanded(
                    child: TextButton.icon(
                  onPressed: () {
                    if (controller.playerEnableChat.value == 0) {
                      if (selectRow.value == 2) {
                        selectRow.value = 0;
                      } else {
                        selectRow.value = 2;
                      }
                      _scrollToBottom();
                    } else {
                      controller.showMessToast();
                    }
                  },
                  label: ZsText(
                    '互动表情',
                    fontSize: 14,
                    color: selectRow.value == 2 ? selectColro : unselectColro,
                  ),
                  icon: Image.asset(
                    img2,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                )),
              ],
            ),
          ),
          buildShortcuts(context),
          buildExpression(context),
        ],
      ),
    );
  }

  Widget buildShortcuts(BuildContext context) {
    return HYContainer(
      height: Get.height * 0.3,
      child: ListView.builder(
        itemBuilder: (c, row) {
          String str = ChatList[row];
          return HYContainer(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            alignment: const Alignment(0, 0),
            child: ZsText(
              str.tr,
              fontSize: 14,
              color: Colors.white,
            ),
            onTap: () {
              controller.onSendText(str);
              _scrollToBottom();
            },
          );
        },
        itemCount: ChatList.length,
      ),
    ).intoVisibility(visible: selectRow.value == 1);
  }

  Widget buildExpression(BuildContext context) {
    return HYContainer(
      height: Get.height * 0.3,
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: ChatIconList.length,
          padding: const EdgeInsets.fromLTRB(7.5, 20, 7.5, 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemBuilder: (c, index) {
            var model = ChatIconList[index];
            String str = model['res'] ?? '';
            String key = model['name'] ?? '';
            bool isMainIcon = str.startsWith('main_icon');
            String img;

            if (isMainIcon) {
              img = 'assets/images/play/chat/icon/${str}.png';
            } else {
              img = 'assets/images/play/chat/chat_icon/${str.tr}.png';
            }

            return HYContainer(
              child: Image.asset(img),
              onTap: () {
                controller.onSendEmoji(key);
              },
            );
          }),
    ).intoVisibility(visible: selectRow.value == 2);
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
