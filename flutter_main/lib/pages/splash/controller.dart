import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/app_config_model.dart';
import 'package:flutter_main/pages/login/index.dart';
import 'package:flutter_main/utils/navigator_util.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../net/socket/base/URLManager.dart';

class SplashController extends GetxController {
  SplashController();


  @override
  void onReady() {
    super.onReady();

    // var appConfigModelStr = StorageUtil().getString(StorageUtil.KEY_APP_CONFIG_MODEL);
    //
    // if(appConfigModelStr.isEmpty) {
    //   jumpToLoginPage();
    // } else {
    //   var appConfigModel = appConfigModelFromJson(appConfigModelStr);
    //   GlobalController.controller.loginSuccess(appConfigModel);
    // }
    // jumpToLoginPage();
    // addListenerWithNative();
  }

  void jumpToLoginPage() {
    Get.toNamed(LoginRouter.login);
  }


}