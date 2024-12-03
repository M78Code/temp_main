
import 'package:flutter/material.dart';

class CustomRoadLeftTopSolidCircleWidget extends StatelessWidget {
  final double size; // 大圆的大小
  final double childSize; // 内部小圆圈的大小
  final Color outerCircleColor; // 大圆的颜色
  final Color innerCircleColor; // 小圆的颜色

  const CustomRoadLeftTopSolidCircleWidget({
    Key? key,
    required this.size,
    required this.childSize,
    required this.outerCircleColor,
    required this.innerCircleColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // 中心对齐
      children: [
        // 外部大圆
        Container(
          width: size, // 使用传入的大小
          height: size, // 使用传入的大小
          decoration: BoxDecoration(
            color: outerCircleColor, // 使用传入的颜色
            shape: BoxShape.circle, // 圆形
          ),
        ),
        // 内部小圆
        Positioned(
          top: size / 10, // 根据大圆的大小调整小圆的位置
          left: size / 10, // 根据大圆的大小调整小圆的位置
          child: Container(
            width: childSize, // 使用传入的小圆大小
            height: childSize, // 使用传入的小圆大小
            decoration: BoxDecoration(
              color: innerCircleColor, // 使用传入的颜色
              shape: BoxShape.circle, // 圆形
              border: Border.all( // 添加边框
                color: Colors.white, // 边框颜色
                width: 1, // 边框宽度
              ),
            ),
          ),
        ),
      ],
    );
  }
}
