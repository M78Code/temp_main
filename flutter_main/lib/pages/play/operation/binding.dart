import 'package:flutter_main/pages/play/operation/index.dart';
import 'package:get/get.dart';

class OperationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OperationController());
  }
}