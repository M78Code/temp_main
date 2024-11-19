import 'package:flutter/material.dart';
import 'package:flutter_main/utils/base/base_widget.dart';

import '../base/game_base_page.dart';
import '../cell/hy_button.dart';
import '../game_model.dart';

class GameClassicalPage extends GameBasePage {
  String type = '经典';

  @override
  String? get tag => type;

  @override
  Widget buildTop(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, row) {
        GameTagModel md = GameTagModel.classicalList[row];
        return HYButton(
          md.name,
          isSelect: controller.gamType.value == md.code,
          onTap: () {
            controller.gamType.value = md.code;
            controller.onUpdateDataAll();
          },
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: GameTagModel.classicalList.length,
      shrinkWrap: false,
    ).intoContainer(
        margin: EdgeInsets.only(top: 10, left: 20, bottom: 5),
        height: 30,
        alignment: Alignment.centerLeft);
  }
}
