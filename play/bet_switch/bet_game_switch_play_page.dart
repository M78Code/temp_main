import 'package:flutter/material.dart';
import 'package:flutter_main/app.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/pages/play/bet_switch/bet_game_switch_play_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


/// 切换玩法
class BetGameSwitchPlayPage extends StatelessWidget {
  BetGameSwitchPlayPage({super.key});

  BetGameSwitchPlayController controller =
  Get.put(BetGameSwitchPlayController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: SizedBox(
        width: Get.width,
        height: 612.h,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(46.h),
              // 设置APPBar 顶部圆角
              child:  AppBar(
                backgroundColor: AppColors.lightGameSwitchFullBackColor01,
                title: Text(
                  "切换玩法",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                leading: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.black26,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                // 标题居中对其
                centerTitle: true,
              ),
            ),
            body: buildBodyWidget()),
      ),
    );
  }

  Widget buildBodyWidget() {
    return Container(
      height: 612.h - 46.h,
      // color: #F4F9FF,
      color: AppColors.lightGameSwitchFullBackColor01,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              // color: Colors.orangeAccent,
              child: Text(
                "选择任意一套组合，替换当前桌台的玩法",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: AppColors.lightGameSwitchTextColor01),
              )
          ),
          SizedBox(height: 10.h),

          /// 玩法列表
          Expanded(child: buildListView())
        ],
      ),
    );
  }

  Widget buildListView() {
    return Obx(() {
      return ListView.builder(
          itemCount: controller.dataList.length,
          itemBuilder: (context, index) {
            final itemData = controller.dataList[index];
            return GestureDetector(
              onTap: (() {
                controller.selectItem(index);
                Navigator.pop(context);
              }),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGameSwitchBackColor01,
                    // color: Colors.cyan,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: itemData.isBeSelected!
                            ? AppColors.lightGameSwitchBorderColor01
                            : Colors.transparent,
                        width: 1.0)),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                height: 75.h,
                width: double.infinity,
                child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 20.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.lightGameSwitchLineColor01,
                                        width: 1.0))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Image.asset(
                                        "assets/images/play/icon_game_switch_corner.png")
                                ),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                          "${itemData.title}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: itemData.isBeSelected!
                                                  ? AppColors.lightGameSwitchTextColor02
                                                  : AppColors.lightGameSwitchTextColor01),
                                        ))),
                                Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Image.asset(
                                        "assets/images/play/icon_game_switch_corner.png")
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 24.h,
                            width: double.infinity,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: buildTextItems(
                                  itemData.betPointType.betPointList ?? [],
                                  itemData.isBeSelected!),
                            ),
                          ),
                          Container(
                            height: 29.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: AppColors.lightGameSwitchLineColor01,
                                        width: 1.0))),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: buildTextItems(
                                  itemData.betType.switchBetList ?? [],
                                  itemData.isBeSelected!),
                            ),
                          ),
                        ],
                      ),
                      // 右上角的图标
                      Positioned(
                        right: 0,
                        top: 0,
                        height: 16,
                        width: 24,
                        child:  itemData.isBeSelected!
                            ? Image.asset("assets/images/play/icon_game_switch_right_selected.png")
                            : Container(),
                      ),
                    ]
                ),
              ),
            );
          });
    });
  }

  List<Widget> buildTextItems(List<String> items, bool isBeSelected) {
    return items.asMap().entries.map((entry) {
      int index = entry.key;
      String item = entry.value;
      return Flexible(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  right: index == items.length - 1
                      ? BorderSide.none
                      : BorderSide(
                      color: AppColors.lightGameSwitchLineColor01,
                      width: 1.0))),
          child: Center(
            child: Text(item,
                // item["label"],
                // style: TextStyle(backgroundColor: item["color"]),
                style: TextStyle(
                    fontSize: 12,
                    color: isBeSelected
                        ? AppColors.lightGameSwitchTextColor02
                        : AppColors.lightGameSwitchTextColor01)),
          ),
        ),
      );
    }).toList();
  }
}
