import 'dart:convert';
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
          mLoginName = 'fsyreivy004';
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
    // playLoginToken();
    // return;

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

      // LogUtil.log("--LoginController--playLogin-data=$data");

      if (data.isNotEmpty) {
        UrlManager.decryptData(data).then((result) {
          Loading.dismiss();
          // LogUtil.log("--LoginController--playLogin-result=$result");

          var appConfigModel = appConfigModelFromJson(result!);

          GlobalController.controller.loginSuccess(appConfigModel);
        });
      }
    } else {
      ToastUtil.showToast('登录失败！');
    }
  }

  void playLoginToken() async {
    var data = 'https://ep.dpzrfat6.com/?params=0D54LNSVIMvn4lRhcla8DFODwQLKCHTZziq0cLnmWpxaiB7aPBqbr/bixEZhSDvhAErvZb7XpcdKxz4jnlQMwzhZbyXXT11UYl4g2BsWlpvv7WaB270ps4Sk9TVoUEMyu8tGcQYS8II/+QOkarJuGtMIXN0P8T6QwIxitn+T+zfzEA35kQTIMEbntJIGuCFYTS1gcTDDxTaFdie2FibI3GJijEMjjrXX+ySGTUVpvQf/oCA0wRv0fcaqeIljl8aNg+1Lg0r4vxJnpcWrwCscs8QPFrZpQwhF5n4MgzCQYaW8sF7ri0hmCzm4u3KwUuyTbLlEOLkcM1TGa/+kaWfDk4BKZQ7b4+6FNw+MaSK65TmXFziWZ3JvR620q7y4IF8ievEa19OtdljJj19++Fn6QaTs22WvOc8i3XUaOsLORfXcL2Upqs0oFouKDbzSlPwFDOGV9gZ2a0lvZJcFUHS0voFyzfWWaFcgDqYRKY/2Zq0LS65RBe/JvkfIhZdM5OFCLA3LKaGOj2iT/IF0hc/lfT3e35nrsR8vzFht07JVh5Zl+3a7WApedGXzJCJbp/01xglP7SjyjmMTnWjy0JtATUu3RSN444gnqC5mY0BCvSj/4ryTc2M3Cf+t/02seKdG/bCj4kUWosaO4XMt6PDGj1D3KqN/z/VtFgno8do7vhgxeJRabfNlkNpSeIAFhF45nuWK2g/x72VgT0INf88VqKBTql+zmUU0iKSVyUlCbo3ps7l17WgxFY7SaRWw5tGhvJYdIWfiX3feqUM/axuOuyVKTFN2neThLSnwHbpQq0pt+JmXkMcaLuANgtqqvwU/QzX0ThU2lj8r2KRcuVHrbdmkr/hwOi0HttQ1PC4Yv1HHgSzX3hZxDQgqBibz1eddlv8NKyDlz94zTT7afuWtmTZ8/S5/Q+l9/3BEoIT7lR1LU8Cw3B3HUtoF5jORJ/SrriSRJmlQteYU8z1oXWlUQgTjM+VK0aLVr4qcHC754ayMiH4TiyQLF9U6a/HgBM9SGb96zBUUxIZqafD1AYhhWaG/5j6HKTlYQeQDmdrfzV5wST1mj5Laei4KSpcY7LJeFPsPiIPvlckA3hDmbaJEjixX2vLPcBEXV4iCXTIZ/tvAbcFEZAkpcp8HCG0p9+tV84HXch2SJCMQQn/vr9zcrJ2YnzxI1AnGj31wwLvBGMAgwVS2/OxxA8nOBQcitFWlHyCau0XRfvc1gElUNMeEzC4Q4ICo4UXEwyTwRJxVhEA=&signature=200AD682A3CBDD64A2F76ADBE6F7E71E&ttl=1732079539791&platform=app';

    LogUtil.log("--LoginController--playLogin-data=$data");

    if (data.isNotEmpty) {
      UrlManager.decryptData(data).then((result) {
        Loading.dismiss();
        LogUtil.log("--LoginController--playLogin-result=$result");

        var appConfigModel = appConfigModelFromJson(result!);

        GlobalController.controller.loginSuccess(appConfigModel);
      });
    }
  }
}
