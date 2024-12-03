import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/pages/base/base_page.dart';
import 'package:flutter_main/utils/widget_extension.dart';
import 'package:flutter_main/widgets/custom_rect_progress.dart';
import 'package:flutter_main/widgets/images.dart';
import 'package:flutter_main/widgets/slider_switch_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slide_switcher/slide_switcher.dart';

import '../../../r.dart';
import 'logic.dart';

class GameSettingPage extends BasePage {
  GameSettingPage({super.key});

  final logic = Get.put(GameSettingLogic());
  final state = Get.find<GameSettingLogic>().state;

  /// 游戏设置
  @override
  String get appBarTitle => 'user_game_set'.tr;

  @override
  bool get isGlobal => true;

  @override
  Widget createBody(BuildContext context) {
    return ListView(
      children: [
        topWidget(context),
        centerWidget().marginOnly(top: 14.w),
        bottomWidget().marginOnly(top: 14.w),
      ],
    ).marginAll(10);
  }

  ///语言设定，皮肤m模式
  Widget topWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
          color:
              !globalController.isDark ? Colors.white : AppColors.color_A6C3FF,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: state.isDisplay.value
            ? [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'gset_language'.tr),
                    commonRightText(
                        text: logic.state.languageString.value,
                        textSize: 14.sp),
                    Images(
                      path: !globalController.isDark
                          ? R.commonLightIcArrowDown
                          : R.commonLightIcArrowDown,
                      scale: 3,
                    ).marginOnly(left: 2.w),
                  ],
                ).inkWell(() => logic.showLanguageDialog()),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginOnly(bottom: 8.w, top: 12.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'gset_skin'.tr), //皮肤模式
                    skinSwitcher()
                  ],
                ),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginSymmetric(vertical: 8.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'mode_type_lz'.tr), // 路纸模式
                    luzhiSwitcher()
                  ],
                ),
              ]
            : [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'gset_language'.tr),
                    commonRightText(
                        text: logic.state.languageString.value,
                        textSize: 14.sp),
                    Images(
                      path: !globalController.isDark
                          ? R.commonLightIcArrowDown
                          : R.commonLightIcArrowDown,
                      scale: 3,
                    ).marginOnly(left: 2.w),
                  ],
                ).inkWell(() => logic.showLanguageDialog()),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginOnly(bottom: 6.w, top: 12.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'gset_skin'.tr), //皮肤模式
                    skinSwitcher()
                  ],
                ),
              ],
      ),
    );
  }

  Widget centerWidget() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
          color:
              !globalController.isDark ? Colors.white : AppColors.color_A6C3FF,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: state.soundSwitch.value
            ? [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'voice_switch'.tr),
                    SlideSwitchButton(
                        initialState: state.soundSwitch.value,
                        onToggle: (isSelect) => logic.switchAllVoice(isSelect))
                  ],
                ),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginSymmetric(vertical: 14.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'gset_yylanguage'.tr),
                    commonRightText(
                        text: state.voiceString.value, textSize: 14.sp),
                    Images(
                      path: !globalController.isDark
                          ? R.commonLightIcArrowDown
                          : R.commonLightIcArrowDown,
                      scale: 3,
                    ).marginOnly(left: 2.w),
                  ],
                ).inkWell(() => logic.showBottomDialog()),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginSymmetric(vertical: 14.w),
                Row(
                  children: [
                    commonLeftText(text: 'voice_game_speech'.tr, expend: false),
                    CustomRoundedRectSlider(
                        value: state.gameVoice.value,
                        min: 0,
                        max: 100,
                        onChanged: (progress) =>
                            logic.updateGameVoice(progress)).expanded()
                  ],
                ),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginSymmetric(vertical: 14.w),
                Row(
                  children: [
                    commonLeftText(text: 'voice_game_sound'.tr, expend: false),
                    CustomRoundedRectSlider(
                        value: state.gameYinX.value,
                        min: 0,
                        max: 100,
                        onChanged: (progress) =>
                            logic.updateGameYinX(progress)).expanded()
                  ],
                ),
                Divider(
                  color: AppColors.color_A6C3FF01,
                  height: 0.5,
                ).marginSymmetric(vertical: 14.w),
                Row(
                  children: [
                    commonLeftText(text: 'voice_live_sound'.tr, expend: false),
                    CustomRoundedRectSlider(
                        value: state.sceneVoice.value,
                        min: 0,
                        max: 100,
                        onChanged: (progress) =>
                            logic.updateSeneVoice(progress)).expanded()
                  ],
                ),
              ]
            : [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonLeftText(text: 'voice_switch'.tr),
                    SlideSwitchButton(
                        initialState: state.soundSwitch.value,
                        onToggle: (isSelect) => logic.switchAllVoice(isSelect))
                  ],
                ),
              ],
      ),
    );
  }

  ///语言设定，皮肤m模式
  Widget bottomWidget() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
          color:
              !globalController.isDark ? Colors.white : AppColors.color_A6C3FF,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonLeftText(text: 'gset_lvideo'.tr),
              SlideSwitchButton(
                  initialState: state.videoSwitch.value,
                  onToggle: (isSelect) => logic.updateSeneVideo(isSelect)),
            ],
          ),
          Divider(
            color: AppColors.color_A6C3FF01,
            height: 0.5,
          ).marginSymmetric(vertical: 14.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonLeftText(text: 'gset_changetable'.tr, expend: false),
                  commonRightText(
                      text: 'gset_changetable_tips'.tr, textSize: 10.sp)
                ],
              ).expanded(),
              SlideSwitchButton(
                  initialState: state.quickChangeTable.value,
                  onToggle: (isSelect) => logic.updateQChangeTable(isSelect))
            ],
          ),
          Divider(
            color: AppColors.color_A6C3FF01,
            height: 0.5,
          ).marginSymmetric(vertical: 14.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonLeftText(text: 'gset_bet'.tr, expend: false),
                  commonRightText(text: 'gset_bet_tips'.tr, textSize: 10.sp)
                ],
              ).expanded(),
              SlideSwitchButton(
                  initialState: state.quickBet.value,
                  onToggle: (isSelect) => logic.updateQuikBet(isSelect))
            ],
          ).marginOnly(bottom: 10.w),
        ],
      ),
    );
  }

  Widget commonLeftText({required String text, bool expend = true}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14.sp,
          color: !globalController.isDark
              ? AppColors.lightTextColor06
              : AppColors.darkTextColor01),
    ).expanded(flex: expend ? 1 : 0);
  }

  Widget commonRightText({required String text, double textSize = 14}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: textSize,
          color: !globalController.isDark
              ? AppColors.lightTextColor08
              : AppColors.darkTextColor08),
    );
  }

  Widget skinSwitcher() {
    return SlideSwitcher(
      initialIndex: state.skinSwitcherSelectIndex.value,
      onSelect: (int index) => logic.skinModelChange(index),
      containerColor: !globalController.isDark
          ? AppColors.color_E7EEF6
          : AppColors.color_1f2433,
      slidersGradients: const [
        LinearGradient(
          colors: [
            Color(0XFF748eb2),
            Color(0XFF5b708c),
          ],
        ),
      ],
      indents: 2.w,
      containerHeight: 30.w,
      containerWight: 130.w,
      children: [
        Text(
          'gset_skinQ'.tr,
          style: TextStyle(
              fontSize: 10.sp,
              color: state.skinSwitcherSelectIndex.value == 0
                  ? Colors.white
                  : !globalController.isDark
                      ? AppColors.lightTextColor05
                      : AppColors.darkTextColor08),
        ),
        Text(
          'gset_skinS'.tr,
          style: TextStyle(
              fontSize: 10.sp,
              color: state.skinSwitcherSelectIndex.value == 1
                  ? Colors.white
                  : (!globalController.isDark
                      ? AppColors.lightTextColor05
                      : AppColors.darkTextColor08)),
        ),
        Text(
          'gset_skinZ'.tr,
          style: TextStyle(
              fontSize: 10.sp,
              color: state.skinSwitcherSelectIndex.value == 2
                  ? Colors.white
                  : !globalController.isDark
                      ? AppColors.lightTextColor05
                      : AppColors.darkTextColor08),
        ),
      ],
    );
  }

  Widget luzhiSwitcher() {
    return SlideSwitcher(
      initialIndex: state.luzhiSwitcherSelectIndex.value,
      onSelect: (int index) {
        logic.updateLuZMode(index);
      },
      containerColor: !globalController.isDark
          ? AppColors.color_E7EEF6
          : AppColors.color_1f2433,
      slidersGradients: const [
        LinearGradient(
          colors: [
            Color(0XFF748eb2),
            Color(0XFF5b708c),
          ],
        ),
      ],
      indents: 2.w,
      containerHeight: 30.w,
      containerWight: 88.w,
      children: [
        Text(
          'gset_skinQ'.tr,
          style: TextStyle(
              fontSize: 10.sp,
              color: state.luzhiSwitcherSelectIndex.value == 0
                  ? Colors.white
                  : !globalController.isDark
                      ? AppColors.lightTextColor05
                      : AppColors.darkTextColor08),
        ),
        Text(
          'gset_skinS'.tr,
          style: TextStyle(
              fontSize: 10.sp,
              color: state.luzhiSwitcherSelectIndex.value == 1
                  ? Colors.white
                  : (!globalController.isDark
                      ? AppColors.lightTextColor05
                      : AppColors.darkTextColor08)),
        ),
      ],
    );
  }
}
