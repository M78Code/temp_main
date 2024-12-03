import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class SingleSelController extends GetxController {
  RxInt selIdx = 0.obs;

  @override
  void onReady() {}

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateSelIndex(int defaultIdx) {
    selIdx.value = defaultIdx;
  }

  okClick(void Function(int idex) okTap) {
    okTap(selIdx.value);
    SmartDialog.dismiss();
  }
}
