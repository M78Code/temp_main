import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Widget 扩展
extension WidgetExtension on Widget {
  Widget gestureDetector(Function() onTap) => GestureDetector(
    onTap: onTap,
    child: this,
  );
  Widget inkWell(Function() onTap) => InkWell(
    onTap: onTap,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    child: this,
  );
  Widget sizedBox({double? width, double? height}) => SizedBox(
    width: width,
    height: height,
    child: this,
  );
  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) =>
      SafeArea(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        minimum: minimum,
        maintainBottomViewPadding: maintainBottomViewPadding,
        child: this,
      );
  Widget expanded({int flex = 1}) => Expanded(
    flex: flex,
    child: this,
  );
}


class Tools {
  /// 横屏
  static landscape() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  /// 竖屏
  static portraitScreen() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
}
