import 'package:flutter/animation.dart';
import 'package:flutter_main/models/chip_model.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class FlyModel {
  MovieTween tween;
  MovieTween tweenClear;
  ChipModel? chipModel;
  double? endx;
  double? endy;
  double? positionedLeft;
  double? positionedBottom;
  int? betPointId;
  Control? animationControl;

  FlyModel({
    required this.tween,
    required this.tweenClear,
    this.chipModel,
    this.endx,
    this.endy,
    this.positionedBottom,
    this.positionedLeft,
    this.betPointId,
    this.animationControl,
  }) {}

  @override
  String toString() {
    return "endx=$endx  endy=$endy chipModel=$chipModel";
  }

// set endY(double endy) {
//   tween = MovieTween()
//     // ..scene(
//     //         begin: const Duration(milliseconds: 0),
//     //         end: const Duration(milliseconds: 1))
//     //     .tween("height", Tween(begin: 0.0, end: 50.0))
//     ..scene(
//             begin: const Duration(milliseconds: 1),
//             duration: const Duration(milliseconds: 500))
//         .tween(x, Tween(begin: 0.0, end: endy))
//     ..scene(
//             begin: const Duration(milliseconds: 1),
//             duration: const Duration(milliseconds: 500))
//         .tween(y, Tween(begin: 0.0, end: endy));
//   this.endy = endy;
// }
}
