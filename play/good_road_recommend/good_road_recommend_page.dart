import 'package:flutter/material.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/good_road_images_loader.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/pages/play/chip_area/chip_area_page.dart';
import 'package:flutter_main/pages/play/good_road_recommend/good_road_recommend_controller.dart';
import 'package:flutter_main/pages/play/good_road_recommend/good_road_recommend_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class GoodRoadRecommendPage extends GetView<GoodRoadRecommendController> {

  final socketController = WebsocketController.controller;

  static void show() async {
    SmartDialog.show(builder: (context) {
      return GoodRoadRecommendPage();
    }, alignment: Alignment.bottomCenter, keepSingle: true);
  }

  final bool isDark = GlobalController.controller.isDark;

  GoodRoadRecommendPage({super.key});

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      height: 46.h,
      child: Row(children: [
        SizedBox(width: 14.w,),
        CustomButton(
          onPressed: () {
            SmartDialog.dismiss();
          },
          child: Icon(Icons.close_sharp, size: 22, color: isDark ? const Color(0xFFDCDCDC) : const Color(0xFFA8B4C7)),),
        SizedBox(width: 10.w,),
        const SizedBox(width: 22,),
        const Spacer(),
        Text('好路推荐', style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 17, fontWeight: FontWeight.w500),),
        const Spacer(),
        CustomButton(onPressed: () {}, child: Image.asset(GoodRoadImagesLoader.goodRoadRefreshIconWith(isDark), width: 22, height: 22, fit: BoxFit.cover,),),
        SizedBox(width: 10.w,),
        CustomButton(onPressed: () {}, child: Image.asset(GoodRoadImagesLoader.goodRoadSettingIconWith(isDark), width: 22, height: 22, fit: BoxFit.cover,),),
        SizedBox(width: 14.w,),
      ],),
    );
  }


  Widget listWidget() {
    return Obx(() {
      final list = socketController.mGameTableMapObs.values.toList();
      int commissionStatus = socketController.mWs10000Model.value.data?.commissionStatus ?? 0;
      return ListView.builder(padding: EdgeInsets.symmetric(horizontal: 14.w).copyWith(top: 10.h), itemBuilder: (context, index) {
        final tableInfo = list[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: GoodRoadRecommendItemWidget(
            isDark: isDark,
            gameTableInfoModel: tableInfo,
            commissionStatus: commissionStatus,
          ),
        );
      }, itemCount: list.length, itemExtent: 112.h + 5.h,);
    });
  }

  Widget bottomWidget() {
    return Container(
      height: 86.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(GoodRoadImagesLoader.goodRoadBottomBarWith(isDark)),
          fit: BoxFit.fill
        )
      ),
      child: ChipAreaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight * 2 / 3,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF252B3D) : const Color(0xFFF4F8FC),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _header(),
          Expanded(child: listWidget()),
          bottomWidget()
        ],),
    );
  }

}