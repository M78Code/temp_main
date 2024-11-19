import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:flutter_main/utils/base/base_text.dart';
import 'package:flutter_main/utils/base/base_widget.dart';
import 'package:get/get.dart';

import '../../../utils/hex_color.dart';

class GameInfoDrawerPage extends StatelessWidget {
  static Future<String?>? push(
      {required BuildContext context, int seleted = 0}) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: HexColor.ColorHex('#000000', opcity: 0.5),
                )),
                SizedBox(
                  width: Get.width * 0.896,
                  child: GameInfoDrawerPage(),
                )
              ],
            ),
            onHorizontalDragEnd: (_) {
              Get.back();
            },
            onTap: () {
              Get.back();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: GlobalController.CheckWhiteBlack(
          Color(0xFFF3F8FF), Color(0xFF242A3D)),
      child: SafeArea(
        child: HYContainer(
          margin: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Column(
            children: [
              buildTitleWidget('桌台信息'),
              HYContainer(
                padding: const EdgeInsets.fromLTRB(6, 8, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildTitleItem('桌台', '经典B02'),
                          buildTitleItem('局号', 'GB02243233A'),
                        ]),
                    buildTitleItem('荷官', '奥利安娜').marginOnly(top: 8),
                  ],
                ),
              ),
              buildTitleWidget('玩法信息'),
              ContainedTabBarView(
                tabs: [
                  ZsText(
                    '当前玩法',
                    fontSize: 14,
                  ),
                  ZsText(
                    '全部玩法',
                    fontSize: 14,
                  ),
                ],
                views: [
                  GameNoncePage(),
                  GameAllePage(),
                ],
                tabBarProperties: TabBarProperties(
                    labelColor: GlobalController.CheckWhiteBlack(
                        Color(0xFF30425C), Color(0xFFDCDCDC)),
                    unselectedLabelColor: GlobalController.CheckWhiteBlack(
                        Color(0xFF7288A9), Color(0xFF919399))),
                onChange: (row) {
                  print('----------------->:$row');
                },
              ).intoContainer(height: Get.height - 90 - Get.statusBarHeight)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleItem(String name, String value) {
    return ZsText(
      '$name：$value',
      color: GlobalController.CheckWhiteBlack(
          Color(0xFF30425C), Color(0xFFDCDCDC)),
      fontSize: 12,
    );
  }

  Widget buildTitleWidget(String title) {
    return Row(children: [
      Container(
        width: 2,
        height: 15,
        decoration: ShapeDecoration(
          color: GlobalController.CheckWhiteBlack(
              Color(0xFF7288A9), Color(0xFF919399)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        ),
      ),
      ZsText(
        title,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        left: 4,
        color: GlobalController.CheckWhiteBlack(
            Color(0xFF30425C), Color(0xFFDCDCDC)),
      ),
    ]);
  }
}

class GameNoncePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HYContainer(
      child: Column(
        children: [
          const SizedBox(height: 20),
          buildTitleItem('玩法', '赔率', '限红', isTitle: true),
          buildTitleItem('庄', '0.95', '20～10000000'),
          buildTitleItem('闲', '1', '20～100000'),
          buildTitleItem('和', '8', '5～1500'),
          buildTitleItem('庄对', '11', '20～100000'),
          buildTitleItem('闲对', '11', '20～100000'),
        ],
      ),
    );
  }

  Widget buildTitleItem(String leftStr, String str, String rightStr,
      {bool isTitle = false}) {
    double fontSize = isTitle ? 14 : 12;
    Color color = isTitle
        ? GlobalController.CheckWhiteBlack(Color(0xFF30425C), Color(0xFFDCDCDC))
        : GlobalController.CheckWhiteBlack(
            Color(0xFF7288A9), Color(0xFF919399));
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ZsText(
            leftStr,
            textAlign: TextAlign.start,
            fontSize: fontSize,
            color: color,
          ),
        ),
        Expanded(
          flex: 3,
          child: ZsText(
            str,
            textAlign: TextAlign.center,
            fontSize: fontSize,
            color: color,
          ),
        ),
        Expanded(
          flex: 3,
          child: ZsText(
            rightStr,
            textAlign: TextAlign.end,
            fontSize: fontSize,
            color: color,
          ),
        ),
      ],
    ).marginOnly(bottom: 12);
  }
}

class GameAllePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HYContainer(
      child: Column(
        children: [
          const SizedBox(height: 20),
          buildTitleItem('玩法', '赔率', '限红', isTitle: true),
          buildTitleItem('庄', '0.95', '20～10000000'),
          buildTitleItem('闲', '1', '20～100000'),
          buildTitleItem('和', '8', '5～1500'),
          buildTitleItem('庄对', '11', '20～100000'),
          buildTitleItem('闲对', '11', '20～100000'),
        ],
      ),
    );
  }

  Widget buildTitleItem(String leftStr, String str, String rightStr,
      {bool isTitle = false}) {
    double fontSize = isTitle ? 14 : 12;
    Color color = isTitle
        ? GlobalController.CheckWhiteBlack(Color(0xFF30425C), Color(0xFFDCDCDC))
        : GlobalController.CheckWhiteBlack(
            Color(0xFF7288A9), Color(0xFF919399));
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ZsText(
            leftStr,
            textAlign: TextAlign.start,
            fontSize: fontSize,
            color: color,
          ),
        ),
        Expanded(
          flex: 3,
          child: ZsText(
            str,
            textAlign: TextAlign.center,
            fontSize: fontSize,
            color: color,
          ),
        ),
        Expanded(
          flex: 3,
          child: ZsText(
            rightStr,
            textAlign: TextAlign.end,
            fontSize: fontSize,
            color: color,
          ),
        ),
      ],
    ).marginOnly(bottom: 12);
  }
}
