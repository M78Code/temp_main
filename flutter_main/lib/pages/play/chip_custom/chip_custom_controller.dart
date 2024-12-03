import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChipCustomController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  int? parValue;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(() {
      var text = textEditingController.text;
      int number = int.tryParse(text) ?? 0;
      if (number == 0) {
        textEditingController.text = "";
      }
      if (number > 9999999) {
        textEditingController.text = "9999999";
      }
    });
    print("ChipCustomController init....");
  }

  @override
  void onReady() {
    super.onReady();
    textEditingController.text = "${parValue ?? ''}";
  }

  @override
  void onClose() {
    super.onClose();
    print("ChipCustomController onClose....");
  }

  updateScrollOffset(double scrollOffset) {
    // update();
  }
}
