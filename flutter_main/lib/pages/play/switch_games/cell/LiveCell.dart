import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/road/custom_road_piechart_circle_widget.dart';
import '../../../../components/road/custom_road_text_circle_widget.dart';
import '../../../../configs/app_colors.dart';
import '../../../../models/ws/ws_10053_model.dart';
import '../../../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import '../../../../utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';
import '../../../road/road_sliding_horizontal_route_page.dart';
import '../../play_router.dart';

class LiveCell extends StatelessWidget {
  LiveCell({required this.model});

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

    // print("当前的路子结果为 ${roadInfoList.toList()}");
    //
    // print("当前桌名字是${_cellData.tableName}");
    //
    // print("当前图片地址是${_cellData.dealerPicTable}");

    /// 底部统计数据
    /// 总共
    var _totalCount = _cellData.bootReport?.totalCount ?? 0;

    /// 庄
    var _zhuangCount = _cellData.bootReport?.items?.first.winCount ?? 0;

    /// 闲
    var _xianCount = _cellData.bootReport?.items?[2].winCount ?? 0;

    /// 和
    var _heCount = _cellData.bootReport?.items?[3].winCount ?? 0;

    /// 获取主播的背景图片  如果有展示，没有展示空widget
    Widget getDealerPicWidget() {
      var _dealerPic = _cellData.dealerPicTable ?? "";
      if (_dealerPic.isEmpty || _dealerPic == "") {
        return Container();
      } else {
        return Image.network(_cellData.dealerPicTable ?? "", fit: BoxFit.fill);
      }
    }

    return GestureDetector(
      /// cell点击跳转事件 --- 跳转到游戏页面
      onTap: () {
        PlayRouter.pushPlayRoom(cellData: _cellData);
      },

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), // 圆角
        ),
        child: Stack(
          children: [
            /// 主播展示图是占据整个cell的
            Container(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: globalController.mAppBgMode.value == 1
                    ? Colors.white
                    : AppColors.darkBackgroundColor08,
                child: getDealerPicWidget(),
              ),
            ),

            /// cell中所有的布局
            Column(
              children: [
                /// 主播内容
                Stack(
                  children: [
                    Container(
                      height: 110.h,
                      width: double.infinity,
                      // color: Colors.transparent,
                      child: Column(
                        children: [
                          /// 经典  结算中
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: Row(
                              // 两端对齐
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// 左上角描述文字
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.h),
                                    // 圆角
                                    color: AppColors.lightBackgroundColor07,
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 2.h),
                                  child: Center(
                                    child: Text(

                                        /// 桌名  例：极速K18
                                        _cellData.tableName ?? '',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: AppColors.lightTextColor04)),
                                  ),
                                ),

                                /// 状态 ｜ 倒计时
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.h),
                                    // 圆角
                                    color: AppColors.lightBackgroundColor07,
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 2.h),
                                  child: Center(
                                    child: Text("结算中",
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: AppColors.lightTextColor04)),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// 观看人数
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // 小头像+观看人数
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.h),
                                    // 圆角
                                    color: AppColors.lightBackgroundColor07,
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 2.h),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person,
                                          color: AppColors.lightTextColor04,
                                          size: 12.w),
                                      SizedBox(width: 0),
                                      Text(
                                          "${_cellData.tableOnline?.onlineNumber}",
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              color:
                                                  AppColors.lightTextColor04))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Text("")),

                          /// 限红  连胜
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: Row(
                              // 两端对齐
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// 左下角描述文字
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.h),
                                    // 圆角
                                    color: AppColors.lightBackgroundColor07,
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 2.h),
                                  child: Center(
                                    child: Text("限红:20-10000",
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            color: AppColors.lightTextColor04)),
                                  ),
                                ),

                                /// 连胜图片
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.h),
                                    // 圆角
                                    color: AppColors.lightBackgroundColor07,
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(6.w, 2.h, 6.w, 2.h),
                                  child: Center(
                                    child: Image.asset(
                                        'assets/images/road/roadPaperIcon/1.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                /// 路子图
                Expanded(
                  child: Container(
                    // height: 74.h,
                    width: double.infinity,
                    color: globalController.mAppBgMode.value == 1
                        ? AppColors.lightBackgroundColor06
                        : AppColors.darkBackgroundColor06,

                    //⚠️注意哦:构建组件时获取父组件约束，从而确定子组件的大小。确保只测量一次尺寸，避免重建,节省性能～
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        // 获取容器的宽高
                        double width = constraints.maxWidth;
                        double height = constraints.maxHeight;
                        // _cellData.roadInfo?.mainRoadInfo?.roadList ?? [[]]
                        return RoadSlidingHorizontalRoutePage(
                          width: width,
                          height: height,
                          childData: roadInfoList,
                        );
                      },
                    ),
                  ),
                ),

                /// 底部统计
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: globalController.mAppBgMode.value == 1
                          ? [
                              AppColors.lightCommonColor01,
                              AppColors.lightBackgroundColor09
                            ] // 白天模式渐变
                          : [
                              AppColors.darkBackgroundColor08,
                              AppColors.darkBackgroundColor09
                            ], // 夜间模式渐变
                      begin: Alignment.topCenter, // 从顶部开始
                      end: Alignment.bottomCenter, // 到底部结束
                    ),
                  ),
                  height: 16.h,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: [
                            // 三色圆圈  此处为总数
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
                        Row(
                          children: [
                            // 圆圈中带有文字
                            CustomRoadTextCircleWidget(
                                size: 14.w,
                                color: Colors.red,
                                text: "庄",
                                textStyle: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.lightCommonColor01)),
                            SizedBox(width: 2),
                            Text(
                              "${_zhuangCount}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.lightTextColor05),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            // 圆圈中带有文字
                            CustomRoadTextCircleWidget(
                                size: 14.w,
                                color: Colors.blue,
                                text: "闲",
                                textStyle: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.lightCommonColor01)),
                            SizedBox(width: 2),
                            Text(
                              "${_xianCount}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.lightTextColor05),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            // 圆圈中带有文字
                            CustomRoadTextCircleWidget(
                                size: 14.w,
                                color: Colors.green,
                                text: "和",
                                textStyle: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.lightCommonColor01)),
                            SizedBox(width: 2),
                            Text(
                              "${_heCount}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.lightTextColor05),
                            )
                          ],
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
