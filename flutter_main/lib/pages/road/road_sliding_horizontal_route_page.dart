import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/pages/road/home_json.dart';
import 'package:flutter_main/pages/road/home_json.dart';
import 'package:flutter_main/resourceLoader/roadPaperIcon_loader.dart';
import 'package:flutter_main/utils/event_bus_util.dart';

/// 横向滑动路子图
class RoadSlidingHorizontalRoutePage extends StatefulWidget {
  // 当前路子的总宽度
  final double width;

  // 当前路子的总高度
  final double height;

  // 父组件传过来的路子数据
  final List<List<String>>? childData;

   RoadSlidingHorizontalRoutePage({
    required this.width,
    required this.height,
     this.childData = const [[]]
   });

  @override
  State<RoadSlidingHorizontalRoutePage> createState() =>
      _RoadSlidingHorizontalRoutePageState();
}

class _RoadSlidingHorizontalRoutePageState
    extends State<RoadSlidingHorizontalRoutePage> {

  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  final ScrollController _scrollController = ScrollController();

  // 首页路子图 行数 (固定 6 行)
  final int _rowCount = 6;

  // 初始列数
  late int _columnCount;

  // 二维数组数据
  List<List<String>> data = [
    ["些", "嗒", "裤", "节","界", ""],
    ["骝", "蕖", "绣", "", "", ""],
    ["机","集","鸡","伤", "", ""],
    ["节","界","接","瘤", "", ""],
    ["蛰","瑰","噷","狃", "", ""],
    // ["踢", "桧", "劼", "", "", ""],
    // ["些", "嗒", "裤", "节","界", "集"],
    // ["些", "嗒", "裤", "节","界", "集"],
    // ["些", "嗒", "裤", "节","界", "集"],
    // ["些", "嗒", "裤", "节","界", "集"],
    // ["", "", "", "","", ""],

  ];

  Ws10053TableModel? roadModel;


  @override
  void didUpdateWidget(covariant RoadSlidingHorizontalRoutePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // 当父组件传入新数据时候，在此处更新数据
    // 当新的 childData 传入时，更新数据
    if (widget.childData != oldWidget.childData) {
      setState(() {
        data = RoadPaperIconLoader.batchRoadPaperIcon(
            words: widget.childData ?? [[]]);
        _updateColumnCount();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    data = RoadPaperIconLoader.batchRoadPaperIcon(words: data);
    _columnCount = (widget.width * 6) ~/ _rowCount;

    // 在小部件构建完成后自动滚动到有数据的倒数第二列
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollToRightTwoColumns();
    // });

    // this.roadModel = ws10053ModelFromJson(homeJsonString);

    // EventBusRoadUtil.eventBus
    //     .on<Ws10053TableModelEvent>()
    //     .listen((event) async {
    //   String? name = event.mainModel.gameCasinoName;
    //
    //   print("直播列表接受到的数据为${name}");
    //   await _loadData(event);
    // });

  }


  Future<void> _loadData(Ws10053TableModelEvent event) async {
    setState(() {
      this.roadModel = event.mainModel;
      // data = event.mainModel.roadInfo?.mainRoadInfo.roadList?;
     // data.clear();
      data = event.mainModel.roadInfo?.mainRoadInfo?.roadList ?? [
        ["", "", "", "","", ""],
      ];
     // _updateColumnCount();

    });
  }

  void _updateColumnCount() {
    /// 对列数进行适配  此处可以自已根据项目x需求 自定义
    var myColumnCount = (widget.width * 3) ~/ _rowCount;
    if (data.length < myColumnCount) {
      _columnCount = myColumnCount;
    } else {
      _columnCount = data.length + ((widget.width) ~/ _rowCount);
    }
  }

  void _scrollToRightTwoColumns() {
    // 如果数据填满整个 GridView，向右滚动两列
    int targetColumnIndex = 2; // 向右滚动两列
    if (data.length < targetColumnIndex + 1) {
      targetColumnIndex = data.length - 1; // 确保不会滚动超过数据的范围
    }

    // 计算每一列的宽度
    double columnWidth = _scrollController.position.maxScrollExtent / (_columnCount - 1);
    // 滚动到目标列的位置
    double scrollPosition = targetColumnIndex * columnWidth;

    _scrollController.animateTo(
      scrollPosition,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  // void _addNewColumn() {
  //   setState(() {
  //     // 添加一组新的数据
  //     // data.add([0, 1, 2, 3, 4, 5]);
  //     var colCount = (widget.width * 2) ~/ _rowCount;
  //     // 更新列数，确保至少有  列
  //     _columnCount = data.length > colCount ? data.length : colCount;
  //
  //     // 延迟滚动到最后一列，等待界面更新
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       _scrollToLastColumn();
  //     });
  //   });
  // }

  void _scrollToLastColumn() {
    // 计算数据的最后一列索引
    int lastColumnIndex = data.length - 1;

    // 计算每一列的宽度
    double columnWidth = _scrollController.position.maxScrollExtent / (_columnCount - 1);

    // 滚动到数据最后一列的位置
    double scrollPosition = lastColumnIndex * columnWidth;

    _scrollController.animateTo(
      scrollPosition,
      duration: Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildGridView(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// 创建网格视图
  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      // 用来监听滚动事件
      controller: _scrollController,
      // 设置横向滚动
      scrollDirection: Axis.horizontal,
      // 设置固定行数
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _rowCount),
      itemCount: _rowCount * _columnCount,
      itemBuilder: (context, index) {
        // 计算当前单元格的行和列
        int row = index % _rowCount;
        int column = index ~/ _rowCount;

        // 检查数据是否存在
        // bool hasData = column < data.length && row < data[column].length;
        //
        // String value = hasData ? data[column][row] : "";

        bool hasData = column < data.length && row < (data[column].length ?? 0);
        // if (row > 5) {
        //   row = 5;
        // }
        String value = hasData ? data[column][row] : "";


        Color textColor;
        if (index == 6) {
          textColor = Colors.red;
        } else if (index == 8) {
          textColor = Colors.purple;
        } else if (index == 12) {
          textColor = Colors.green;
        } else if (index == 17) {
          textColor = Colors.yellow;
        } else {
          textColor = Colors.blueAccent;
        }

        return Container(
          decoration: BoxDecoration(
            border: Border(
              left: column == 0
                  ? BorderSide(width: 1, color: globalController.mAppBgMode.value == 1
                    ? AppColors.lightRoadLineColor02
                    : AppColors.darkRoadLineColor02)
                  : BorderSide.none,
              top: row == 0
                  ? BorderSide(width: 1, color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightRoadLineColor02
                  : AppColors.darkRoadLineColor02)
                  : BorderSide.none,
              right:
              BorderSide(width: 1, color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightRoadLineColor02
                  : AppColors.darkRoadLineColor02),
              bottom:
              BorderSide(width: 1, color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightRoadLineColor02
                  : AppColors.darkRoadLineColor02),
            ),
          ),
          child: value.isNotEmpty ? Image.asset(value) : null
        );
      },
    );
  }
}


