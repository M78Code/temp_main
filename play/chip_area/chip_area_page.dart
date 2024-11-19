import 'package:flutter/material.dart';
import 'package:flutter_main/models/chip_model.dart';
import 'package:flutter_main/pages/play/chip_custom/chip_custom_page.dart';
import 'package:flutter_main/pages/play/chip_setting/chip_setting_page.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

import '../chip_fly/chip_fly_controller.dart';
import '../chip_setting/chip_setting_controller.dart';
import '../widgets/chip_text.dart';
import 'chip_area_controller.dart';

typedef ChipAreaOnSelectedChip = void Function(ChipModel?);

class ChipAreaPage extends StatelessWidget {
  ChipAreaPage({super.key});

  final ChipAreaController ctl = Get.put(ChipAreaController());

  @override
  Widget build(BuildContext context) {
    return _chipView(context);
  }

  /// 选择筹码
  _chipView(BuildContext context) {
    var list = ctl.selectedChipList;
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _onScrollLeft();
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              width: 18,
              height: 18,
              // padding: EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0x33ffffff),
              ),
            ), // 透明色
          ),
          Expanded(
            child: _buildListView(context),
          ),
          InkWell(
            onTap: () {
              _onScrollRight();
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              width: 18,
              height: 18,
              // padding: EdgeInsets.all(10.0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0x33ffffff),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildListView(BuildContext context) {
    return GetBuilder<ChipAreaController>(builder: (ctl) {
      var list = ctl.selectedChipList;
      return ListView.builder(
          controller: ctl.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext _, int index) {
            var chip = list[index];
            var size = chip.selected == true ? 50.0 : 40.0;
            var decoration = chip.selected == true
                ? const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/chips/common_chip_selected_hi.png'),
                      fit: BoxFit.fill, // 完全填充
                    ),
                  )
                : null;
            return InkWell(
              onTap: () {
                _onListViewItem(context, ctl, index);
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                //common_chip_selected_hi
                decoration: decoration,
                margin: const EdgeInsets.all(3.0),
                width: size,
                height: size,
                // color: Colors.redAccent,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        chip.icon ?? "",
                      ),
                      Visibility(
                        visible: chip.type == 1,
                        child: ChipTextWidget(
                            maxWidth: 33, parValue: chip.parValue),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }

  _onListViewItem(BuildContext context, ChipAreaController ctl, int index) {
    var chip = ctl.selectedChipList[index];
    if (chip.type == 3) {
      // ChipFlyController.controller.onChipFly(
      //   betAmount: 100,
      //   betPointId: 3002,
      // );

      _showBottomModal1(context);
    } else {
      ctl.onSelectedChipValue(index);
    }
  }

  _onScrollLeft() {
    var minScrollExtent = ctl.scrollController.position.minScrollExtent;
    var maxScrollExtent = ctl.scrollController.position.maxScrollExtent;
    var move = maxScrollExtent / 5;
    LogUtil.log("_onScroll offset minScrollExtent $minScrollExtent");
    var offset = ctl.scrollController.offset;
    LogUtil.log("_onScroll offset $offset");
    offset = offset - move;
    if (offset < 0) {
      offset = 0;
    }
    LogUtil.log("offset $offset");
    // ctl.controller.animateTo(offset,
    //     duration: Duration(milliseconds: 200), curve: Curves.ease);
    ctl.scrollController.jumpTo(offset);
  }

  _onScrollRight() {
    var maxScrollExtent = ctl.scrollController.position.maxScrollExtent;
    var move = maxScrollExtent / 5;
    LogUtil.log("_onScroll offset maxScrollExtent $maxScrollExtent");
    var offset = ctl.scrollController.offset;
    offset = offset + move;
    if (offset > maxScrollExtent) {
      offset = maxScrollExtent;
    }
    LogUtil.log("_onScroll offset $offset");
    // ctl.controller.animateTo(offset,
    //     duration: Duration(milliseconds: 200), curve: Curves.ease);
    ctl.scrollController.jumpTo(offset);
  }

// 定义方法
  _showBottomModal1(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          // borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        builder: (BuildContext context) {
          return ChipSettingPage(
            defaultChip: ctl.defaultChip,
            selfEditChips: ctl.selfEditChips,
          );
        });
    Get.delete<ChipSettingController>();
  }
}
