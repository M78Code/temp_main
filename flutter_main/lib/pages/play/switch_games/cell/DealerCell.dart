import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/road/custom_road_left_top_solid_circle_widget.dart';
import '../../../../components/road/custom_road_piechart_circle_widget.dart';
import '../../../../components/road/custom_road_right_bottom_solid_circle_widget.dart';
import '../../../../components/road/custom_road_text_circle_widget.dart';
import '../../../../configs/app_colors.dart';
import '../../../../models/ws/ws_10053_model.dart';
import '../../../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import '../../../../utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';
import '../../../road/road_sliding_horizontal_route_page.dart';
import '../../play_router.dart';

class DealerCell extends StatelessWidget {
  DealerCell({required this.model});

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

    /// 底部统计数据
    /// 总共
    var _totalCount = _cellData.bootReport?.totalCount ?? 0;

    /// 庄
    var _zhuangCount = _cellData.bootReport?.items?.first.winCount ?? 0;

    /// 庄免佣
    var _zhuangMianYongCount = _cellData.bootReport?.items?[1].winCount ?? 0;

    /// 闲
    var _xianCount = _cellData.bootReport?.items?[2].winCount ?? 0;

    /// 和
    var _heCount = _cellData.bootReport?.items?[3].winCount ?? 0;

    /// 庄对
    var _zhuangPairCount = _cellData.bootReport?.items?[4].winCount ?? 0;

    /// 闲对
    var _xianPairCount = _cellData.bootReport?.items?[5].winCount ?? 0;

    /// 超级六
    var _chaojiLiuCount = _cellData.bootReport?.items?[6].winCount ?? 0;

    /// 观看人数
    var _watchingCount = _cellData.tableOnline?.onlineNumber ?? 0;

    /// 获取主播的背景图片  如果有展示，没有展示空widget
    Widget getDealerPicWidget() {
      var _dealerPic = _cellData.dealerPic ?? "";
      if (_dealerPic.isEmpty || _dealerPic == "") {
        return Container();
      } else {
        return Image.network(_cellData.dealerPic ?? "", fit: BoxFit.fill);
      }
    }

