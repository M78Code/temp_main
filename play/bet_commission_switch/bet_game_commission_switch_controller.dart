import 'dart:ui';

import 'package:flutter_main/configs/app_colors.dart';
import 'package:get/get.dart';


class BetGameCommissionSwitchController extends GetxController {

  // isCommission : 0 为庄不免佣    1 为庄免佣
  RxInt isCommission = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  Color checkBorderColor(bool isSelected) {

    if (isSelected) {
      return AppColors.lightGameSwitchBorderColor01;
    } else {
      return AppColors.lightGameSwitchFullBackColor01;
    }
  }

}