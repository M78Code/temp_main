import 'package:flutter/material.dart';
import 'package:flutter_main/utils/base/base_widget.dart';

import '../base/game_base_page.dart';
import '../cell/hy_button.dart';
import '../game_model.dart';

class GemaFeaturePage extends GameBasePage {
  String type = '特色';

  @override
  String? get tag => type;

  @override
  Widget buildFloatingActionBottom() {
    return const SizedBox(
      width: 34,
      height: 34,
    );
  }

  @override
  Widget buildTop(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, row) {
        GameTagModel md = GameTagModel.featureList[row];
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
      itemCount: GameTagModel.featureList.length,
      shrinkWrap: true,
    ).intoContainer(
        margin: EdgeInsets.only(top: 10, left: 20, bottom: 5),
        height: 30,
        alignment: Alignment.centerLeft);
  }
}
