import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/cupertino.dart';

/// 给Text扩展样式字段
class ZsText extends Text {
  double left;
  double top;
  double right;
  double bottom;
  Color? color;
  Color? backgroundColor;
  double fontSize;
  String? fontFamily;
  double? lineHeight;
  FontWeight fontWeight;

  ZsText(String data,
      {Key? key,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0,
      this.color,
      this.fontSize = 14,
      this.backgroundColor,
      this.lineHeight,
      this.fontFamily,
      TextAlign? textAlign,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow = TextOverflow.ellipsis,
      int? maxLines,
      String? semanticsLabel,
      FontStyle? fontStyle,
      TextWidthBasis? textWidthBasis,
      TextDecoration? textDecoration,
      Color? decorationColor,
      ui.TextHeightBehavior? textHeightBehavior,
      this.fontWeight = FontWeight.normal})
      : super(data,
            key: key,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: maxLines == null ? null : overflow,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            style: TextStyle(
                backgroundColor: backgroundColor,
                decorationColor: decorationColor,
                decoration: textDecoration,
                color: color,
                fontStyle: fontStyle,
                fontFamily: fontFamily,
                fontSize: fontSize,
                height: lineHeight,
                fontWeight: fontWeight));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: super.build(context),
    );
  }
}

class BoardText extends Text {
  double left;
  double top;
  double right;
  double bottom;
  Color? color;
  double fontSize;
  FontWeight fontWeight;
  Color? backgroundColor;
  BorderRadius? borderRadius;
  Border? border;

  BoardText(String data,
      {Key? key,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0,
      this.color,
      this.fontSize = 14,
      this.backgroundColor,
      this.border,
      this.borderRadius,
      TextAlign? textAlign,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      ui.TextHeightBehavior? textHeightBehavior,
      this.fontWeight = FontWeight.normal})
      : super(data,
            key: key,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            style: TextStyle(
                color: color, fontSize: fontSize, fontWeight: fontWeight));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: borderRadius, border: border),
      child: super.build(context),
    );
  }
}
