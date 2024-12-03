// 色系
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageStyle {
  // 渐变色(从左到右)
  static LinearGradient mkLinearLeftRight([left, right]) {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        left ?? const Color(0xffFF9ACD),
        right ?? const Color(0xffFF64A1),
      ],
    );
  }

  // 渐变色(从上到下)
  static LinearGradient mkLinearUpDown([up, down]) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        up ?? const Color(0xffFC6882),
        down ?? const Color(0xffF84A4B),
      ],
    );
  }

  // 上下内边距
  static mkPaddingTB(double size) => EdgeInsets.only(
        top: size.w,
        bottom: size.w,
      );
  // 左右内边距
  static mkPaddingLR(double size) => EdgeInsets.only(
        left: size.w,
        right: size.w,
      );
  static mkPaddingL(double size) => EdgeInsets.only(
        left: size.w,
      );
  static mkPaddingR(double size) => EdgeInsets.only(
        right: size.w,
      );
  // all内边距
  static mkPaddingAll(double size) => EdgeInsets.all(size.w);

  static mkMargin(
          {double left = 0,
          double right = 0,
          double top = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
        left: left.w,
        right: right.w,
        top: top.w,
        bottom: bottom.w,
      );

  // 上下外边距
  static mkMarginTB(double size) =>
      EdgeInsets.only(top: size.w, bottom: size.w);
  // 左右外边距
  static mkMarginLR(double size) =>
      EdgeInsets.only(left: size.w, right: size.w);
  // all外边距
  static mkMarginAll(double size) => EdgeInsets.all(size.w);

  // 横竖边距
  static mkSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);

  // 边框
  static Border borderColorAll({
    Color color = const Color(0xFF000000),
    double width = 0.5,
  }) =>
      Border.all(
        color: color,
        width: width,
      );

  // 单边框
  static Border borderColorStyle({
    Color color = const Color(0xFF000000),
    double size = 0.5,
    direction = "bottom",
  }) =>
      Border(
        top: direction == "top"
            ? BorderSide(
                width: size.w,
                color: color,
              )
            : const BorderSide(width: 0, color: Colors.transparent),
        right: direction == "right"
            ? BorderSide(
                width: size.w,
                color: color,
              )
            : const BorderSide(width: 0, color: Colors.transparent),
        bottom: direction == "bottom"
            ? BorderSide(
                width: size.w,
                color: color,
              )
            : const BorderSide(width: 0, color: Colors.transparent),
        left: direction == "left"
            ? BorderSide(
                width: size.w,
                color: color,
              )
            : const BorderSide(width: 0, color: Colors.transparent),
      );

  // 单圆角
  static BorderRadius mkRadius({double size = 0, direction = "topLeft"}) =>
      BorderRadius.only(
        topLeft: direction == 'topLeft'
            ? Radius.circular(size)
            : const Radius.circular(0),
        topRight: direction == 'topRight'
            ? Radius.circular(size.w)
            : const Radius.circular(0),
        bottomLeft: direction == 'bottomLeft'
            ? Radius.circular(size.w)
            : const Radius.circular(0),
        bottomRight: direction == 'bottomRight'
            ? Radius.circular(size.w)
            : const Radius.circular(0),
      );

  // 上左 上右 圆角 角度必传
  static BorderRadius mkRadiusTop(double size) => BorderRadius.only(
        topLeft: Radius.circular(size.w),
        topRight: Radius.circular(size.w),
      );
  // 下左 下右 圆角 角度必传
  static BorderRadius mkRadiusBottom(double size) => BorderRadius.only(
        bottomLeft: Radius.circular(size.w),
        bottomRight: Radius.circular(size.w),
      );
  // 上左 下左 圆角 角度必传
  static BorderRadius mkRadiusLeft(double size) => BorderRadius.only(
        topLeft: Radius.circular(size.w),
        bottomLeft: Radius.circular(size.w),
      );
  // 上右 下右 圆角 角度必传
  static BorderRadius mkRadiusRight(double size) => BorderRadius.only(
        topRight: Radius.circular(size.w),
        bottomRight: Radius.circular(size.w),
      );
  // 所有圆角 角度必传
  static BorderRadius mkRadiusAll(double size) => BorderRadius.circular(size.w);

  static mkRoxShadow() {
    return [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        offset: Offset(0.0, 2), //阴影xy轴偏移量
        blurRadius: 2.0, //阴影模糊程度
        spreadRadius: 0.5, //阴影扩散程度
      )
    ];
  }
}
