import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../roullette_100_dialog_controller.dart';

class RCirclePainter extends CustomPainter {
  // 分成多少份
  static const numberOfDivisions = 37;
  // 每份角度
  final double _sliceAngle = 360.0 / numberOfDivisions;
  // 两个圈的直径差
  final double diameterC = 40.w;

  // 颜色部分
  final Paint _paint = Paint();

  // 线部分
  final Paint _paintLine = Paint();
  // 边框分割线
  final Paint _paintFG = Paint()
    ..color = const Color(0xFF7288AA)
    ..strokeWidth = 0.5.w;

  // 内、外圆
  final Paint _painNY = Paint()
    ..color = const Color(0xFF7288AA).withOpacity(0.5)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5.w;

  // 文本内容
  final TextPainter _textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    // textAlign: TextAlign.center,
  );

  // 数字背景 20.w
  // 浅：whit 深 32394D
  final Paint _painTxtBg = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20.w; // diameterC 的一半

  final bool isDark;
  final List<RoulletteText> textList;

  RCirclePainter(
    this.isDark,
    this.textList,
  );

  @override
  void paint(Canvas canvas, Size size) {
    setBaseInfo();

    // 中心点
    Offset center = Offset(size.width / 2, size.height / 2);
    // 半径
    double radius = min(size.width / 2, size.height / 2);
    // 内圈半径
    double nRadius = radius - diameterC / 2.0;

    //单个角度
    const double sangle = 2 * pi / numberOfDivisions;

    // 数字背景
    canvas.drawCircle(center, nRadius + _painTxtBg.strokeWidth / 2, _painTxtBg);

    for (int i = 0; i < numberOfDivisions; i++) {
      // 线条
      final double angle = sangle * i;
      final double startX = center.dx + radius * cos(angle);
      final double startY = center.dy + radius * sin(angle);
      // final double endX = center.dx + radius * cos(angle);
      // final double endY = center.dy + radius * sin(angle);
      final double endX = center.dx; //+ (radius - 5.0) * cos(angle);
      final double endY = center.dy; //+ (radius - 5.0) * sin(angle);
      final start = Offset(startX, startY);
      final end = Offset(endX, endY);
      _paintLine.shader = ui.Gradient.linear(
        start,
        end,
        [
          const Color(0xFF7288AA),
          const Color(0xFF7288AA).withOpacity(0),
        ],
      );
      canvas.drawLine(start, end, _paintLine);

      final textM = textList[i];
      // 颜色部分
      // 绿：0xFF0BB865
      // 黑：0xFF616674
      // 红：0xFFFF3E3E
      // 根据具体值来
      final isRed = textM.isRed ?? true;
      Color pColor = isRed ? const Color(0xFFFF3E3E) : const Color(0xFF616674);
      if (textM.text == '0') {
        pColor = const Color(0xFF0BB865);
      }
      _paint.color = pColor;

      double startAngle = i * _sliceAngle * pi / 180;
      double endAngle = (i + 1) * _sliceAngle * pi / 180;

      // 填充颜色
      final suiji10 = textM.proportion ?? 0;
      double jinduzabi = nRadius * suiji10;
      canvas.drawArc(Rect.fromCircle(center: center, radius: jinduzabi),
          startAngle, endAngle - startAngle, true, _paint);

      // 外边框分割线
      final double endXFG = center.dx + nRadius * cos(angle);
      final double endYFG = center.dy + nRadius * sin(angle);
      final endFG = Offset(endXFG, endYFG);
      canvas.drawLine(start, endFG, _paintFG);

      // 文本内容
      final textv = textM.text ?? '';
      // 黑-深：0xFFDCDCDC
      // 黑-浅：0xFF30425C
      // 绿：0xFF0BB865
      // 红：0xFFFF3E3E
      Color txtColor =
          isRed ? const Color(0xFFFF3E3E) : const Color(0xFF616674);
      if (textv == '0') {
        txtColor = const Color(0xFF0BB865);
      } else {
        txtColor = isRed
            ? const Color(0xFFFF3E3E)
            : isDark
                ? const Color(0xFFDCDCDC)
                : const Color(0xFF30425C);
      }

      _textPainter.text = TextSpan(
        text: textv,
        style: TextStyle(
            color: txtColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            height: 11.w),
      );
      _textPainter.layout();
      final radiust = radius * 0.5 + 12.5.w; // 文本间距
      final anglet = sangle * i + sangle * 0.5; // 每个数字的角度
      final dxt = center.dx + radiust * cos(anglet); // 计算x坐标
      final dyt = center.dy + radiust * sin(anglet); // 计算y坐标
      // 保存当前画布状态
      canvas.save();
      // 将画布移到数字的绘制位置
      canvas.translate(dxt, dyt);
      // 旋转画布，使文字底部朝向圆心
      canvas.rotate(anglet + pi / 2);
      // 绘制数字
      _textPainter.paint(
          canvas, Offset(-_textPainter.width / 2, -_textPainter.height));
      // 恢复画布到之前的状态
      canvas.restore();
    }
    // 内圆
    canvas.drawCircle(center, nRadius, _painNY);
    // 外圆
    canvas.drawCircle(center, radius, _painNY);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  /// 根据参数 配置基础信息
  setBaseInfo() {
    // 浅：whit 深 32394D
    _painTxtBg.color = isDark ? const Color(0XFF32394D) : Colors.white;
  }
}

// class CirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = min(size.width, size.height) * 0.5;
//     final textStyle = TextStyle(color: Colors.black, fontSize: 16);

//     // 绘制20个数字
//     final numbers = List.generate(20, (index) => index + 1);

//     for (int i = 0; i < numbers.length; i++) {
//       final angle = (2 * pi / numbers.length) * i; // 每个数字的角度
//       final dx = center.dx + radius * cos(angle); // 计算x坐标
//       final dy = center.dy + radius * sin(angle); // 计算y坐标

//       // 保存当前画布状态
//       canvas.save();

//       // 将画布移到数字的绘制位置
//       canvas.translate(dx, dy);

//       // 旋转画布，使文字底部朝向圆心
//       canvas.rotate(angle + pi / 2);

//       // 绘制数字
//       TextPainter textPainter = TextPainter(
//         text: TextSpan(text: '${numbers[i]}', style: textStyle),
//         textDirection: TextDirection.ltr,
//       );
//       textPainter.layout();
//       textPainter.paint(
//           canvas, Offset(-textPainter.width / 2, -textPainter.height));

//       // 恢复画布到之前的状态
//       canvas.restore();
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
