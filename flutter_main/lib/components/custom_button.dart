import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_images.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final Widget? child;

  const CustomButton(
      {super.key,
      required this.onPressed,
      this.decoration,
      this.width,
      this.height,
      this.child});

  /// 个人中心卡片按钮（额度记录、投注记录）
  factory CustomButton.themeButton01With(
      {required bool isDark,
      Widget? child,
      double radius = 12.0,
      VoidCallback? onPressed}) {
    return CustomButton(
      onPressed: onPressed,
      decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF39425E).withOpacity(0.5)
              : const Color(0xFFFFFFFF).withOpacity(0.6),
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
              color: isDark
                  ? const Color(0xFFA6C3FF).withOpacity(0.15)
                  : Colors.white),
          boxShadow: [
            BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.1)
                    : const Color(0xFF7EAAE5).withOpacity(0.15),
                offset: const Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ]),
      child: child,
    );
  }

  /// 自定义背景胶囊按钮
  factory CustomButton.capsuleButton(
      {required bool isDark,
      Key? key,
      Widget? child,
      bool isSelected = false,
      double? width,
      double? height,
      VoidCallback? onPressed}) {
    final image = isSelected
        ? AssetImage(AppImages.capsuleBgImageSelectedWith(isDark: isDark))
        : AssetImage(AppImages.capsuleBgImageNormalWith(isDark: isDark));
    return CustomButton(
      key: key,
      onPressed: onPressed,
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
            centerSlice: const Rect.fromLTWH(30, 20, 20, 20)),
      ),
      child: child,
    );
  }

  /// 自定义背景胶囊按钮 长一点的图
  factory CustomButton.capsuleButton1(
      {required bool isDark,
      Key? key,
      Widget? child,
      bool isSelected = false,
      double? width,
      double? height,
      VoidCallback? onPressed}) {
    final image = isSelected
        ? AssetImage(AppImages.capsuleBgImageSelectedWith1(isDark: isDark))
        : AssetImage(AppImages.capsuleBgImageNormalWith1(isDark: isDark));
    return CustomButton(
      key: key,
      onPressed: onPressed,
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: decoration,
        width: width,
        height: height,
        child: InkWell(
          onTap: onPressed,
          child: child,
        ),
      ),
    );
  }
}
