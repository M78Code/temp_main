import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BaseCardWidget extends StatelessWidget {
  const BaseCardWidget({
    super.key,
    this.margin,
    required this.isDark,
    this.borderRadius,
    this.child
  });

  final bool isDark;

  final Widget? child;

  final BorderRadiusGeometry? borderRadius;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    Widget current = DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.contentBackgroundColor(isDark),
        borderRadius: borderRadius ?? BorderRadius.circular(12.r),
        border: Border.all(color: isDark ? const Color(0xFFA6C3FF).withOpacity(0.15) : Colors.white),
        boxShadow: [
          BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.1) : const Color(0xFF7EAAE5).withOpacity(0.15),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0
          )
        ]
      ),
      child: child,
    );
    if (margin != null) {
      current = Padding(padding: margin!, child: current,);
    }
    return current;
  }
}