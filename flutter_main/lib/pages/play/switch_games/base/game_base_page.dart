import 'package:flutter/material.dart';
import 'package:flutter_main/pages/play/switch_games/cell/popup_menu_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/global_controller.dart';
import '../../../../generated/r.dart';
import '../cell/DealerCell.dart';
import '../cell/LiveCell.dart';
import '../cell/RouteCell.dart';
import '../cell/SimpleCell.dart';
import '../game_controller.dart';
import '../game_model.dart';

class GameBasePage extends GetView<GameController> {
  String type = '';

  @override
  String? get tag => type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildView(context),
    );
  }

  Widget buildTop(BuildContext context) {
    return Container();
  }

  Widget _buildView(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTop(context),
            Expanded(child: _buildGrad(context)),
          ],
        ));
  }

  Widget _buildGrad(BuildContext context) {
    switch (controller.globalController.modeType.value) {
      case 1:
        return buildDealerGrid();
      case 2:
        return buildSimpleGrid();
      case 3:
        return buildRouteGrid();
      case 4:
        return buildLiveGrid();
      default:
        return buildLiveGrid();
    }
  }

  Widget buildLiveGrid() {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行两列
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        // 宽高比，控制每个卡片的高度
        childAspectRatio: 0.84,
      ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        if (controller.list.length > index) {
          var id = controller.list[index];
          var model = controller.gemaMap[id]!;
          return LiveCell(
            model: model,
          );
        }
        return Container();
      },
    );
  }

  Widget buildRouteGrid() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 10),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (controller.list.length > index) {
            var id = controller.list[index];
            var model = controller.gemaMap[id]!;
            return RouteCell(
              model: model,
            );
          }
          return Container();
        });
  }

  Widget buildDealerGrid() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 10),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (controller.list.length > index) {
            var id = controller.list[index];
            var model = controller.gemaMap[id]!;
            return DealerCell(
              model: model,
            );
          }
          return Container();
        });
  }

  Widget buildSimpleGrid() {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行两列
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        // 宽高比，控制每个卡片的高度
        childAspectRatio: 1.73,
      ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        if (controller.list.length > index) {
          var id = controller.list[index];
          var model = controller.gemaMap[id]!;
          return SimpleCell(
            model: model,
          );
        }
        return Container();
      },
    );
  }

  int get itemCount => controller.list.value.length;

  Widget _buildFloatingActionButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildFloatingActionTop(),
        buildFloatingActionCenter().marginOnly(top: 10, bottom: 10),
        buildFloatingActionBottom(),
      ],
    );
  }

  Widget buildFloatingActionTop() {
    return LayoutBuilder(builder: (c, c1) {
      return IconButton(
          onPressed: () {
            onTagTopAction(context: c);
          },
          icon: Image.asset(
            GlobalController.CheckWhiteBlack(R.lightGemaSort, R.darkGemaSort),
            width: 34,
            height: 34,
          ));
    });
  }

  Widget buildFloatingActionCenter() {
    return LayoutBuilder(builder: (c, c1) {
      return IconButton(
          onPressed: () {
            onTagCenterAction(context: c);
          },
          icon: Image.asset(
            GlobalController.CheckWhiteBlack(
                R.lightGemaSetting, R.darkGemaSetting),
            width: 34,
            height: 34,
          ));
    });
  }

  Widget buildFloatingActionBottom() {
    return LayoutBuilder(builder: (c, c1) {
      return IconButton(
          onPressed: () {
            onTagBottomAction(context: c);
          },
          icon: Image.asset(
            GlobalController.CheckWhiteBlack(R.lightGemaHost, R.darkGemaHost),
            width: 34,
            height: 34,
          ));
    });
  }

  onTagTopAction({BuildContext? context}) {
    PopupMenuUtil.showPopupMenu(
        context!,
        GameTagModel.sortList
            .map((e) => TapItem(
                  text: e.name,
                  onTap: () {
                    controller.globalController.sort.value = e.code;
                  },
                ))
            .toList(),
        initialValue: GameTagModel.sortList
            .firstWhere((e) => e.code == controller.globalController.sort.value)
            .name);
  }

  onTagCenterAction({BuildContext? context}) {
    PopupMenuUtil.showPopupMenu(
        context!,
        GameTagModel.cellList
            .map((e) => TapItem(
                  text: e.name,
                  onTap: () {
                    controller.globalController.modeType.value = e.code;
                  },
                ))
            .toList(),
        initialValue: GameTagModel.cellList
            .firstWhere(
                (e) => e.code == controller.globalController.modeType.value,
                orElse: () => GameTagModel.sortList.first)
            .name);
  }

  onTagBottomAction({BuildContext? context}) {
    PopupMenuUtil.showPopupMenu(
        context!,
        GameTagModel.hostList
            .map((e) => TapItem(
                  text: e.name,
                  onTap: () {
                    controller.globalController.gameCasinoId.value = e.code;
                  },
                ))
            .toList(),
        initialValue: GameTagModel.hostList
            .firstWhere(
                (e) => e.code == controller.globalController.gameCasinoId.value)
            .name);
  }
}
