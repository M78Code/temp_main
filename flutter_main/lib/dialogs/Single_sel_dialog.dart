import 'package:flutter/cupertino.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/dialogs/Single_sel_dialog_controller.dart';
import 'package:flutter_main/utils/widget_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../configs/app_colors.dart';

// 底部通用单选弹框
class SingleSelectDialog extends GetView<SingleSelController> {
  static void show(List<String> contents, ValueChanged<int> okTap,
      {String? title, int? defaultIdex}) async {
    SmartDialog.show(
        builder: (context) {
          return SingleSelectDialog(
            defaultIdex: defaultIdex,
            title: title,
            contents: contents,
            okTap: okTap,
          );
        },
        alignment: Alignment.bottomCenter,
        keepSingle: true);
  }

  final bool isDark = GlobalController.controller.isDark;

  final String? title;
  final int? defaultIdex;
  final ValueChanged<int> okTap;
  List<String> contents;

  SingleSelectDialog({
    super.key,
    this.title = '',
    this.defaultIdex = 0,
    required this.okTap,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SingleSelController());
    controller.updateSelIndex(defaultIdex ?? 0);

    return Container(
      padding: EdgeInsets.all(14.w),
      width: Get.width,
      decoration: BoxDecoration(
          color: !isDark ? AppColors.color_F4F9FF : AppColors.color_262D40,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: contentPicker(),
    );
  }

  Widget contentPicker() {
    List<String> dateList = contents;
    Color selectedColor = const Color(0xFF337AF8);
    // isDark ? const Color(0xFF337AF8) : const Color(0xFF1C386C);
    Color normalColor = AppColors.textColor02(isDark);
    List<Widget> children = List<Widget>.generate(dateList.length, (index) {
      return Center(
        child: Text(
          dateList[index],
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: index == defaultIdex ? selectedColor : normalColor),
        ),
      );
    });
    return SizedBox(
        height: 290.w,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 30.w,
                  child: Text(
                    'cancel'.tr,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: !isDark
                            ? AppColors.color_7F8FA6
                            : AppColors.darkTextColor08),
                  ),
                ).inkWell(() => SmartDialog.dismiss()),
                Center(
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: !isDark
                            ? AppColors.color_253D61
                            : AppColors.darkTextColor07),
                  ),
                ).expanded(),
                SizedBox(
                    height: 30.w,
                    child: Text(
                      'ok'.tr,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: !isDark
                              ? AppColors.lightTextColor06
                              : AppColors.color_337AF8),
                    )).inkWell(() => controller.okClick(okTap)),
              ],
            ),
            Expanded(
                child: CupertinoPicker(
                    itemExtent: 44.w,
                    onSelectedItemChanged: (value) {
                      controller.updateSelIndex(value);
                    },
                    children: children))
          ],
        ));
  }
}
