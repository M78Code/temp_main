import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';

import '../../../../generated/r.dart';

// implements PreferredSizeWidget
class TabBarCellWidget extends StatelessWidget {
  TabBarCellWidget(
      {super.key,
      required this.tabs,
      required this.controller,
      this.indicator,
      this.size = 60,
      this.onTap});

  late TabController controller;
  ValueChanged<int>? onTap;
  List<Widget> tabs;
  Decoration? indicator;
  double size = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
            GlobalController.CheckWhiteBlack(R.lightTagBg, R.darkTagBg)),
        fit: BoxFit.fill,
        centerSlice: const Rect.fromLTRB(0, 0, 1125, 132),
      )),
      height: size,
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicatorSize: TabBarIndicatorSize.tab,
        automaticIndicatorColorAdjustment: false,
        dragStartBehavior: DragStartBehavior.down,
        labelColor: GlobalController.CheckWhiteBlack(
            Color(0xFF30425C), Color(0xFFDCDCDC)),
        unselectedLabelColor: GlobalController.CheckWhiteBlack(
            Color(0xFF7288A9), Color(0xFF919399)),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        indicatorWeight: 0,
        dividerColor: Colors.transparent,
        indicator: indicator,
        onTap: onTap,
      ),
    );
  }

// @override
// Size get preferredSize => Size(Get.width, size);
}
