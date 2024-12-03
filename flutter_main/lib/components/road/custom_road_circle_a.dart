import 'package:flutter/material.dart';
import 'dart:math';

class CustomCircleC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Circle C Logo')),
      body: Center(
        child: Container(
          width: 100,  // 容器宽度
          height: 100, // 容器高度
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 自定义绘制弧形
              CustomPaint(
                size: Size(100, 100),
                painter: ArcPainter(),
              ),
              // 左上角的小红色圆点
              Positioned(
                top: 10,
                left: 25,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // 右下角的小蓝色圆点
              Positioned(
                bottom: 10,
                right: 25,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // 中间的绿色倾斜矩形
              Transform.rotate(
                angle: pi / 4, // 45度角
                child: Container(
                  width: 80,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
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

// 使用 CustomPainter 绘制红色的弧形
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint arcPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    double radius = size.width / 2;

    // 绘制顶部的弧线
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 4, // 起始角度
      pi / 2, // 扫过的角度 (1/2 圆)
      false,
      arcPaint,
    );

    // 绘制底部的弧线
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      3 * pi / 4, // 起始角度
      pi / 2, // 扫过的角度 (1/2 圆)
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomCircleD(),
  ));
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






class CustomCircleD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Circle C Logo')),
      body: Center(
        child: Container(
          width: 100,  // 容器宽度
          height: 100, // 容器高度
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 自定义绘制红色圆环
              CustomPaint(
                size: Size(100, 100),
                painter: CirclePainter(),
              ),
              // 第一个绿色的长条
              Positioned(
                top: 25,
                child: Container(
                  width: 60,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              // 第二个绿色的长条
              Positioned(
                bottom: 25,
                child: Container(
                  width: 60,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
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

// 使用 CustomPainter 绘制红色的圆环
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    double radius = size.width / 2;

    // 绘制红色的圆环
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius - 6, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}









class CustomCirclD extends StatelessWidget {
  final double size; // 图标大小
  final Color redCircleColor; // 红色半圆的颜色
  final Color greenBarColor; // 绿色长条的颜色
  final Color redDotColor; // 红色圆点颜色
  final Color blueDotColor; // 蓝色圆点颜色

  CustomCirclD({
    this.size = 100, // 默认大小为100
    this.redCircleColor = Colors.red,
    this.greenBarColor = Colors.green,
    this.redDotColor = Colors.red,
    this.blueDotColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,  // 容器宽度
      height: size, // 容器高度
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 自定义绘制红色半圆
          CustomPaint(
            size: Size(size, size),
            painter: HalfCirclePainter(redCircleColor: redCircleColor),
          ),
          // 左上角的小红色圆点
          Positioned(
            top: size * 0.15,
            left: size * 0.1,
            child: Container(
              width: size * 0.2,
              height: size * 0.2,
              decoration: BoxDecoration(
                color: redDotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // 右下角的小蓝色圆点
          Positioned(
            bottom: size * 0.15,
            right: size * 0.1,
            child: Container(
              width: size * 0.2,
              height: size * 0.2,
              decoration: BoxDecoration(
                color: blueDotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // 中间第一个绿色倾斜矩形
          Transform.rotate(
            angle: pi / 9, // 20度角
            child: Container(
              width: size * 0.6,
              height: size * 0.12,
              decoration: BoxDecoration(
                color: greenBarColor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          // 中间第二个绿色倾斜矩形
          Transform.rotate(
            angle: pi / 9, // 20度角
            child: Container(
              width: size * 0.6,
              height: size * 0.12,
              decoration: BoxDecoration(
                color: greenBarColor,
                borderRadius: BorderRadius.circular(6),
              ),
              margin: EdgeInsets.only(top: size * 0.25),
            ),
          ),
        ],
      ),
    );
  }
}

// 使用 CustomPainter 绘制红色的两个半圆
class HalfCirclePainter extends CustomPainter {
  final Color redCircleColor;

  HalfCirclePainter({required this.redCircleColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint arcPaint = Paint()
      ..color = redCircleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08; // 动态设置弧线的宽度

    double radius = size.width / 2;

    // 绘制顶部的半圆
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 4, // 起始角度
      pi / 2, // 扫过的角度 (半圆)
      false,
      arcPaint,
    );

    // 绘制底部的半圆
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
      3 * pi / 4, // 起始角度
      pi / 2, // 扫过的角度 (半圆)
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}







class CustomCircleE extends StatelessWidget {
  final double size; // 图标大小

  CustomCircleE({
    this.size = 100, // 默认大小为100
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,  // 容器宽度
      height: size, // 容器高度
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 自定义绘制红色半圆和左侧灰色竖线
          CustomPaint(
            size: Size(size, size),
            painter: HalfCircleWithLinePainter(),
          ),
          // 中间的绿色斜条
          Transform.rotate(
            angle: pi / 4, // 45度角
            child: Container(
              width: size * 0.6,
              height: size * 0.12,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          // 绿色数字 "3" 圆形
          Positioned(
            top: size * 0.32,
            left: size * 0.22,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size * 0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 使用 CustomPainter 绘制红色的圆弧和左侧灰色竖线
class HalfCircleWithLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint arcPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1; // 动态设置弧线的宽度

    Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = size.width * 0.02; // 动态设置竖线的宽度

    double radius = size.width / 2;

    // 绘制红色的圆弧
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius - size.width * 0.05),
      -pi / 4, // 起始角度
      1.5 * pi, // 扫过的角度
      false,
      arcPaint,
    );

    // 绘制左侧的灰色竖线
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.1),
      Offset(size.width * 0.15, size.height * 0.9),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

