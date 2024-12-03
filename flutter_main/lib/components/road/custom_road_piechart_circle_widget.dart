import 'dart:math';
import 'package:flutter/material.dart';

/// 三色圆圈 红绿蓝
class CustomRoadPiechartCircleWidget extends StatelessWidget {
  final List<double> angles;
  final List<Color> colors;
  final double width;
  final double height;

  // 构造函数，设置默认值
  CustomRoadPiechartCircleWidget({super.key,
    this.angles = const [120, 120, 120], // 默认三个扇区，每个120度
    this.colors = const [ Colors.green, Colors.blue,Colors.red], // 默认红绿蓝
    this.width = 200.0,
    this.height = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: PieChartPainter(angles: angles, colors: colors),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<double> angles;
  final List<Color> colors;

  PieChartPainter({required this.angles, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    Paint paint = Paint()..style = PaintingStyle.fill;

    double startAngle = -pi / 2; // 从顶部开始绘制

    for (int i = 0; i < angles.length; i++) {
      final sweepAngle = angles[i] * pi / 180; // 将角度转换为弧度
      paint.color = colors[i % colors.length]; // 处理颜色循环

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle; // 更新起始角度
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
