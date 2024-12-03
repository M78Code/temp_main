import 'package:flutter_main/api/api_service.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/pages/userProfile/dialogs/setting_nickname_dialog.dart';
import 'package:flutter_main/pages/user_center/promo/router.dart';
import 'package:flutter_main/utils/toast_util.dart';
import 'package:get/get.dart';

import '../../utils/navigator_util.dart';

class UserProfileController extends GetxController {
  final WebsocketController websocketController =
      WebsocketController.controller;

  /// 余额是否可见
  Rx<bool> isBalanceVisible = true.obs;

  /// 当前账号
  String get account =>
      websocketController.mWs10000Model.value.data?.loginName ?? "";

  /// 余额
  String get balanceString =>
      isBalanceVisible.value ? balance.toString() : "*****";
  double get balance =>
      websocketController.mWs10000Model.value.data?.balance ?? 0;

  /// 昵称
  String get nickname =>
      websocketController.mWs10000Model.value.data?.nickName ?? "";

  /// 0表示试玩账号
  int get category =>
      websocketController.mWs10000Model.value.data?.category ?? 0;

  /// 用户头像
  String get headPic =>
      websocketController.mWs10000Model.value.data?.headPic ?? "";

  /// 0 表示修改过昵称，1 表示未修改过昵称
  int get nicknameTips =>
      websocketController.mWs10000Model.value.data?.nickNameTips ?? 0;

  /// 余额是否可见翻转
  toggleBalanceVisible() {
    isBalanceVisible.toggle();
  }

  getModifyNicknameCount() {
    ApiService.getModifyNicknameCount();
  }

  /// 修改昵称
  modifyNickname() async {
    if (category == 0) {
      ToastUtil.showToast("试玩账号无法修改昵称");
      return;
    }
    int? modifyNicknameCount;
    if (nicknameTips == 0) {
      modifyNicknameCount = await ApiService.getModifyNicknameCount();
    }
    SettingNicknameDialog.show(modifyCount: modifyNicknameCount);
  }

  // 跳轉
  toPormoPage() {
    NavigatorUtil.push(PromoPageRouter.promo);
  }
}
