import 'package:flutter_main/pages/play/american/controller/FrenchController.dart';
import 'package:flutter_main/pages/play/bet_on/bet_on_controller.dart';
import 'package:flutter_main/pages/play/count_down/count_down_controller.dart';
import 'package:flutter_main/pages/play/good_road_recommend/good_road_recommend_controller.dart';
import 'package:flutter_main/pages/play/operation/index.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:flutter_main/pages/play/poker/open_poker_controller.dart';
import 'package:flutter_main/pages/play/table/index.dart';
import 'package:get/get.dart';

import '../american/controller/AmericanController.dart';
import '../american/corona_controller.dart';
import '../chip_fly/chip_fly_controller.dart';
import '../peeking_poker/peeking_poker_controller.dart';

class PlayRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayRoomController());
    Get.lazyPut(() => OpenPokerController());
    Get.lazyPut(() => PeekingPokerController());
    Get.lazyPut(() => TableController());
    Get.lazyPut(() => BetOnController());
    Get.lazyPut(() => OperationController());
    Get.lazyPut(() => CountDownController());
    Get.lazyPut(() => GoodRoadRecommendController());
    Get.lazyPut(() => CoronaController());
    Get.lazyPut(() => AmericanController());
    Get.lazyPut(() => FrenchController());
    Get.lazyPut(() => ChipFlyController());
  }
}
