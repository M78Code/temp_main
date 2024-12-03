import 'package:flutter/material.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controller.dart';
import '../../../utils/hex_color.dart';
import 'game_controller.dart';

class SwitchGamesHomePage extends GetView<GameHomeController> {
  static Future ShowCustomModalBottomSheet(BuildContext context) {
    GlobalController.updateGameSettingState(true);
    Get.lazyPut(() => GameHomeController());
    GameHomeController c = Get.find<GameHomeController>();
    c.onSendWS(0);

    return showModalBottomSheet(
        backgroundColor: Colors.red,
        context: context,
        builder: (BuildContext context) {
          return HYContainer(
            backgroundColor: HexColor.ColorHex('#252B3D'),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            // padding: const EdgeInsets.only(top: 15),
            child: SafeArea(
              child: SwitchGamesHomePage(),
            ),
          );
        }).then((e) {
      Get.delete<GameHomeController>();
      GlobalController.updateGameSettingState(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
            key: GlobalKey(),
            onTap: controller.onTagTabBar,
            items: controller.gemaList
                .map((e) => BottomNavigationBarItem(
                    icon: Image.asset(
                      GlobalController.CheckWhiteBlack(e.iconLight, e.iconDark),
                      width: 28,
                    ),
                    activeIcon: Image.asset(
                        GlobalController.CheckWhiteBlack(
                            e.unIconLight, e.unIconDark),
                        width: 28),
                    label: e.name))
                .toList(),
            currentIndex: controller.seleteRow.value,
            backgroundColor: Colors.transparent,
            selectedItemColor: GlobalController.CheckWhiteBlack(
                Color(0xFF1C386C), Color(0xFFDCDCDC)),
            unselectedItemColor: GlobalController.CheckWhiteBlack(
                Color(0xFF7288A9), Color(0xFFDCDCDC)),
            selectedLabelStyle:
                const TextStyle(height: 2.0, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                const TextStyle(height: 2.0, fontWeight: FontWeight.w600),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10,
            unselectedFontSize: 10,
          ),
          body: PageView(
            controller: controller.pageController,
            children: controller.gemaList.map((e) => e.page).toList(),
          ),
        ));
  }
}
