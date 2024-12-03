import 'package:flutter/material.dart';

class HexColor extends Color {
  // 获取十六进制颜色值
  static int _getColorFromHex(String hexColor, double opacity) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      // 如果颜色没有透明度信息，默认加上 FF 表示不透明
      hexColor = "FF" + hexColor;
    }

    // 处理透明度
    int alpha = (opacity * 255).toInt(); // 将透明度转换为 0-255 范围
    String alphaHex =
        alpha.toRadixString(16).padLeft(2, '0').toUpperCase(); // 转换为 2 位十六进制值

    // 返回 ARGB 颜色值
    return int.parse(alphaHex + hexColor.substring(2), radix: 16);
  }

  static Color ColorHex(String hex, {double opcity = 1.0}) {
    hex = hex.toUpperCase().replaceAll("#", "");

    if (hex.length == 6) {
      String op = ((opcity * 255.0).toInt()).toRadixString(16);
      hex = op + hex;
    }
    return Color(int.parse(hex, radix: 16));
  }

  // 构造函数，增加透明度参数  opacity 不透明度： 1.0为不透明   0为完全透明
  HexColor(final String hexColor, {double opacity = 1.0})
      : super(_getColorFromHex(hexColor, opacity));
}
