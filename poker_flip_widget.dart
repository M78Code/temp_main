import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokerFlipWidget extends StatefulWidget {
  final String frontImagePath; // 扑克牌正面图片路径
  final String backImagePath; // 扑克牌背面图片路径
  final double width; // 卡片宽度
  final double height; // 卡片高度
  final Duration duration; // 翻转动画时长
  bool isFlip; // 是否翻牌

  PokerFlipWidget(
    this.isFlip, {
    super.key,
    required this.frontImagePath,
    this.backImagePath = R.playingCardsPokerBg,
    double? width,
    double? height,
    this.duration = const Duration(seconds: 1),
  })  : width = width ?? ScreenUtil().setWidth(44),
        height = height ?? ScreenUtil().setHeight(60);

  @override
  State<PokerFlipWidget> createState() => _PokerFlipWidgetState();
}

class _PokerFlipWidgetState extends State<PokerFlipWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    // 初始化时，根据 `isFlip` 状态设置动画的初始方向
    if (widget.isFlip) {
      _animationController.value = 1.0; // 初始化为正面
    }
    // _animation.removeListener((){
    //   print("")
    // });
    // print("翻牌");
  }

  @override
  void didUpdateWidget(covariant PokerFlipWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // 根据父组件状态决定动画播放方向
    if (widget.isFlip &&
        _animationController.status != AnimationStatus.completed) {
      _animationController.forward();
    } else if (!widget.isFlip &&
        _animationController.status != AnimationStatus.dismissed) {
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _PokerFlipWidget(
      animation: _animation,
      frontImagePath: widget.frontImagePath,
      backImagePath: widget.backImagePath,
      width: widget.width,
      height: widget.height,
    );
  }
}

class _PokerFlipWidget extends AnimatedWidget {
  final String frontImagePath; //扑克牌正面path
  final String backImagePath; //扑克牌背面path
  final double width; //卡片width
  final double height; //卡片height

  const _PokerFlipWidget({
    required Animation<double> animation, //动画控制
    required this.frontImagePath,
    required this.backImagePath,
    required this.width,
    required this.height,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final angle = animation.value * pi; //动态计算旋转角度
    final isBackSide = animation.value <= 0.5; //控制显示哪一面
    // print("----翻牌----$angle");
    return Stack(
      alignment: Alignment.center,
      children: [
        //背面显示动画
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // 添加透视效果
            ..rotateY(angle), //旋转Y轴
          alignment: Alignment.center,
          child: isBackSide
              ? _buildPokerImage(backImagePath)
              : const SizedBox.shrink(),
        ),
        // 正面显示动画
        Opacity(
          opacity: (animation.value - 0.5).clamp(0, 1) * 2, // 透明度从 0 到 1
          child: _buildPokerImage(frontImagePath),
        ),
      ],
    );
  }

  Widget _buildPokerImage(String path) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
