import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/configs/app_svgs.dart';
import 'package:flutter_main/pages/base/base_card_widget.dart';
import 'package:flutter_main/pages/base/base_page.dart';
import 'package:flutter_main/pages/userProfile/user_profile_controller.dart';
import 'package:flutter_main/pages/userProfile/user_profile_router.dart';
import 'package:flutter_main/pages/userProfile/widgets/setting_row_widget.dart';
import 'package:flutter_main/pages/user_center/game_setting/router.dart';
import 'package:flutter_main/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../../models/ws/ws_401_model.dart';
import '../play/roulette/roulette_record/roullette_100_dialog.dart';

class UserProfilePage extends BasePage {
  UserProfilePage({super.key});

  @override
  String get appBarTitle => "个人中心";

  @override
  bool get isGlobal => true;

  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  Widget userInfoWidget(BuildContext context) {
    bool isDark = globalController.isDark;

    final account = userProfileController.account;
    final balance = userProfileController.balanceString;
    final nickname = userProfileController.nickname;

    /// 用户头像widget
    Widget userHeaderWidget;
    if (userProfileController.category == 0 ||
        userProfileController.headPic.isEmpty) {
      userHeaderWidget = CircleAvatar(
        radius: 28,
        backgroundColor: Colors.transparent,
        backgroundImage:
            AssetImage(AppImages.defaultHeaderWith(isDark: isDark)),
        child: userProfileController.category == 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF2E3034)
                          : const Color(0xFF7F8695),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: const Text(
                    '试玩',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              )
            : null,
      );
    } else {
      userHeaderWidget = CircleAvatar(
        radius: 28,
        child: CachedNetworkImage(imageUrl: userProfileController.headPic),
      );
    }

    return BaseCardWidget(
      margin: EdgeInsets.symmetric(vertical: 14.h),
      isDark: isDark,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  userHeaderWidget,
                  SizedBox(
                    width: 14.w,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            nickname,
                            style: TextStyle(
                                color: AppColors.textColor01(isDark),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                              AppSvgs.editIcon,
                              width: 16.w,
                              height: 16.w,
                              colorFilter: ColorFilter.mode(
                                  isDark
                                      ? const Color(0xFF7682A2)
                                      : const Color(0xFF7288AA),
                                  BlendMode.srcIn),
                            ),
                            onTap: () {
                              userProfileController.modifyNickname();
                              // SettingNicknameDialog.show();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '账号: $account',
                            style: TextStyle(
                                color: AppColors.textColor02(isDark),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: account));
                              ToastUtil.showToast("已复制到粘贴板");
                            },
                            child: Text(
                              '复制',
                              style: TextStyle(
                                  color: AppColors.textColor02(isDark),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor(isDark)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  Image.asset(AppImages.balanceImageWith(isDark: isDark)),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    '余额',
                    style: TextStyle(
                        color: AppColors.textColor01(isDark),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    '¥ ${userProfileController.isBalanceVisible.value ? balance : "******"}',
                    style: TextStyle(
                        color: AppColors.textColor01(isDark),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  CustomButton(
                    onPressed: () {
                      userProfileController.toggleBalanceVisible();
                    },
                    child: Image.asset(AppImages.eyeImageWith(isDark: isDark)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget recordWidgets(BuildContext context) {
    final isDark = globalController.isDark;
    return Row(
      children: [
        Expanded(
            child: CustomButton.themeButton01With(
          isDark: isDark,
          onPressed: () {
            Get.toNamed(UserProfileRouter.BettingRecords);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Image.asset(AppImages.bettingRecordsWith(isDark: isDark)),
              ),
              Text(
                "投注记录",
                style: TextStyle(
                    color: AppColors.textColor01(isDark),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        )),
        const SizedBox(
          width: 14,
        ),
        Expanded(
            child: CustomButton.themeButton01With(
                isDark: isDark,
                onPressed: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                          AppImages.quotaRecordWith(isDark: isDark)),
                    ),
                    Text(
                      "额度记录",
                      style: TextStyle(
                          color: AppColors.textColor01(isDark),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )))
      ],
    );
  }

  Widget settingWidget(BuildContext context) {
    final isDark = globalController.isDark;
    return BaseCardWidget(
      isDark: isDark,
      margin: EdgeInsets.only(top: 14.h),
      child: Column(
        children: [
          SettingRowWidget(
            title: "游戏设置",
            iconAsset: AppImages.gameSettingWith(isDark: isDark),
            isShowDivider: true,
            isDark: isDark,
            onPress: () {
              Get.toNamed(GameSettingRouter.gameSetting);
            },
          ),
          SettingRowWidget(
            title: 'user_activity'.tr,
            iconAsset: AppImages.discountActivityWith(isDark: isDark),
            isShowDivider: true,
            isDark: isDark,
            onPress: () {
              userProfileController.toPormoPage();
            },
          ),
          SettingRowWidget(
            title: "新手进阶",
            iconAsset: AppImages.noviceAdvancedWith(isDark: isDark),
            isDark: isDark,
            onPress: () {
              final Map<String, dynamic> string = {
                "tableId": 212867,
                "zeroNum": 3,
                "dozen1": 34,
                "dozen2": 38,
                "dozen3": 25,
                "column1": 41,
                "column2": 22,
                "column3": 34,
                "small": 45,
                "even": 44,
                "red": 57,
                "black": 40,
                "odd": 53,
                "big": 52,
                "thirdCylinder": 19,
                "orphans": 18,
                "neighborsOfZero": 46,
                "zero": 17,
                "resultList": [
                  "0:3",
                  "1:4",
                  "2:4",
                  "3:7",
                  "4:4",
                  "5:3",
                  "6:1",
                  "7:2",
                  "8:1",
                  "9:3",
                  "10:1",
                  "11:1",
                  "12:3",
                  "13:3",
                  "14:2",
                  "15:2",
                  "16:2",
                  "17:0",
                  "18:2",
                  "19:9",
                  "20:4",
                  "21:5",
                  "22:4",
                  "23:1",
                  "24:4",
                  "25:3",
                  "26:2",
                  "27:2",
                  "28:1",
                  "29:2",
                  "30:3",
                  "31:3",
                  "32:1",
                  "33:2",
                  "34:5",
                  "35:1",
                  "36:0",
                ]
              };
              final result = RouletteStatisticsCache.fromJson(string);
              Roulette100Dialog.show(result);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget createBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          userInfoWidget(context),
          const SizedBox(
            height: 14,
          ),
          recordWidgets(context),
          settingWidget(context),
        ],
      ),
    );
  }
}
