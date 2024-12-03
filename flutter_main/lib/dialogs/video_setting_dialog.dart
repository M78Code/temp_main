import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/api/api_service.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/pages/base/base_card_widget.dart';
import 'package:flutter_main/pages/play/play_router.dart';
import 'package:flutter_main/utils/loading.dart';
import 'package:flutter_main/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// 视频设置对话框
class VideoSettingDialog extends StatefulWidget {
  static void show() async {
    SmartDialog.show(
        builder: (context) {
          return const VideoSettingDialog();
        },
        alignment: Alignment.bottomCenter,
        keepSingle: true);
  }

  const VideoSettingDialog({super.key});

  @override
  State<VideoSettingDialog> createState() => VideoSettingDialogState();
}

class VideoSettingDialogState extends State<VideoSettingDialog> {
  final bool isDark = GlobalController.controller.isDark;

  int segmentIndex = 0;

  /// 视频验真数字
  String checkVideoNumber = "";

  onCheckVideo() async {
    if (checkVideoNumber.length < 4) {
      ToastUtil.showToast('请输入4位数字');
      return;
    }
    Loading.show();
    int currentTableId = PlayRouter.mCurrentTableId;
    Loading.show("请稍后...");
    try {
      await ApiService.digitalVerification(
          tableId: currentTableId, digitalVerificationNum: checkVideoNumber);
      Loading.success("视频验真成功");
      SmartDialog.dismiss();
    } catch (error) {
      Loading.error(error.toString());
    }
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      height: 46.h,
      child: Row(
        children: [
          SizedBox(
            width: 14.w,
          ),
          CustomButton(
            onPressed: () {
              SmartDialog.dismiss();
            },
            child: Icon(Icons.close_sharp,
                size: 22,
                color:
                    isDark ? const Color(0xFFDCDCDC) : const Color(0xFFA8B4C7)),
          ),
          const Spacer(),
          Text(
            '视频设置',
            style: TextStyle(
                color: AppColors.textColor01(isDark),
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const SizedBox(
            width: 22,
            height: 22,
          ),
          SizedBox(
            width: 14.w,
          ),
        ],
      ),
    );
  }

  Widget _segmentWidget() {
    final image =
        AssetImage(AppImages.capsuleBgImageNormalWith(isDark: isDark));
    textStyle(bool isSelected) {
      final color = isSelected
          ? Colors.white
          : (isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA));
      return TextStyle(fontSize: 14, color: color);
    }

    return CustomSlidingSegmentedControl(
      initialValue: segmentIndex,
      padding: 20,
      children: {
        0: Text(
          '视频线路',
          style: textStyle(segmentIndex == 0),
        ),
        1: Text('视频验真', style: textStyle(segmentIndex == 1)),
      },
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(
                AppImages.reactBg01With(isDark: isDark),
              ),
              fit: BoxFit.fill)),
      thumbDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xFF96B7E5), Color(0xFF7394C0)],
              begin: Alignment.topCenter,
              end: Alignment.center,
              tileMode: TileMode.clamp)),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: (v) {
        setState(() {
          segmentIndex = v;
        });
      },
    );
  }

  Widget _videoList() {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size(double.infinity, 160.h)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...[1, 2, 3].map((e) {
              final textStyle = TextStyle(
                  fontSize: 14,
                  color: isDark
                      ? const Color(0xFFDCDCDC)
                      : const Color(0xFF7288AA));
              return BaseCardWidget(
                isDark: isDark,
                borderRadius: BorderRadius.circular(20.r),
                margin: EdgeInsets.only(bottom: 5.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 14.w,
                      ),
                      Image.asset(
                        AppImages.signal03,
                        width: 9,
                        height: 9,
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Text(
                        '高清',
                        style: textStyle,
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        '640P',
                        style: textStyle,
                      ),
                      const Spacer(),
                      Image.asset(AppImages.checkboxNormalWith(isDark: isDark)),
                      SizedBox(
                        width: 14.w,
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  /// 视频线路
  Widget _videoRouteWidget() {
    settingRow(
        {required String label,
        required List<Widget> rightChild,
        required bool isShowDivider}) {
      return SizedBox(
        width: double.infinity,
        height: 45.h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      color: AppColors.textColor01(isDark),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 14.w,
                ),
                ...rightChild,
              ],
            )),
            if (isShowDivider) ...[
              Divider(
                height: 1.h,
                color: AppColors.dividerColor(isDark),
              )
            ]
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          settingRow(
              label: "声音开关",
              rightChild: [
                const Spacer(),
                CupertinoSwitch(
                    value: false,
                    activeColor: const Color(0xFF748EB2),
                    trackColor:
                        isDark ? Colors.black38 : const Color(0xFFD8E1EC),
                    onChanged: (value) {})
              ],
              isShowDivider: true),
          SizedBox(
            height: 8.h,
          ),
          Text(
            '视频线路',
            style: TextStyle(
                color: AppColors.textColor01(isDark),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8.h,
          ),
          _videoList()
        ],
      ),
    );
  }

  Widget _keyboardButton(String content,
      {ValueChanged<String>? onTapNumber,
      VoidCallback? onTapDelete,
      VoidCallback? onTapDone}) {
    final image = (onTapNumber != null || onTapDelete != null)
        ? AssetImage(AppImages.keyboardNormalBgWith(isDark: isDark))
        : AssetImage(AppImages.keyboardDoneBgWith(isDark: isDark));
    final textColor = (onTapNumber != null || onTapDelete != null)
        ? (isDark ? const Color(0xFF7288AA) : const Color(0xFFDCDCDC))
        : Colors.white;
    return CustomButton(
      onPressed: () {
        onTapNumber?.call(content);
        onTapDelete?.call();
        onTapDone?.call();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.fill)),
        child: Text(
          content,
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      ),
    );
  }

  Widget _videoCheckWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          BaseCardWidget(
            isDark: isDark,
            child: SizedBox(
              width: double.infinity,
              height: 44.h,
              child: Center(
                child: Text(
                  checkVideoNumber.isEmpty ? '请输入4位数字' : checkVideoNumber,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: isDark
                          ? const Color(0xFF73787E)
                          : const Color(0xFFA8B4C7)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 36.h * 4 + 14 * 3,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 2.8),
                padding: EdgeInsets.zero,
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return _keyboardButton('删除', onTapDelete: () {
                      if (checkVideoNumber.isEmpty) return;
                      setState(() {
                        checkVideoNumber = checkVideoNumber.substring(
                            0, checkVideoNumber.length - 1);
                      });
                    });
                  } else if (index == 11) {
                    return _keyboardButton('确定', onTapDone: () {
                      onCheckVideo();
                    });
                  }
                  var ditStr = (index + 1).toString();
                  if (index == 10) ditStr = "0";
                  return _keyboardButton(ditStr, onTapNumber: (dit) {
                    if (checkVideoNumber.length == 4) return;
                    setState(() {
                      checkVideoNumber = checkVideoNumber + dit;
                    });
                  });
                }),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.pageBackgroundColor(isDark),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(),
          SizedBox(
            height: 8.h,
          ),
          _segmentWidget(),
          segmentIndex == 0 ? _videoRouteWidget() : _videoCheckWidget(),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
