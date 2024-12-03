import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/app_colors.dart';
import '../../../../models/ws/ws_10053_model.dart';
import '../../../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import '../../../../utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';
import '../../../road/road_sliding_horizontal_route_page.dart';
import '../../play_router.dart';

class SimpleCell extends StatelessWidget {
  SimpleCell({required this.model});

  Ws10053TableModel model;

  GlobalController get globalController => GlobalController.controller;

  @override
  Widget build(BuildContext context) {
    // 当前cell的数据内容 （如果不全再去model里添加）
    var _cellData = model;

    //  加密路子 字符串
    var bigPairRoadStr = _cellData.roadPaper?.bigPairRoad ?? "";
    // print("当前的路子加密字符串为 ${bigPairRoadStr}");

    /// 解密路子图
    var roadInfoListData = RoadPaperUIDataTool_Baccarat.GetRoadPaperUIData(
        bigPairRoadStr, RoadPaperType_Baccarat.BIG_PAIR_ROAD);

    var roadInfoList =
        roadInfoListData?.baseUIData?.allRoadPaperTextList ?? [[]];

    return GestureDetector(
      /// cell点击跳转事件 --- 跳转到游戏页面
      onTap: () {
        PlayRouter.pushPlayRoom(cellData: _cellData);
      },

      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), // 圆角
            color: globalController.mAppBgMode.value == 1
                ? AppColors.lightBackgroundColor06
                : AppColors.darkBackgroundColor06,
          ),
          child: Column(
            children: [
              /// 顶部信息
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: globalController.mAppBgMode.value == 1
                      ? [
                          AppColors.lightCommonColor01,
                          AppColors.lightBackgroundColor09
                        ] // 白天模式渐变
                      : [
                          AppColors.darkBackgroundColor08,
                          AppColors.darkBackgroundColor09
                        ],
                )),
                width: double.infinity,
                height: 20.h,
                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(

                        /// 左上角文字内容
                        _cellData.tableName ?? '',
                        style: TextStyle(
                            fontSize: 10,
                            color: globalController.mAppBgMode.value == 1
                                ? AppColors.lightTextColor06
                                : AppColors.darkTextColor06)),
                    Text("20-200000",
                        style: TextStyle(
                            fontSize: 10,
                            color: globalController.mAppBgMode.value == 1
                                ? AppColors.lightTextColor06
                                : AppColors.darkTextColor06))
                  ],
                ),
              ),

              /// 路子图布局
              Expanded(
                //⚠️注意哦:使用LayoutBuilder构建组件时获取父组件约束，从而确定子组件的大小。确保只测量一次尺寸，避免重建,节省性能～
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // 获取容器的宽高
                    double width = constraints.maxWidth;
                    double height = constraints.maxHeight;
                    return RoadSlidingHorizontalRoutePage(
                      width: width,
                      height: height,
                      childData: roadInfoList,
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
