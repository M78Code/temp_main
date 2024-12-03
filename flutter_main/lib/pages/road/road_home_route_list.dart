import 'package:flutter/material.dart';
import 'package:flutter_main/components/road/custom_road_left_top_solid_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_piechart_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_right_bottom_solid_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_text_circle_widget.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/pages/road/road_sliding_horizontal_route_page.dart';
import 'package:flutter_main/utils/event_bus_util.dart';
import 'package:flutter_main/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import '../../utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';

/// 首页 - 好路 - 路纸模式列表
class RoadHomeRouteList extends StatefulWidget {
  const RoadHomeRouteList({super.key});

  @override
  State<RoadHomeRouteList> createState() => _RoadHomeRouteListState();
}

class _RoadHomeRouteListState extends State<RoadHomeRouteList> {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  // 总的返回的 map
  Map<String, dynamic>? gameTables;

  Ws10053TableModel? roadModel;

  // 通过eventBus 拿到的map 过滤出来的总的桌号的数组
  List<String>? keysTableIdList;

  // 通过key 拿到所有的数据，组合的内容list
  List<Ws10053TableModel> tableDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // EventBusRoadUtil.eventBus.on<Ws10053GameTableMapModelEvent>().listen((event){
    //   print("荷官模式监听到了10053的总Map");
    //
    //   _loadData(event);
    // });
    // 初始化时从单例中获取数据
    _updateDataFromModel();

    EventBusRoadUtil.eventBus.on<GameTableUpdatedEvent>().listen((event) {
      // 当收到事件时，重新获取单例中的数据，并刷新UI
      _updateDataFromModel();
    });
  }

  // 从 RoadHomeTableModelManager 获取最新数据
  void _updateDataFromModel() {
    gameTables = RoadHomeTableModelManager().gameTables;
    keysTableIdList = RoadHomeTableModelManager().keysTableIdList;
    tableDataList = RoadHomeTableModelManager().tableDataList;
    setState(() {});
  }

  /// 此处暂时弃用 没问题了再删掉
  Future<void> _loadData(Ws10053GameTableMapModelEvent event) async {
    setState(() {
      gameTables = event.mainMap;

      /// 总的桌号数组
      keysTableIdList = event.mainMap.keys.toList();

      // 遍历 拿到数据内容
      keysTableIdList?.forEach((tableId) {
        // 所有的数据内容组合
        Map<String, dynamic> dict = gameTables?[tableId];
        var ws10053Model = Ws10053TableModel.fromJson(dict);
        tableDataList.add(ws10053Model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildListView();
  }

  Widget buildListView() {
    //  总桌子的数量
    var _itemcount = gameTables?.keys.length ?? 0;
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 10),
        itemCount: _itemcount,
        itemBuilder: (context, index) {
          return buildListViewCell(context, index);
        });
  }

  Widget buildListViewCell(BuildContext context, int index) {
    var _tableId = keysTableIdList?[index].toString();
    // 当前cell的数据内容 （如果不全再去model里添加）
    var _cellData = tableDataList[index];

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

    return GestureDetector(
      /// cell点击跳转事件 --- 跳转到游戏页面
      onTap: () {
        PlayRouter.pushPlayRoom(cellData: _cellData);
      },

      child: Container(
        height: 124.h,
        child: Column(
          children: [
            /// 顶部信息
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
                  topLeft: Radius.circular(4), // 左上角圆角半径
                  topRight: Radius.circular(4), // 右上角圆角半径
                  bottomLeft: Radius.circular(0), // 左下角圆角半径
                  bottomRight: Radius.circular(0), // 右下角圆角半径
                ),
              ),
              height: 20.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(

                      /// 左上角文字内容
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

            /// 中间的路子图
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: globalController.mAppBgMode.value == 1
                      ? AppColors.lightBackgroundColor06
                      : AppColors.darkBackgroundColor06,
                ),
                //⚠️注意哦:构建组件时获取父组件约束，从而确定子组件的大小。确保只测量一次尺寸，避免重建,节省性能～
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    // 获取容器的宽高
                    double width = constraints.maxWidth;
                    double height = constraints.maxHeight;
                    return RoadSlidingHorizontalRoutePage(
                        width: width, height: height, childData: roadInfoList);
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
                  /// 总数量
                  Row(
                    children: [
                      // 三色圆圈
                      CustomRoadPiechartCircleWidget(
                        width: 14.w,
                        height: 14.w,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "$_totalCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
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
                              color: AppColors.lightCommonColor01)),
                      SizedBox(width: 2),
                      Text(
                        "$_zhuangCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
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
                        "$_xianCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
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
                        "$_heCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
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
                        outerCircleColor: globalController.mAppBgMode.value == 1
                            ? Colors.grey.shade300
                            : Colors.grey.shade400,
                        // 内部圆圈的颜色
                        innerCircleColor: Colors.red,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "$_zhuangPairCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
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
                        outerCircleColor: globalController.mAppBgMode.value == 1
                            ? Colors.grey.shade300
                            : Colors.grey.shade400,
                        // 内部圆圈的颜色
                        innerCircleColor: Colors.blue,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "$_xianPairCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
                      )
                    ],
                  ),

                  /// 超级六
                  Row(
                    children: [
                      // 圆圈中带有文字
                      CustomRoadTextCircleWidget(
                          size: 14.w,
                          color: Colors.deepOrangeAccent,
                          text: "6",
                          textStyle: TextStyle(
                              fontSize: 9,
                              color: AppColors.lightCommonColor01)),
                      SizedBox(width: 2),
                      Text(
                        "$_chaojiLiuCount",
                        style: TextStyle(
                            fontSize: 10, color: AppColors.lightTextColor05),
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
                            fontSize: 10, color: AppColors.lightTextColor05),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
