import 'dart:ui' as ui
    show
        ParagraphStyle,
        TextStyle,
        StrutStyle,
        lerpDouble,
        Shadow,
        FontFeature,
        TextHeightBehavior,
        TextLeadingDistribution;

import 'package:flutter/material.dart';

///目的：为组件增加扩展功能
/// 所有扩展应以Zs开头
/// 方法名称以zs开头
/// 需要能体现扩展功能的方法名称
///
///
///为所有继承自widget的组件扩展添加外层的Container
///           Text('hello word').zsContainer(color: Colors.red)
///
extension ZsWidget on Widget {
  Container intoContainer({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}

extension HyWillPopScope on Widget {
  WillPopScope intoWillPopScope(
      {Key? key, required WillPopCallback onWillPop}) {
    return WillPopScope(key: key, child: this, onWillPop: onWillPop);
  }
}

///扩展点击事件
extension ZsInkWell on Widget {
  InkWell intoInkeWell({
    Key? key,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureTapDownCallback? onTapDown,
    GestureTapCancelCallback? onTapCancel,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
    MouseCursor? mouseCursor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    bool? enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    ValueChanged<bool>? onFocusChange,
    bool autofocus = false,
  }) {
    return InkWell(
      key: key,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      mouseCursor: mouseCursor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback ?? true,
      excludeFromSemantics: excludeFromSemantics,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      child: this,
    );
  }
}

///单击
extension ZsGestureDetector on Widget {
  GestureDetector intoGestureDetector({
    Key? key,
    HitTestBehavior behavior = HitTestBehavior.translucent,
    GestureDragDownCallback? onPanDown,
    @required GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureTapCallback? onLongTap,
  }) {
    return GestureDetector(
      behavior: behavior,
      onTap: onTap,
      onPanDown: onPanDown,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongTap,
      child: this,
    );
  }
}

///为Text组件扩展添加TextStyle
///           Text('hello word').zsStyle(color: Colors.red)
extension ZsStyle on Text {
  Text zsText({
    bool inherit = true,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    ui.TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
  }) {
    return Text(
      this.data!,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        inherit: inherit,
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize != null ? fontSize : 14,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        leadingDistribution: leadingDistribution,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        package: package,
      ),
    );
  }
}

///为Container扩展expanded
extension ZsExpanded on Container {
  Expanded intoExpanded({
    Key? key,
    int flex = 1,
  }) {
    return Expanded(key: key, flex: flex, child: this);
  }
}

extension ZsFlexible on Widget {
  Flexible intoFlexible({
    Key? key,
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) {
    return Flexible(
      key: key,
      flex: flex,
      fit: fit,
      child: this,
    );
  }
}

///为数组扩展添加Cloumn
extension ZsColumn on List<Widget> {
  Column intoColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: this,
    );
  }
}

///为数组扩展添加Row
extension ZsRow on List<Widget> {
  Row intoRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: this,
    );
  }
}

extension ZsSizedBox on Widget {
  SizedBox intoSizedBox({Key? key, double? width, double? height}) {
    return SizedBox(
      key: key,
      width: width,
      height: height,
      child: this,
    );
  }
}

///添加圆角扩展
extension ZsClipRRect on Widget {
  ClipRRect intoClipRRect({
    Key? key,
    BorderRadius borderRadius = BorderRadius.zero,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return ClipRRect(
      key: key,
      clipper: clipper,
      clipBehavior: clipBehavior,
      borderRadius: borderRadius,
      child: this,
    );
  }
}

extension ZsPositioned on Widget {
  Positioned intoPositioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      key: key,
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      width: width,
      height: height,
      child: this,
    );
  }
}

extension ZsCenter on Widget {
  Center intoCenter({Key? key, double? widthFactor, double? heightFactor}) {
    return Center(
      key: key,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }
}

extension ZsVisibility on Widget {
  Visibility intoVisibility({Key? key, bool visible = true}) {
    return Visibility(
      key: key,
      visible: visible,
      child: this,
    );
  }
}
