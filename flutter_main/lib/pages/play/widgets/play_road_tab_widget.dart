import 'package:flutter/material.dart';
import 'package:flutter_main/components/road/custom_road_left_top_solid_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_piechart_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_right_bottom_solid_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_text_circle_widget.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/pages/play/bet_on/index.dart';
import 'package:flutter_main/pages/road/road_sliding_horizontal_route_a_page.dart';
import 'package:flutter_main/utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import 'play_road_sliding_horizontal_route_page.dart';

class PlayRoadTabWidget extends GetView<BetOnController> {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  var allHeight = Gaps.w(142);

  var roadHeight = Gaps.w(102);


  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: allHeight,
        // color: Colors.deepOrange,
        child: Column(
          children: [Expanded(child: Container()), buildRoadTabWidget()],
        ));
  }

  Widget buildRoadTabWidget() {
    var _bottomSafeH = Gaps.w(0);

    /// 整个底部路子的高度（路子高度+安全区适配高度）
    var _roadHeight = allHeight + _bottomSafeH;
    return Container(
      width: double.infinity,
      height: _roadHeight,
      child: Column(
        children: [
          buildRoadToolBarWidget(),
          buildRoadContentWidget(),

          /// 此处用于适配底部安全区域
          // Expanded(child:  SizedBox(height: _bottomSafeH),)

        ],
      ),
    );
  }

  ///  底部路子图的 toolbar
  Widget buildRoadToolBarWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: AppColors.lightRoadCircleBackColor02,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12), // 左上角圆角半径
          topRight: Radius.circular(12), // 右上角圆角半径
          bottomLeft: Radius.circular(0), // 左下角圆角半径
          bottomRight: Radius.circular(0), // 右下角圆角半径
        ),
      ),
      height: Gaps.w(40),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(fontSize: 12,color: AppColors.lightCommonColor01),
              ),
              SizedBox(
                height: 0,
              ),
              // 三色圆圈
              CustomRoadPiechartCircleWidget(
                width: 14.w,
                height: 14.w,
              ),

              /// 微调居中适配
              SizedBox(
                height: 2,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(fontSize: 12,color: AppColors.lightCommonColor01),
              ),
              SizedBox(
                height: 0,
              ), // 圆圈中带有文字
              CustomRoadTextCircleWidget(
                  size: 14.w,
                  color: Colors.red,
                  text: "庄",
                  textStyle: TextStyle(
                      fontSize: 9, color: AppColors.lightCommonColor01)),

              /// 微调居中适配
              SizedBox(
                height: 2,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(fontSize: 12,color: AppColors.lightCommonColor01),
              ),
              SizedBox(
                height: 0,
              ),
              // 圆圈中带有文字
              CustomRoadTextCircleWidget(
                  size: 14.w,
                  color: Colors.blue,
                  text: "闲",
                  textStyle: TextStyle(
                      fontSize: 9, color: AppColors.lightCommonColor01)),

              /// 微调居中适配
              SizedBox(
                height: 2,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(fontSize: 12,color: AppColors.lightCommonColor01),
              ),
              SizedBox(
                height: 0,
              ),
              // 圆圈中带有文字
              CustomRoadTextCircleWidget(
                  size: 14.w,
                  color: Colors.green,
                  text: "和",
                  textStyle: TextStyle(
                      fontSize: 9, color: AppColors.lightCommonColor01)),

              /// 微调居中适配
              SizedBox(
                height: 2,
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(fontSize: 12,color: AppColors.lightCommonColor01),
              ),
              SizedBox(
                height: 0,
              ),
              CustomRoadLeftTopSolidCircleWidget(
                // 自定义大小
                size: 14.w,
                // 内部红色小圆圈的大小
                childSize: 6,
                // 外部圆圈的颜色
                outerCircleColor: globalController.mAppBgMode.value == 0
                    ? Colors.grey.shade300
                    : Colors.grey.shade400,
                // 内部圆圈的颜色
                innerCircleColor: Colors.red,
              ),

              /// 微调居中适配
              SizedBox(
                height: 2,
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "45",
                style: TextStyle(fontSize: 12,color: AppColors.lightCommonColor01),
              ),
              SizedBox(
                height: 0,
              ),
              CustomRoadRightBottomSolidCircleWidget(
                // 自定义大小
                size: 14.w,
                // 内部小圆圈的大小
                childSize: 6,
                // 外部圆圈的颜色
                outerCircleColor: globalController.mAppBgMode.value == 0
                    ? Colors.grey.shade300
                    : Colors.grey.shade400,
                // 内部圆圈的颜色
                innerCircleColor: Colors.blue,
              ),

              /// 微调居中适配
              SizedBox(
                height: 2,
              ),
            ],
          ),

          SizedBox(width: 1),

          /// 庄问路 按钮
          buildGameRoadToolBarBtn("庄问路", onTap: () {}),

          /// 闲问路 按钮
          buildGameRoadToolBarBtn("闲问路", onTap: () {}),

          /// 好路投注 按钮
          buildGameRoadToolBarBtn("好路投注", onTap: () {}),
        ],
      ),
    );
  }

  Widget buildGameRoadToolBarBtn(String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        width: 56.w,
        height: 30.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 30,
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 10, color: AppColors.lightTextColor01),
            )
          ],
        ),
      ),
    );
  }

  ///  游戏内页底部路子图
  Widget buildRoadContentWidget() {

    var _roadRightTopWidth = ScreenUtil().screenWidth - Gaps.w(136);



    return Container(
      width: double.infinity,
      height: Gaps.w(102),
      color: AppColors.lightRoadBackColor01,
      child: Row(
        children: [
          Container(
            width: Gaps.w(136),
            height: double.infinity,
            color: AppColors.lightRoadCircleBackColor01,

            // 左侧路子图
            child: Container(
              child: Obx((){
                return PlayRoadSlidingHorizontalRoutePage(
                  width: Gaps.w(136),
                  height: Gaps.w(102),
                  childData: controller.getSectorRoadData(RoadPaperType_Baccarat.MAIN_ROAD),
                  roadPaperType: RoadPaperType_Baccarat.MAIN_ROAD,
                );
              }),
              // child: PlayRoadSlidingHorizontalRoutePage(width: Gaps.w(136), height:  Gaps.w(102)),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  // 右侧上 路子图
                  Container(
                    height: Gaps.w(69),
                    width: _roadRightTopWidth,
                    color: AppColors.lightRoadCircleBackColor01,
                    child: Obx((){
                      return PlayRoadSlidingHorizontalRoutePage(
                        width: _roadRightTopWidth,
                        height: Gaps.w(69),
                        childData: controller.getBigPairNormalRoadData(),
                        zhishaData: controller.getBigPairZhiShaRoadData(),
                        roadPaperType: RoadPaperType_Baccarat.BIG_PAIR_AND_SUPER_SIX_ROAD,
                        // isBigPair: true,
                      );
                    }),

                  ),
                  // 右侧下 路子图，用 Expanded 包裹
                  Expanded(
                    child: Container(
                      width: _roadRightTopWidth,
                      height: Gaps.w(33),
                      color: AppColors.lightRoadCircleBackColor01,
                      child: Row(
                        children: [
                          Container(
                            width: _roadRightTopWidth/3,
                            height: Gaps.w(33),
                            child: Obx((){
                              return  PlayRoadSlidingHorizontalRoutePage(
                                width: _roadRightTopWidth/3,
                                height: Gaps.w(33),
                                childData: controller.getSectorRoadData(RoadPaperType_Baccarat.BIG_EYE_ROAD),
                                roadPaperType: RoadPaperType_Baccarat.BIG_EYE_ROAD,
                              );
                            })
                          ),
                          Container(
                            width: _roadRightTopWidth/3,
                            height: Gaps.w(33),
                            child: Obx((){
                              return  PlayRoadSlidingHorizontalRoutePage(
                                width: _roadRightTopWidth/3,
                                height: Gaps.w(33),
                                childData: controller.getSectorRoadData(RoadPaperType_Baccarat.SMALL_ROAD),
                                roadPaperType: RoadPaperType_Baccarat.SMALL_ROAD,

                              );
                            })
                          ),
                          Container(
                            width: _roadRightTopWidth/3,
                            height: Gaps.w(33),
                            child: Obx((){
                              return PlayRoadSlidingHorizontalRoutePage(
                                width: _roadRightTopWidth/3,
                                height: Gaps.w(33),
                                childData: controller.getSectorRoadData(RoadPaperType_Baccarat.SMALL_Q_ROAD),
                                roadPaperType: RoadPaperType_Baccarat.SMALL_Q_ROAD,
                              );
                            }),

                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }


}
