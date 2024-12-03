import 'package:flutter/material.dart';

class ThemeImage extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const ThemeImage(
      this.name, {
        Key? key,
        this.width,
        this.height,
        this.color,
        this.fit,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(name,
        width: width, height: height, color: color, fit: fit);
  }
}