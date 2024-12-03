import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/pages/road/road_sliding_horizontal_route_page.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import '../../utils/RoadPaper/Tool/RoadPaperUIDataTool_Baccarat.dart';

/// 首页 - 好路 - 极简模式列表
class RoadHomeSimpleList extends StatefulWidget {
  const RoadHomeSimpleList({super.key});

  @override
  State<RoadHomeSimpleList> createState() => _RoadHomeSimpleListState();
}

class _RoadHomeSimpleListState extends State<RoadHomeSimpleList> {
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

  /// 此处暂时启用  没问题了再删掉
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
      padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行两列
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        // 宽高比，控制每个卡片的高度
        childAspectRatio: 1.73,
      ),
      itemCount: _itemcount,
      itemBuilder: (BuildContext context, int index) {
        return buildGridViewCell(context, index);
      },
    );
  }

  /// 创建每个cell
  Widget buildGridViewCell(BuildContext context, int index) {
    // 检查索引是否在列表长度范围内
    if (index >= tableDataList.length) {
      print("索引长度超出范围");
      return Container(
        child: Text("数据加载中..."), // 提供一个占位视图，或其他默认内容
      );
    }

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
