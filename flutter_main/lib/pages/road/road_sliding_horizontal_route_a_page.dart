import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/pages/road/home_json.dart';
import 'package:flutter_main/utils/event_bus_util.dart';

/// 横向滑动路子图
class RoadSlidingHorizontalRoutePageA extends StatefulWidget {
  // 当前路子的总宽度
  final double width;

  // 当前路子的总高度
  final double height;

  RoadSlidingHorizontalRoutePageA({required this.width, required this.height});

  @override
  State<RoadSlidingHorizontalRoutePageA> createState() =>
      _RoadSlidingHorizontalRoutePageAState();
}

class _RoadSlidingHorizontalRoutePageAState
    extends State<RoadSlidingHorizontalRoutePageA> {
  final ScrollController _scrollController = ScrollController();


  // 首页路子图 行数 (固定 6 行)
  final int _rowCount = 6;

  // 初始列数
  late int _columnCount;

  // 二维数组数据
  List<List<String>> data = [
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _columnCount = (widget.width * 2) ~/ _rowCount;

    // 在小部件构建完成后自动滚动到有数据的倒数第二列
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToRightTwoColumns();
    });



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

  void _addNewColumn() {
    setState(() {
      // 添加一组新的数据
      // data.add([0, 1, 2, 3, 4, 5]);
      var colCount = (widget.width * 2) ~/ _rowCount;
      // 更新列数，确保至少有  列
      _columnCount = data.length > colCount ? data.length : colCount;

      // 延迟滚动到最后一列，等待界面更新
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToLastColumn();
      });
    });
  }

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
    bool hasData = column < data.length && row < data[column].length;

    String value = hasData ? data[column][row] : "kk";

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
              ? BorderSide(width: 1, color: AppColors.lightRoadLineColor01)
              : BorderSide.none,
          top: row == 0
              ? BorderSide(width: 1, color: AppColors.lightRoadLineColor01)
              : BorderSide.none,
          right:
          BorderSide(width: 1, color: AppColors.lightRoadLineColor01),
          bottom:
          BorderSide(width: 1, color: AppColors.lightRoadLineColor01),
        ),
      ),
      child: Center(
        child: hasData
            ? Container(
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          width: double.infinity,
          height: double.infinity,
          child: Text(
            textAlign: TextAlign.center,
            '$value',
            style: TextStyle(color: textColor, fontSize: 10 // 使用选择的颜色
            ),
          ),
        )
            : null, // 没有数据时显示为空
      ),
    );
    },
    );
  }
}