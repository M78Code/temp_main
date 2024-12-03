import 'package:flutter/material.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/configs/app_svgs.dart';
import 'package:flutter_main/pages/base/base_page.dart';
import 'package:flutter_main/pages/userProfile/bettingRecords/betting_records_controller.dart';
import 'package:flutter_main/pages/userProfile/widgets/betting_records_list_item_widget.dart';
import 'package:flutter_main/pages/userProfile/widgets/date_range_selector_dialog.dart';
import 'package:flutter_main/pages/userProfile/widgets/dropdown_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class BettingRecordsPage extends BasePage {
  BettingRecordsPage({super.key});

  final bettingRecordsController = Get.put(BettingRecordsController());

  @override
  String get appBarTitle => "投注记录";

  final GlobalKey _global01Key = GlobalKey();

  _onTapDateSelector(BuildContext context) {
    showDropdownMenu(context, tapKey: _global01Key);
  }

  Widget topSelector(BuildContext context) {
    statusColor(bool isDark, bool isSelected) {
      Color color;
      if (isDark) {
        color = isSelected ? Colors.white : const Color(0xFFDCDCDC);
      } else {
        color = isSelected ? Colors.white : const Color(0xFF7288AA);
      }
      return color;
      // return Image.asset(AppResource.arrowBottom, color: imgColor,);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
      child: Row(children: [
        CustomButton.capsuleButton(
          key: _global01Key,
          isDark: globalController.isDark,
          width: 120,
          height: 32,
          isSelected: false,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '今日',
                style: TextStyle(
                  color: statusColor(globalController.isDark, false),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 4.w,),
              SvgPicture.asset(
                AppSvgs.arrowBottom,
                width: 12,
                height: 12,
                colorFilter: ColorFilter.mode(statusColor(globalController.isDark, false), BlendMode.srcIn),),
            ],
          ),
          onPressed: () {
            _onTapDateSelector(context);
          },
        ),
        SizedBox(width: 14.w,),
        CustomButton.capsuleButton(
          isDark: globalController.isDark,
          width: 120,
          height: 32,
            isSelected: false,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '全部游戏',
                  style: TextStyle(
                      color: statusColor(globalController.isDark, false),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 4.w,),
                SvgPicture.asset(
                  AppSvgs.arrowBottom,
                  width: 12,
                  height: 12,
                  colorFilter: ColorFilter.mode(statusColor(globalController.isDark, false), BlendMode.srcIn),),
              ],
            ),
          onPressed: () {
            DateRangeSelectorDialog.show();
          },
        )
    ],),);
  }

  Widget bottomCheckBoxWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      child: GestureDetector(onTap: () {}, child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset(AppImages.checkboxNormalWith(isDark: globalController.isDark)),
        SizedBox(width: 4.w,),
        Text(
          '投注记录按照局、玩法合并展示',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textColor02(globalController.isDark)),)
      ],),),
    );
  }

  Widget listHeaderWidget(BuildContext context) {
    bool isDark = globalController.isDark;
    textLabel(String label, {TextAlign align = TextAlign.center}) {
      return Text(label, textAlign: align, style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 14, fontWeight: FontWeight.w400),);
    }
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.contentBackgroundColor(isDark),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        border: Border(bottom: BorderSide(width: 1.0, color: AppColors.dividerColor(isDark)))
      ),
      padding: EdgeInsets.only(top: 8.h, left: 14.w, right: 14.w),
      child: Row(children: [
        Expanded(flex: 2, child: textLabel('时间', align: TextAlign.start)),
        Expanded(flex: 2, child: textLabel('玩法')),
        Expanded(child: textLabel('结果')),
        Expanded(flex: 2, child: textLabel('投注金额')),
        Expanded(child: textLabel('派彩')),
        SizedBox(width: 4.w,),
        const SizedBox(width: 12,) // 固定占位
      ],),
    );
  }

  @override
  Widget createBody(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          topSelector(context),
          const SizedBox(height: 8,),
          listHeaderWidget(context),
          Expanded(child: GetBuilder<BettingRecordsController>(builder: (controller) {
            return ListView.builder(itemBuilder: (context, index) {
              return BettingRecordsListItemWidget(
                isDark: globalController.isDark,
                isExpand: controller.listItemExpandWith(index: index),
                onTapRow: () {
                  controller.toggleListItemExpandWith(index: index);
                },
              );
            }, itemCount: 10,);
          })),
          bottomCheckBoxWidget(context)
        ],
      ),
    );
  }
}