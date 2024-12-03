import 'package:flutter_main/pages/play/bet_on/bet_on_controller.dart';
import 'package:get/get.dart';

class BetOnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BetOnController());
  }
}