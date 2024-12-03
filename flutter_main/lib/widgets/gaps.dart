import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gaps {
  static const Widget w2 = SizedBox(
    width: 2,
  );
  static const Widget w3 = SizedBox(
    width: 3,
  );
  static const Widget w4 = SizedBox(
    width: 4,
  );
  static const Widget w5 = SizedBox(
    width: 5,
  );
  static const Widget w7 = SizedBox(
    width: 7,
  );
  static const Widget w8 = SizedBox(
    width: 8,
  );
  static const Widget w10 = SizedBox(
    width: 10,
  );
  static const Widget w12 = SizedBox(
    width: 12,
  );
  static const Widget w15 = SizedBox(
    width: 15,
  );
  static const Widget w16 = SizedBox(
    width: 16,
  );
  static const Widget w17 = SizedBox(
    width: 17,
  );
  static const Widget w20 = SizedBox(
    width: 20,
  );
  static const Widget w22 = SizedBox(
    width: 22,
  );
  static const Widget w25 = SizedBox(
    width: 25,
  );
  static const Widget w30 = SizedBox(
    width: 30,
  );
  static const Widget w35 = SizedBox(
    width: 35,
  );
  static const Widget w40 = SizedBox(
    width: 40,
  );
  static const Widget w60 = SizedBox(
    width: 60,
  );
  static const Widget h2 = SizedBox(
    height: 2,
  );
  static const Widget h4 = SizedBox(
    height: 4,
  );
  static const Widget h5 = SizedBox(
    height: 5,
  );
  static const Widget h6 = SizedBox(
    height: 6,
  );
  static const Widget h7 = SizedBox(
    height: 7,
  );
  static const Widget h8 = SizedBox(
    height: 8,
  );
  static const Widget h9 = SizedBox(
    height: 9,
  );
  static const Widget h10 = SizedBox(
    height: 10,
  );
  static const Widget h11 = SizedBox(
    height: 11,
  );
  static const Widget h12 = SizedBox(
    height: 12,
  );
  static const Widget h13 = SizedBox(
    height: 13,
  );
  static const Widget h15 = SizedBox(
    height: 15,
  );
  static const Widget h18 = SizedBox(
    height: 18,
  );
  static const Widget h19 = SizedBox(
    height: 19,
  );
  static const Widget h20 = SizedBox(
    height: 20,
  );
  static const Widget h25 = SizedBox(
    height: 25,
  );
  static const Widget h27 = SizedBox(
    height: 27,
  );
  static const Widget h28 = SizedBox(
    height: 28,
  );
  static const Widget h30 = SizedBox(
    height: 30,
  );
  static const Widget h40 = SizedBox(
    height: 40,
  );
  static const Widget h50 = SizedBox(
    height: 50,
  );

  static Widget gw(double width) {
    return SizedBox(
      width: ScreenUtil().setWidth(width),
    );
  }

  static Widget gh(double height) {
    return SizedBox(
      height: ScreenUtil().setWidth(height),
    );
  }

  static double w(double width) {
    return ScreenUtil().setWidth(width);
  }

  static double d(double width) {
    return ScreenUtil().setWidth(width);
  }
}
