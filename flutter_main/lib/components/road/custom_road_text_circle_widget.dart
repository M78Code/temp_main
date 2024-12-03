import 'package:flutter/material.dart';

/// 圆圈里可以写文字
class CustomRoadTextCircleWidget extends StatelessWidget {
  final double size; // 圆圈大小
  final Color color; // 圆圈颜色
  final String text; // 圆圈中的文字
  final TextStyle? textStyle; // 文字样式

  CustomRoadTextCircleWidget({
    required this.size,
    required this.color,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle ?? TextStyle(fontSize: size / 2, color: Colors.white), // 默认样式
        ),
      ),
    );
  }
}
