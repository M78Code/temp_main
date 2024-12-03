import 'package:flutter/material.dart';
import 'package:flutter_main/components/road/custom_road_piechart_circle_widget.dart';
import 'package:flutter_main/components/road/custom_road_text_circle_widget.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/pages/road/road_sliding_horizontal_route_page.dart';
import 'package:flutter_main/utils/RoadPaper/Data/RoadPaperEnum.dart';
import 'package:flutter_main/utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 首页 - 好路 - 现场模式列表
class RoadHomeLiveList extends StatefulWidget {
  const RoadHomeLiveList({super.key});

  @override
  State<RoadHomeLiveList> createState() => _RoadHomeLiveListState();
}

class _RoadHomeLiveListState extends State<RoadHomeLiveList> {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  // 总的返回的 map
  Map<String, dynamic>? gameTables;

  // 此model暂时没用到
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
    //   print("现场模式监听到了10053的总Map");
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

  /// 此处暂时弃用  没问题了再删掉
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
    return buildGridView();
  }

  Widget buildGridView() {
    //  总桌子的数量
    var _itemcount = gameTables?.keys.length ?? 0;

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行两列
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        // 宽高比，控制每个卡片的高度
        childAspectRatio: 0.84,
      ),
      itemCount: _itemcount,
      itemBuilder: (BuildContext context, int index) {
        return buildGridViewCell(context, index);
      },
    );
  }

  /// 创建每个cell
  Widget buildGridViewCell(BuildContext context, int index) {
    // 检查 keysTableIdList 和 tableDataList 的边界，防止越界
    // if (keysTableIdList == null || keysTableIdList!.length <= index || tableDataList.length <= index) {
    //   // 如果越界，返回一个空的 SizedBox
    //   return SizedBox.shrink();
    // }
    // 检查索引是否在列表长度范围内
    if (index >= tableDataList.length) {
      print("索引长度超出范围");
      return Container(
        child: Text("数据加载中..."), // 提供一个占位视图，或其他默认内容
      );
    }

    // 当前的桌号
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
