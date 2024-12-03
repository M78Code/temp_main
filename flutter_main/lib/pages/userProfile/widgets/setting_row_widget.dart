
import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingRowWidget extends StatelessWidget {

  const SettingRowWidget({
    super.key,
    this.iconAsset,
    this.iconSize = 22,
    required this.title,
    required this.isDark,
    this.isShowDivider = false,
    this.isShowRightArrow = true,
    this.value,
    this.borderRadius,
    this.onPress
  });

  final String? iconAsset;
  final double iconSize;
  final bool isDark;
  final String title;
  final bool isShowDivider;
  final bool isShowRightArrow;
  final String? value; // 右边的值显示
  final BorderRadius? borderRadius;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {

    Widget? valueWidget;
    if (value != null && value!.isNotEmpty) {
      valueWidget = Text(value!, style: TextStyle(color: AppColors.textColor02(isDark), fontSize: 14, fontWeight: FontWeight.w400),);
    }

    final titleStyle = TextStyle(color: AppColors.textColor01(isDark), fontSize: 14, fontWeight: FontWeight.w400);

    List<Widget> widgets = [
      Text(title, style: titleStyle),
      const Spacer(),
      if (valueWidget != null)
        ...[ valueWidget! ],
      if (isShowRightArrow)
        ...[
          SizedBox(width: 8.w,),
          Image.asset(AppImages.rightArrowWith(isDark: isDark)),
        ],
      SizedBox(width: 14.w,)
    ];
    return Container(
      height: 50.h,
      decoration: BoxDecoration(borderRadius: borderRadius),
      child: InkWell(onTap: onPress, borderRadius: borderRadius, child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 14.w,),
              if (iconAsset != null)
                ...[
                  Image.asset(iconAsset!, width: iconSize, height: iconSize, fit: BoxFit.cover,),
                  SizedBox(width: 10.w,),
                ],

              ...widgets
            ],
          )),
          if (isShowDivider)
            ...[Divider(height: 1.h, color: AppColors.dividerColor(isDark), indent: 14, endIndent: 14,)]
        ],
      ),),
    );
  }
}