import 'package:flutter/material.dart';
import 'dart:math';


class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 圆心
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    // 定义每个扇区的角度
    final List<double> angles = [120, 120, 120]; // 三个部分，每部分120度

    // 定义颜色
    final List<Color> colors = [Colors.red, Colors.green, Colors.blue];

    // 画笔
    Paint paint = Paint()
      ..style = PaintingStyle.fill;

    double startAngle = -pi / 2; // 从顶部开始绘制

    for (int i = 0; i < angles.length; i++) {
      final sweepAngle = angles[i] * pi / 180; // 将角度转换为弧度
      paint.color = colors[i];

      // 绘制每个扇形
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

class ConcentricCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 获取圆心
    Offset center = Offset(size.width / 2, size.height / 2);

    // 内部橙色实心圆的半径
    double innerRadius = size.width * 0.25;

    // 外部蓝色圆圈的半径
    double outerRadius = size.width * 0.5;

    // 外部蓝色圆圈的线宽
    double ringThickness = size.width * 0.1;

    // 1. 绘制内部橙色的圆
    Paint innerCirclePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, innerRadius, innerCirclePaint);

    // 2. 绘制外部蓝色的环形
    Paint outerCirclePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringThickness;

    canvas.drawCircle(center, outerRadius, outerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




class CircleWithOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 获取圆心
    Offset center = Offset(size.width / 2, size.height / 2);

    // 外环的半径
    double outerRadius = size.width * 0.4;

    // 外环的线宽
    double ringThickness = size.width * 0.1;

    // 1. 绘制外环
    Paint outerCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringThickness;

    canvas.drawCircle(center, outerRadius, outerCirclePaint);

    // 2. 绘制小圆圈 (左上角)
    double smallCircleRadius = size.width * 0.15; // 小圆的半径
    Offset smallCircleCenter = Offset(
      center.dx - outerRadius * cos(pi / 4), // 向左上角偏移
      center.dy - outerRadius * sin(pi / 4),
    );

    Paint smallCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // 绘制小圆的红色填充
    canvas.drawCircle(smallCircleCenter, smallCircleRadius, smallCirclePaint);

    // 绘制小圆的白色边框
    Paint smallCircleBorderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.03; // 边框宽度

    canvas.drawCircle(smallCircleCenter, smallCircleRadius, smallCircleBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




class DisabledSymbolPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. 绘制蓝色的圆圈
    double circleRadius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1; // 设置圆圈的线宽

    canvas.drawCircle(center, circleRadius, circlePaint);

    // 2. 绘制绿色的斜线 (从右上到左下)
    Paint linePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.15; // 斜线的宽度

    // 计算斜线的起点（右上角）和终点（左下角）
    Offset start = Offset(size.width * 0.8, size.height * 0.2); // 右上角偏移
    Offset end = Offset(size.width * 0.2, size.height * 0.8); // 左下角偏移

    canvas.drawLine(start, end, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}






class CircleArcLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Logo')),
      body: Center(
        child: Container(
          width: 100, // 容器宽度
          height: 100, // 容器高度
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 半圆的 CustomPainter
              CustomPaint(
                size: Size(100, 100),
                painter: ArcPainter(),
              ),
              // 左上角红色的小圆点
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // 右下角蓝色的小圆点
              Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 使用 CustomPainter 绘制两个半圆
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Paint bluePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    double radius = size.width / 2;

    // 画左半圆
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      pi / 4, // 起始角度
      pi, // 扫过的角度 (半圆)
      false,
      redPaint,
    );

    // 画右半圆
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 4, // 起始角度
      pi, // 扫过的角度 (半圆)
      false,
      bluePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}





class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Logo')),
      body: Center(
        child: Container(
          width: 100,  // 调整大小
          height: 100, // 调整大小
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 自定义绘制圆弧和垂直线
              CustomPaint(
                size: Size(100, 100),
                painter: ArcLinePainter(),
              ),
              // 左上角的小红色圆点
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // 绿色的倾斜矩形
              Positioned(
                child: Transform.rotate(
                  angle: pi / 4, // 45 度角
                  child: Container(
                    width: 60,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 使用 CustomPainter 绘制红色弧线和垂直线
class ArcLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint redArcPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Paint verticalLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    double radius = size.width / 2.5;

    // 绘制红色圆弧
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 4, // 起始角度
      2 * pi / 3, // 扫过的角度
      false,
      redArcPaint,
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


