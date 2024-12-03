import 'package:flutter/material.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/configs/app_svgs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BettingRecordsListItemWidget extends StatelessWidget {

  const BettingRecordsListItemWidget({ super.key, required this.isDark, this.isExpand = false, this.onTapRow });

  final bool isExpand;
  final bool isDark;
  final VoidCallback? onTapRow;

  Widget normalRowWidget(BuildContext context) {
    textLabel(String label, {TextAlign align = TextAlign.center}) {
      return Text(label, textAlign: align, style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 14, fontWeight: FontWeight.w400),);
    }
    final content = Container(
      width: double.infinity,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColors.contentBackgroundColor(isDark),
        border: Border(bottom: BorderSide(
          width: 1.0,
          color: AppColors.dividerColor(isDark)
        ))
      ),
      child: Row(children: [
        Expanded(flex: 2, child: textLabel("2024-03-14\n16:13:59", align: TextAlign.start)),
        Expanded(flex: 2, child: textLabel("幸运六")),
        Expanded(child: textLabel("幸运六")),
        Expanded(flex: 2, child: textLabel("1.0")),
        Expanded(child: textLabel("-1.0")),
        SizedBox(width: 4.w,),
        SvgPicture.asset(
          AppSvgs.arrowBottom,
          width: 12,
          height: 12,
          colorFilter: ColorFilter.mode(isDark ? const Color(0xFFDCDCDC) : const Color(0xFFA8B4C7), BlendMode.srcIn),),
      ],),
    );
    return GestureDetector(onTap: onTapRow,child: content,);
  }

  Widget videoButtonWidget(BuildContext context) {

    return CustomButton(onPressed: () {}, decoration: BoxDecoration(
        color: isDark ? const Color(0xFF748CB0) : const Color(0xFF748EB2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: isDark ? const Color(0xFFA6C3FF).withOpacity(0.15) : Colors.white),
        boxShadow: [
          BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.1) : const Color(0xFF7EAAE5).withOpacity(0.15),
              offset: const Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0
          )
        ]
    ), child:  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(children: [
        Image.asset(AppImages.video, width: 13, height: 13, fit: BoxFit.cover,),
        SizedBox(height: 3.h,),
        const Text('视频录像', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),)
      ],),
    ),);
  }

  Widget expandWidget(BuildContext context) {
    text01(String text) {
      return Text(
        text, 
        style: TextStyle(
            fontSize: 11, 
            fontWeight: FontWeight.w400, 
            color: isDark ? const Color(0xFFDCDCDC).withOpacity(0.6) : const Color(0xFF7288AA)),);
    }
    
    return Container(
      width: double.infinity,
      color: AppColors.pageBackgroundColor(isDark),
      child: Column(children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 14.w,),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 11.h,),
              Row(children: [
                text01("局号: DP123456789A"),
                SizedBox(width: 5.w,),
                CustomButton(onPressed: () {}, child: const Icon(Icons.copy, size: 12),)
              ],),
              text01("局数: 20"),
              text01("赔率: 2"),
              SizedBox(height: 11.h,)
            ],),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 11.h,),
              text01("有效投注: 20.00"),
              text01("状态: 已派彩"),
            ],),
            const Spacer(),
            Padding(padding: EdgeInsets.only(top: 11.h), child: videoButtonWidget(context),), SizedBox(width: 14.w,),
          ],),
        Divider(color: AppColors.dividerColor(isDark), indent: 14.w, endIndent: 14.w,),
        Container(
          width: double.infinity,
          height: 68.h,
        )
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isExpand) {
      return normalRowWidget(context);
    }
    return Column(children: [
      normalRowWidget(context),
      expandWidget(context)
    ],);
  }
}