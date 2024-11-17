import 'package:flutter_main/pages/play/table/index.dart';
import 'package:get/get.dart';

class TableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TableController());
  }
}