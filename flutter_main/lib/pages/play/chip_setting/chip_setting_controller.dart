import 'package:flutter/cupertino.dart';
import 'package:flutter_main/utils/toast_util.dart';
import 'package:get/get.dart';

import '../../../models/chip_model.dart';
import '../../../utils/chip_util.dart';
import '../../../utils/log_util.dart';
import '../../../utils/storage_util.dart';

class ChipSettingController extends GetxController {
  static ChipSettingController get controller {
    return Get.find<ChipSettingController>();
  }

  List<ChipModel> chipList = [
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_1.png", parValue: 1),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_5.png", parValue: 5),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_10.png", parValue: 10),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_20.png", parValue: 20),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_50.png", parValue: 50),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_100.png",
        parValue: 100),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_200.png",
        parValue: 200),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_500.png",
        parValue: 500),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_1000.png",
        parValue: 1000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_2000.png",
        parValue: 2000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_5000.png",
        parValue: 5000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_10k.png",
        parValue: 10000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_20k.png",
        parValue: 20000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_50k.png",
        parValue: 50000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_100k.png",
        parValue: 100000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_200k.png",
        parValue: 200000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_500k.png",
        parValue: 500000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_1m.png",
        parValue: 1000000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_2m.png",
        parValue: 2000000),
    ChipModel(
        type: 0,
        icon: "assets/images/chips/common_chip_5m.png",
        parValue: 5000000),
    ChipModel(
        type: 1,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
    ChipModel(
        type: 1,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
    ChipModel(
        type: 1,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
    ChipModel(
        type: 1,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
    ChipModel(
        type: 1,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
    ChipModel(
        type: 1,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
  ];

  String? defaultChip;
  String? selfEditChips;

  onSelectedChip(int index) {
    var nowChip = chipList[index];

    int selectedCount = chipList
        .where((item) => item.selected ?? false)
        .fold(0, (sum, ele) => sum + 1);

    if (nowChip.selected == true) {
      if (selectedCount < 6) {
        // 提示选用选择的最小数量
        ToastUtil.showToast("最少选择5个筹码");
        return;
      }
      nowChip.selected = false;
    } else {
      // if (selectedCount > 7) {
      //   // 提示选用选择的最小数量
      //   ToastUtil.showToast("请最多选择8个筹码");
      //   return;
      // }
      nowChip.selected = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    handlerInitStorage();
  }

  handlerInitStorage() {
    LogUtil.log("ChipSettingController onInit $defaultChip $selfEditChips");

    // int chip20 = StorageUtil().getInt("20_chip_");
    // int chip21 = StorageUtil().getInt("21_chip_");
    // int chip22 = StorageUtil().getInt("22_chip_");
    // int chip23 = StorageUtil().getInt("23_chip_");
    // int chip24 = StorageUtil().getInt("24_chip_");
    // int chip25 = StorageUtil().getInt("25_chip_");
    for (int i = 20; i < chipList.length; i++) {
      var item = chipList[i];
      item.parValue = StorageUtil().getInt("${i}_chip_");
    }
  }

  initHandler() {
    LogUtil.log("ChipSettingController initHandler $defaultChip $selfEditChips");
    List<ChipModel> defaultChipList =
        ChipUtil.stringToChipModelList(defaultChip, 0) ?? [];
    List<ChipModel> selfEditChipsList =
        ChipUtil.stringToChipModelList(selfEditChips, 1) ?? [];
    chipList.forEach((item) {
      defaultChipList.forEach((item2) {
        if (item.type == 0 && item.parValue == item2.parValue) {
          item.selected = true;
        }
      });
    });
    chipList.forEach((item) {
      selfEditChipsList.forEach((item2) {
        if (item.type == 1 && item.parValue == item2.parValue) {
          item.selected = true;
        }
      });
    });
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
