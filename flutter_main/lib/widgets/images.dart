// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../r.dart';



class Images extends StatelessWidget {
  final String path;
  double? width;
  double? scale;
  double? height;
  Color? color;
  BoxFit? fit;
  String? errorName;
  String? placeholder;
  Images(
      {super.key,
        required this.path,
        this.width,
        this.height,
        this.scale,
        this.color,
        this.errorName,
        this.placeholder,
        this.fit});

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('http') || path.startsWith('https') ) {
      return CachedNetworkImage(
        imageUrl: path,
        color: color,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Image.asset(
          placeholder ?? R.roadRoadpapericon107,
          scale: scale ?? 3,
          width: width,
          height: height,
          fit: fit,
          color: color,
        ),
        errorWidget: (context, url, error) => Image.asset(
          errorName ?? R.roadRoadpapericon107,
          scale: scale ?? 3,
          width: width,
          height: height,
          fit: fit,
          color: color,
        ),
      );
    } else if (path.isNotEmpty) {
      return Image.asset(
        path,
        width: width,
        height: height,
        color: color,
        scale: scale,
        fit: fit,
      );
    } else {
      return Image.asset(
        errorName ?? (placeholder ?? R.roadRoadpapericon107),
        width: width,
        height: height,
        color: color,
        scale: scale,
        fit: fit,
      );
    }
  }
}
