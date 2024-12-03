import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_main/api/api_host.dart';
import 'package:flutter_main/api/api_service.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/app_config_model.dart';
import 'package:flutter_main/models/common/request_bo.dart';
import 'package:flutter_main/net/http/http.dart';
import 'package:flutter_main/net/socket/base/URLManager.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

import '../../net/http/http_stream_manager.dart';

class LoginController extends GetxController {
  LoginController();

  // final MethodChannel _methodChannel = const MethodChannel("flutter_to_Native");

  final TextEditingController mLoginNameController = TextEditingController();
  final TextEditingController mLoginPwdController = TextEditingController();

  final Map<String, String> mEnvMapData = {
    'fat': ApiHost.API_FAT,
    'dev': ApiHost.API_DEV,
    'uat': ApiHost.API_UAT,
    'pro': ApiHost.API_PRO
  };

  final Map<String, String> mStreamEnvMapData = {
    'fat': ApiHost.API_STREAM_FAT,
    'dev': ApiHost.API_STREAM_DEV,
    'uat': ApiHost.API_STREAM_UAT,
    'pro': ApiHost.API_STREAM_PRO
  };

  late String mEnv;

  String mLoginName = '';
  String mLoginPwd = '';

  @override
  void onReady() {
    super.onReady();

    mEnv = mEnvMapData.keys.first;
    onRefreshLoginInfo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loginNameOnChanged(String val) {
    LogUtil.log('--LoginController--loginNameOnChanged=$val');
    mLoginName = val;
  }

  void loginPwdOnChanged(String val) {
    LogUtil.log('--LoginController--loginPwdOnChanged=$val');
    mLoginPwd = val;
  }

  void onRefreshLoginInfo() {
    var loginInfoStr = StorageUtil().getString("${mEnv}_key");

    if (loginInfoStr.isNotEmpty) {
      var loginInfoMap = json.decode(loginInfoStr);

      mLoginName = loginInfoMap['loginName'] ?? '';
      mLoginPwd = loginInfoMap['loginPassword'] ?? '';

      if (mLoginName.isNotEmpty) {
        mLoginNameController.text = mLoginName;
        mLoginNameController.selection = TextSelection.fromPosition(
            TextPosition(offset: mLoginNameController.text.length));
      }
      if (mLoginPwd.isNotEmpty) {
        mLoginPwdController.text = mLoginPwd;
        mLoginPwdController.selection = TextSelection.fromPosition(
            TextPosition(offset: mLoginPwdController.text.length));
      }
    } else {
      switch (mEnv) {
        case 'fat':
          mLoginName = 'fsyreivy005';
          mLoginPwd = 'abc123456';
          break;
        case 'dev':
          mLoginName = 'us7uhtest16';
          mLoginPwd = 'abc123456';
          break;
        case 'uat':
          mLoginName = 'gn3hmuat0018';
          mLoginPwd = 'abc123456';
          break;
        case 'pro':
          mLoginName = '';
          mLoginPwd = '';
          break;
      }

      if (mLoginName.isNotEmpty) {
        mLoginNameController.text = mLoginName;
        mLoginNameController.selection = TextSelection.fromPosition(
            TextPosition(offset: mLoginNameController.text.length));
      } else {
        mLoginNameController.clear();
        mLoginPwdController.clear();
      }
      if (mLoginPwd.isNotEmpty) {
        mLoginPwdController.text = mLoginPwd;
        mLoginPwdController.selection = TextSelection.fromPosition(
            TextPosition(offset: mLoginPwdController.text.length));
      } else {
        mLoginNameController.clear();
        mLoginPwdController.clear();
      }
    }
  }

  void selectEnvData(String? val) {
    LogUtil.log('--LoginController--selectEnvData=$val');
    mEnv = val!;
    onRefreshLoginInfo();
  }

  void onTapBackButton(BuildContext context) async {
    // var baseResponse = await ApiService.wheatOrderListApi(1,1);
    // HttpUtil.getIp();

    // var dataInfo = Provider.of<WebSocketProvide>(context).init();
    // print(dataInfo);
  }

  void playLogin() async {
    if (mLoginName.isEmpty) {
      Loading.error('输入正确的用户名！');
      return;
    }

    if (mLoginPwd.isEmpty) {
      Loading.error('输入正确的密码！');
      return;
    }

    Loading.show();

    HttpManager().switchBaseUrl(mEnvMapData[mEnv]!);
    HttpStreamManager().switchBaseUrl(mStreamEnvMapData[mEnv]!);
    var loginBo = RequestBo();
    loginBo.loginName = mLoginName;
    loginBo.loginPassword = mLoginPwd;
    loginBo.backurl = '${mEnvMapData[mEnv]}#/?login=true';
    loginBo.deviceType = 1;
    var map = loginBo.toMap();

    StorageUtil().setJson("${mEnv}_key", map);

    var baseResponse = await ApiService.playerLoginApi(map);

    if (baseResponse.isSuccess) {
      var data = baseResponse.data;

      LogUtil.log("--LoginController--playLogin-data=$data");

      if (data.isNotEmpty) {
        UrlManager.decryptData(data).then((result) {
          Loading.dismiss();
          LogUtil.log("--LoginController--playLogin-result=$result");

          var appConfigModel = appConfigModelFromJson(result!);

          GlobalController.controller.loginSuccess(appConfigModel);
        });
      }
    } else {
      ToastUtil.showToast('登录失败！');
    }
  }
}
