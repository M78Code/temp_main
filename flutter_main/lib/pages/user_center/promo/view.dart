import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/configs/app_style.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/utils/app_util.dart';
import 'package:flutter_main/utils/widget_extension.dart';
import 'package:flutter_main/widgets/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../configs/app_colors.dart';
import '../../../widgets/easy_refresher.dart';
import '../../base/base_page.dart';
import 'logic.dart';

class PromoPage extends BasePage {
  PromoPage({super.key});

  final logic = Get.put(PromoLogic());
  final state = Get.find<PromoLogic>().state;

  @override
  // TODO: implement title
  // 优惠活动
  String get appBarTitle => 'user_activity'.tr;

  @override
  Widget createBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [topSelector(), listview().expanded()],
    );
  }

  Widget topSelector() {
    statusColor(bool isDark, bool isSelected) {
      Color color;
      if (isDark) {
        color = isSelected ? Colors.white : const Color(0xFFDCDCDC);
      } else {
        color = isSelected ? Colors.white : const Color(0xFF7288AA);
      }
      return color;
    }

    return Obx(() {
      final isSelect = state.selectId.value == 3 ? true : false;
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        child: Row(
          children: [
            // 当前活动
            CustomButton.capsuleButton1(
              isDark: globalController.isDark,
              width: 170.w,
              height: 32.w,
              isSelected: !isSelect,
              child: Center(
                child: Text(
                  'activity_current'.tr,
                  style: TextStyle(
                      color: statusColor(globalController.isDark, !isSelect),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              onPressed: () {
                logic.tabSelect(1);
              },
            ),
            SizedBox(
              width: 7.w,
            ),
            // 历史活动
            CustomButton.capsuleButton1(
              isDark: globalController.isDark,
              width: 170.w,
              height: 32.w,
              isSelected: isSelect,
              child: Center(
                  child: Text(
                'activity_his'.tr,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: statusColor(globalController.isDark, isSelect),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              )),
              onPressed: () {
                logic.tabSelect(3);
              },
            )
          ],
        ),
      );
    });
  }

  Widget listview() {
    return EasyRefresher(
      textColor: AppColors.pageBackgroundColor(!globalController.isDark),
      easyRefreshController: logic.eController,
      onRefresh: () async {
        logic.refreshData();
      },
      onLoad: () async {
        logic.loadMoreData();
      },
      childBuilder: (context, physics) {
        return Obx(() {
          return ListView.builder(
              physics: physics,
              itemCount: state.list.length,
              itemBuilder: (_, index) {
                final activity = state.list[index];
                return itemView(activity).inkWell(
                    () => logic.listItemClick(activity.activityUrl ?? ''));
              });
        });
      },
    );
  }
  //   return LiquidPullToRefresh(
  //       onRefresh: () async {
  //         logic.refreshData();
  //       },
  //       showChildOpacityTransition: false,
  //       child: ListView.builder(
  //           itemBuilder: (_, index) {
  //             final activity = state.list[index];
  //             return itemView(activity).inkWell(
  //                 () => logic.listItemClick(activity.activityUrl ?? ''));
  //           },
  //           itemCount: state.list.length));
  // }

  Widget itemView(activity) {
    final isHot = state.selectId.value == 3 ? false : true;
    final isDark = globalController.isDark;
    final startTime = AppUtil.dateForStamp(activity.activityStartTime ?? 0);
    final endTime = AppUtil.dateForStamp(activity.activityEndTime ?? 0);

    return Container(
      height: 130.w,
      margin: PageStyle.mkMargin(left: 12, right: 12, top: 10),
      decoration: BoxDecoration(
        borderRadius: PageStyle.mkRadiusBottom(16),
        color: Colors.black.withAlpha(5),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: PageStyle.mkRadiusAll(16),
              child: Images(
                path: activity.getActivityBannerUrl,
                fit: BoxFit.fill,
                placeholder: AppImages.activityLoad(isDark: isDark),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              isHot ? R.userProfileActivityHot : R.userProfileActivityWq,
              width: 42.w,
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                height: 24.w,
                padding: PageStyle.mkPaddingL(10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: PageStyle.mkRadiusBottom(16),
                  color: Colors.black87,
                ),
                child: Text(
                  '${activity.getTitle} ${'activity_tips'.trParams({
                        'start': startTime,
                        'end': endTime
                      })}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                ),
              ))
        ],
      ),
    );
  }
}
