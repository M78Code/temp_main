import 'package:flutter/material.dart';
import 'package:flutter_main/utils/base/base_container.dart';
import 'package:flutter_main/utils/base/base_text.dart';
import 'package:get/get.dart';

import '../../../controllers/global_controller.dart';
import '../../../generated/r.dart';
import '../../../utils/hex_color.dart';
import '../play_router.dart';
import 'game_controller.dart';

class SwitchGamesHomePage extends GetView<GameHomeController> {
  static Future ShowCustomModalBottomSheet(BuildContext context) {
    GlobalController.updateGameSettingState(true);
    Get.lazyPut(() => GameHomeController());
    Get.lazyPut(() => GameController(tag: '好路', groupId: 19), tag: '好路');
    GameHomeController c = Get.find<GameHomeController>();
    var index = PlayRouter.mGroupId == 0 ? 1 : 0;
    c.seleteRow.value = index;
    c.pageController = PageController(initialPage: index);
    c.onSendWS(index);

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
    return Obx(() {
      double bottomNavBarHeight = kBottomNavigationBarHeight;
      double bottomPadding = MediaQuery.of(context).padding.bottom;
      return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            // 背景图
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(GlobalController.CheckWhiteBlack(
                      R.lightTabbarBg, R.darkTabbarBg)),
                  // 替换为你的图片路径
                  fit: BoxFit.fill,
                  centerSlice: const Rect.fromLTRB(0, 0, 1120, 210),
                ),
              ),
              height: bottomPadding + bottomNavBarHeight,
            ),
            BottomNavigationBar(
              key: GlobalKey(),
              onTap: controller.onTagTabBar,
              items: controller.gemaList
                  .map(
                    (e) => BottomNavigationBarItem(
                        icon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              GlobalController.CheckWhiteBlack(
                                  e.iconLight, e.iconDark),
                              width: 28,
                            ),
                            ZsText(
                              e.name,
                              color: GlobalController.CheckWhiteBlack(
                                  Color(0xFF1C386C), Color(0xFFDCDCDC)),
                              fontWeight: FontWeight.w600,
                              lineHeight: 2.0,
                              left: 6,
                            )
                          ],
                        ),
                        activeIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                                GlobalController.CheckWhiteBlack(
                                    e.unIconLight, e.unIconDark),
                                width: 28),
                            const SizedBox(
                              width: 6,
                            ),
                            ZsText(
                              e.name,
                              color: GlobalController.CheckWhiteBlack(
                                  Color(0xFF7288A9), Color(0xFFDCDCDC)),
                              fontWeight: FontWeight.w600,
                              lineHeight: 2.0,
                              left: 6,
                            )
                          ],
                        ),
                        label: ''),
                  )
                  .toList(),
              currentIndex: controller.seleteRow.value,
              backgroundColor: Colors.transparent,
              iconSize: 30,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
          ],
        ),
        body: PageView(
          controller: controller.pageController,
          children: controller.gemaList.map((e) => e.page).toList(),
        ),
      );
    });
  }
}
