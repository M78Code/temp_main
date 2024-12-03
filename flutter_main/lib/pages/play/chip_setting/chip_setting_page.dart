import 'package:flutter/material.dart';
import 'package:flutter_main/models/ws/ws_10092_model.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/utils/event_bus_util.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controller.dart';
import '../../../models/chip_model.dart';
import '../../../net/socket/base/Enum.dart';
import '../../../net/socket/websocket_manager.dart';
import '../../../utils/storage_util.dart';
import '../chip_custom/chip_custom_controller.dart';
import '../chip_custom/chip_custom_page.dart';
import '../widgets/chip_text.dart';
import 'chip_setting_controller.dart';

typedef OnShowChipSettingModal = void Function();

class ChipSettingPage extends StatelessWidget {
  ChipSettingPage({Key? key, this.defaultChip, this.selfEditChips})
      : super(key: key);
  String? defaultChip;
  String? selfEditChips;

  final ChipSettingController ctl = Get.put(ChipSettingController());

  @override
  Widget build(BuildContext context) {
    // Get.find<ChipSettingController>();
    return _rootView(context);
  }

  _rootView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff4f9ff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      constraints: BoxConstraints(maxHeight: 550),
      padding: const EdgeInsets.only(top: 20),
      // height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close)),
                const Text(
                  '筹码设置',
                  style: TextStyle(fontSize: 16, color: Color(0xff32435d)),
                ),
                SizedBox.square(
                  dimension: 1,
                )
              ],
            ),
          ),
          SizedBox.square(
            dimension: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _gridView(context)),
                SizedBox.square(
                  dimension: 15,
                ),
                Center(
                  child: ElevatedButton(
                    //icon_selected_chip_confrom
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: Color(0xff324d84),
                      fixedSize: Size.fromWidth(200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      onSubmit();
                    },
                    child: Center(
                      child: Text(
                        "确定",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox.square(
                  dimension: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _gridView(BuildContext context) {
    return GetBuilder<ChipSettingController>(
      init: ctl,
      initState: (a) {
        LogUtil.log("ChipSettingController  $defaultChip $selfEditChips");
        ctl.defaultChip = defaultChip;
        ctl.selfEditChips = selfEditChips;
        ctl.initHandler();
      },
      builder: (ChipSettingController ctl) {
        var list = ctl.chipList;
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1 / 1.2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 1,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            var chip = list[index];
            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                if (chip.type == 1 && chip.parValue == 0) {
                  var view = ChipCustomPage(
                    parValue: chip.parValue,
                    onSubmit: (text) {
                      // 获取值
                      chip.parValue = int.tryParse(text);
                      StorageUtil()
                          .setInt("${index}_chip_", chip.parValue ?? 0);
                      ctl.update();
                      Get.back();
                    },
                  );
                  _showDialog(context, view);
                } else {
                  ctl.onSelectedChip(index);
                }
              },
              child: Container(
                // color: Colors.redAccent,
                child: Container(
                  width: 70,
                  height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        chip.icon ?? "",
                        width: 50,
                        height: 50,
                      ),
                      Visibility(
                        visible: chip.type == 1,
                        child: ChipTextWidget(
                            maxWidth: 35, parValue: chip.parValue),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Visibility(
                          visible: chip.selected == true,
                          child: Image.asset(
                            'assets/images/chips/icon_chip_selected.png',
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Visibility(
                          visible: chip.type == 1,
                          child: InkWell(
                            onTap: () {
                              var view = ChipCustomPage(
                                parValue: chip.parValue,
                                onSubmit: (text) {
                                  // 获取值
                                  chip.parValue = int.tryParse(text);
                                  StorageUtil().setInt(
                                      "${index}_chip_", chip.parValue ?? 0);
                                  ctl.update();
                                  Get.back();
                                },
                              );
                              _showDialog(context, view);
                            },
                            child: Image.asset(
                              'assets/images/chips/icon_chip_edit.png',
                              width: 30,
                              height: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  onSubmit() {
    var defaultChipList = ctl.chipList
        .where((item) => (item.selected ?? false) && item.type == 0)
        .toList();
    var selfEditChipList = ctl.chipList
        .where((item) => (item.selected ?? false) && item.type == 1)
        .toList();

    EventBusUtil.getInstance().fire(ChipModelListEvent(
        defaultChipList: defaultChipList, selfEditChipList: selfEditChipList));
    var defaultChip = defaultChipList.map((item) => item.parValue).join(",");
    var selfEditChip = selfEditChipList.map((item) => item.parValue).join(",");
    String? selfEditChipTemp;
    if (selfEditChip.isNotEmpty) {
      selfEditChipTemp = selfEditChip;
    }
    var param = Ws10092Model(
        defaultChip: defaultChip,
        selfEditChips: selfEditChipTemp,
        selectedChip: "1");

    WebSocketManager.sendMessageSocket(
      socketType: SocketType.USER_SELF_CHIP,
      param: param.toJson(),
      gameTypeId: PlayRouter.mGameTypeId,
      tableId: PlayRouter.mCurrentTableId,
      serviceType: 7,
    );

    Get.back();
  }

  _showDialog(
    BuildContext context,
    Widget child, //对话框中显示的控件
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        final dialogChild = Container(
          height: 430,
          // padding: const EdgeInsets.all(10),
          child: Center(child: child),
          decoration: BoxDecoration(
            color: Color(0xfff4f9ff),
            borderRadius: new BorderRadius.circular(10.0),
          ),
        );
        return Dialog(
          child: dialogChild,
          backgroundColor: Colors.transparent,
        );
      },
    );
    Get.delete<ChipCustomController>();
  }
}