    return Container(
      height: 134.h,
      child: GestureDetector(
        onTap: () {
          PlayRouter.pushPlayRoom(cellData: _cellData);
        },
        child: Column(
          children: [
            /// 顶部信息
            Container(
              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
              height: 20.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: globalController.mAppBgMode.value == 1
                      ? [
                          // 白天模式渐变
                          AppColors.lightCommonColor01,
                          AppColors.lightBackgroundColor09
                        ]
                      : [
                          // 黑天模式渐变
                          AppColors.darkBackgroundColor08,
                          AppColors.darkBackgroundColor09
                        ],
                ),
                // 设置部分圆角
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), // 左上角圆角半径
                  topRight: Radius.circular(4), // 右上角圆角半径
                  bottomLeft: Radius.circular(0), // 左下角圆角半径
                  bottomRight: Radius.circular(0), // 右下角圆角半径
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(

                      /// 桌名  例：极速K18
                      _cellData.tableName ?? '',
                      style: TextStyle(
                          fontSize: 12,
                          color: globalController.mAppBgMode.value == 1
                              ? AppColors.lightTextColor07
                              : AppColors.darkTextColor07)),
                  Text(
                      "限红：${_cellData.playerTableBetLimit?.min ?? 0}-${_cellData.playerTableBetLimit?.max ?? 0}",
                      style: TextStyle(
                          fontSize: 10,
                          color: globalController.mAppBgMode.value == 1
                              ? AppColors.lightTextColor07
                              : AppColors.darkTextColor07)),
                  Text("结算中",
                      style: TextStyle(
                          fontSize: 10,
                          color: globalController.mAppBgMode.value == 1
                              ? AppColors.lightTextColor07
                              : AppColors.darkTextColor07)),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              height: 104.h,
              child: Row(
                children: [
                  /// 左侧的主播图片
                  Container(
                    height: double.infinity,
                    width: 76.w,
                    color: Colors.blue,
                    child: getDealerPicWidget(),
                  ),
                  // 占据row横向剩余宽度
                  Expanded(
                    child: Container(
                      height: double.infinity, // 高度 84.h
                      child: Column(
                        children: [
                          /// 中间的路子图 占据剩余高度  84.h
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: globalController.mAppBgMode.value == 1
                                    ? AppColors.lightBackgroundColor06
                                    : AppColors.darkBackgroundColor06,
                              ),
                              //⚠️注意哦:构建组件时获取父组件约束，从而确定子组件的大小。确保只测量一次尺寸，避免重建,节省性能～
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  // 获取容器的宽高
                                  double width = constraints.maxWidth;
                                  double height = constraints.maxHeight;
                                  return RoadSlidingHorizontalRoutePage(
                                      width: width,
                                      height: height,
                                      childData: roadInfoList);
                                },
                              ),
                            ),
                          ),

                          /// 底部信息
                          Container(
                            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: globalController.mAppBgMode.value == 1
                                    ? [
                                        // 白天模式渐变
                                        AppColors.lightCommonColor01,
                                        AppColors.lightBackgroundColor09
                                      ]
                                    : [
                                        // 黑天模式渐变
                                        AppColors.darkBackgroundColor08,
                                        AppColors.darkBackgroundColor09
                                      ],
                              ),
                              // 设置部分圆角
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0), // 左上角圆角半径
                                topRight: Radius.circular(0), // 右上角圆角半径
                                bottomLeft: Radius.circular(4), // 左下角圆角半径
                                bottomRight: Radius.circular(4), // 右下角圆角半径
                              ),
                            ),
                            width: double.infinity,
                            height: 20.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// 总数
                                Row(
                                  children: [
                                    // 三色圆圈
                                    CustomRoadPiechartCircleWidget(
                                      width: 14.w,
                                      height: 14.w,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "${_totalCount}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                ),

                                /// 庄
                                Row(
                                  children: [
                                    // 圆圈中带有文字
                                    CustomRoadTextCircleWidget(
                                        size: 14.w,
                                        color: Colors.red,
                                        text: "庄",
                                        textStyle: TextStyle(
                                            fontSize: 9,
                                            color:
                                                AppColors.lightCommonColor01)),
                                    SizedBox(width: 2),
                                    Text(
                                      "${_zhuangCount}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                ),

                                /// 闲
                                Row(
                                  children: [
                                    // 圆圈中带有文字
                                    CustomRoadTextCircleWidget(
                                        size: 14.w,
                                        color: Colors.blue,
                                        text: "闲",
                                        textStyle: TextStyle(
                                            fontSize: 9,
                                            color:
                                                AppColors.lightCommonColor01)),
                                    SizedBox(width: 2),
                                    Text(
                                      "${_xianCount}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                ),

                                /// 和
                                Row(
                                  children: [
                                    // 圆圈中带有文字
                                    CustomRoadTextCircleWidget(
                                        size: 14.w,
                                        color: Colors.green,
                                        text: "和",
                                        textStyle: TextStyle(
                                            fontSize: 9,
                                            color:
                                                AppColors.lightCommonColor01)),
                                    SizedBox(width: 2),
                                    Text(
                                      "${_heCount}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                ),

                                /// 庄对
                                Row(
                                  children: [
                                    CustomRoadLeftTopSolidCircleWidget(
                                      // 自定义大小
                                      size: 14.w,
                                      // 内部红色小圆圈的大小
                                      childSize: 6,
                                      // 外部圆圈的颜色
                                      outerCircleColor:
                                          globalController.mAppBgMode.value == 1
                                              ? Colors.grey.shade300
                                              : Colors.grey.shade400,
                                      // 内部圆圈的颜色
                                      innerCircleColor: Colors.red,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "$_zhuangPairCount",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                ),

                                /// 闲对
                                Row(
                                  children: [
                                    CustomRoadRightBottomSolidCircleWidget(
                                      // 自定义大小
                                      size: 14.w,
                                      // 内部小圆圈的大小
                                      childSize: 6,
                                      // 外部圆圈的颜色
                                      outerCircleColor:
                                          globalController.mAppBgMode.value == 1
                                              ? Colors.grey.shade300
                                              : Colors.grey.shade400,
                                      // 内部圆圈的颜色
                                      innerCircleColor: Colors.blue,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "$_xianPairCount",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                ),

                                /// 观看人数
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey.shade400,
                                      size: 14.w,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      "$_watchingCount",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.lightTextColor05),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
