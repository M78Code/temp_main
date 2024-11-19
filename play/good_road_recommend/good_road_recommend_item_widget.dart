import 'package:flutter/material.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/good_road_images_loader.dart';
import 'package:flutter_main/models/common/game_table_info_model.dart';
import 'package:flutter_main/pages/play/chip_area/chip_area_controller.dart';
import 'package:flutter_main/pages/play/good_road_recommend/good_road_recommend_controller.dart';
import 'package:flutter_main/pages/play/good_road_recommend/types.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/RoadPaper/Data/RoadPaperEnum.dart';
import '../widgets/play_road_sliding_horizontal_route_page.dart';

class GoodRoadRecommendItemWidget extends StatelessWidget {

  final bool isDark;
  final GameTableInfoModel gameTableInfoModel;
  ///  免佣状态   0=非免佣  1=免佣
  final int commissionStatus;

  const GoodRoadRecommendItemWidget({
    super.key,
    required this.isDark,
    required this.gameTableInfoModel,
    required this.commissionStatus
  });

  Widget topWidget() {
    final maxGoodRoad = gameTableInfoModel.goodRoadPoints?.firstOrNull;
    final playerTableBetLimit = gameTableInfoModel.playerTableBetLimit;
    return SizedBox(width: double.infinity, height: 25.h, child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(gameTableInfoModel.tableName ?? "", style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 12.sp),),
      SizedBox(width: 6.w,),
      Image.asset(GoodRoadImagesLoader.goodRoadItemLockWith(isDark), width: 12, height: 12, fit: BoxFit.cover,),
      Expanded(child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (maxGoodRoad != null && maxGoodRoad.goodRoadType != null)
            ...GoodRoadImagesLoader.goodRoadTagWith(maxGoodRoad.goodRoadType!, num: maxGoodRoad.num ?? 0).map((e) => Image.asset(e, height: 9, fit: BoxFit.cover,)).toList()

        ],
      )),
      if (playerTableBetLimit != null)
        ...[
          Text('${playerTableBetLimit!.min}～${playerTableBetLimit!.max}', style: TextStyle(color: AppColors.textColor02(isDark), fontSize: 12.sp),),
        ],
      SizedBox(width: 20.w,),
      Text(gameStatus[gameTableInfoModel.gameStatus ?? 0] ?? '', style: TextStyle(color: AppColors.textColor02(isDark), fontSize: 12.sp),),
    ],),);
  }

  // 投注区
  Widget rightBettingWidget() {
    final isEnableBetting = gameTableInfoModel.gameStatus! == 2;
    final controller = Get.find<GoodRoadRecommendController>();
    return SizedBox(
      width: 136.w,
      height: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(child: _BettingOp(
          type: OddsType.xian,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), topRight: Radius.circular(4.r)),
          isEnableBetting: isEnableBetting,
          doneBetting: () {
            controller.bettingWith(gameTableInfoModel: gameTableInfoModel, oddsType: OddsType.xian);
          },
        )),
        SizedBox(height: 1.h,),
        Expanded(child: _BettingOp(
          type: OddsType.he,
          isEnableBetting: isEnableBetting,
          doneBetting: () {
            controller.bettingWith(gameTableInfoModel: gameTableInfoModel, oddsType: OddsType.he);
          },
        )),
        SizedBox(height: 1.h,),
        Expanded(child: _BettingOp(
          type: commissionStatus == 1 ? OddsType.zhuang01 : OddsType.zhuang02,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
          isEnableBetting: isEnableBetting,
          doneBetting: () {
            controller.bettingWith(gameTableInfoModel: gameTableInfoModel, oddsType: OddsType.zhuang01);
          },
        )),
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w).copyWith(bottom: 4.h),
      decoration: BoxDecoration(
        color: AppColors.contentBackgroundColor(isDark),
        borderRadius: BorderRadius.circular(6.r)
      ),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        topWidget(),
        Expanded(child: Row(children: [
          // PlayRoadSlidingHorizontalRoutePage(width: ,),
          Container(
            width: 196.w,
            height: 88.h,
            child: Center(
              child: PlayRoadSlidingHorizontalRoutePage(
                width:196.w,
                height: 88.h,
                // childData: controller.getSectorRoadData(RoadPaperType_Baccarat.MAIN_ROAD),
                // roadPaperType: RoadPaperType_Baccarat.MAIN_ROAD,
              ),
            ),
          ),
          rightBettingWidget()
        ],))
      ],),
    );
  }
}

class _BettingOp extends StatefulWidget {
  const _BettingOp({
    super.key,
    this.borderRadius,
    required this.type,
    required this.isEnableBetting,
    this.doneBetting
  });

  final BorderRadiusGeometry? borderRadius;

  final OddsType type;

  /// 是否能够下注
  final bool isEnableBetting;

  /// 下注
  final VoidCallback? doneBetting;

  @override
  State<StatefulWidget> createState() => _BettingOpState();
}

class _BettingOpState extends State<_BettingOp> {

  /// 是否下注
  bool isBetting = false;

  final controller = Get.find<GoodRoadRecommendController>();
  final chipAreaController = Get.find<ChipAreaController>();

  /// 下注操作按钮
  Widget bettingActionWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: widget.borderRadius
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GestureDetector(onTap: () {
          setState(() {
            isBetting = false;
          });
        }, child: Image.asset(
          GoodRoadImagesLoader.bettingCancel, width: 24, height: 24, fit: BoxFit.cover,),),
        GetBuilder<ChipAreaController>(init: chipAreaController, builder: (_) {
          final icon = chipAreaController.selectedChipModel?.icon;
          if (icon == null) {
            return const SizedBox();
          }
          return Image.asset(icon ?? "", width: 24, height: 24, fit: BoxFit.cover,);
        }),
        GestureDetector(onTap: () {
          setState(() {
            isBetting = false;
          });
          widget.doneBetting?.call();
        }, child: Image.asset(
          GoodRoadImagesLoader.bettingDone, width: 24, height: 24, fit: BoxFit.cover,),)
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      CustomButton(
        onPressed: () {
          if (!widget.isEnableBetting) return;
          setState(() {
            isBetting = true;
          });
        },
        decoration: BoxDecoration(
          color: const Color(0xFF148B55),
          borderRadius: widget.borderRadius),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(widget.type.bettingImgUrl, width: 16, height: 16, fit: BoxFit.cover,),
          )),
          SizedBox(width: 8.w,),
          Expanded(child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(widget.type.oddsImgUrl, height: 15, fit: BoxFit.cover,),
          ))
        ],),
      ),
      if (isBetting)
        ...[bettingActionWidget()]
    ],);
  }
}