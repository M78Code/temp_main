import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/configs/app_style.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../configs/app_colors.dart';
import '../../../../controllers/global_controller.dart';
import '../../../../models/ws/ws_401_model.dart';
import 'roullette_100_dialog_controller.dart';
import 'widget/circle_painter.dart';

// 轮盘近100局数据统计
class Roulette100Dialog extends GetView<Roulette100DialogController> {
  static void show(RouletteStatisticsCache roulette100) async {
    SmartDialog.show(
        builder: (context) {
          return Roulette100Dialog(roulette100);
        },
        alignment: Alignment.bottomCenter,
        keepSingle: true);
  }

  final bool isDark = GlobalController.controller.isDark;
  final RouletteStatisticsCache roulette100;

  Roulette100Dialog(
    this.roulette100, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(Roulette100DialogController());
    controller.initBaseData(roulette100);

    return Container(
      padding: PageStyle.mkPaddingOnly(
        top: 5,
        bottom: 20,
      ),
      height: 525.w,
      width: Get.width,
      decoration: BoxDecoration(
          color: !isDark ? AppColors.color_F4F9FF : AppColors.color_262D40,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        children: [
          topWidget(),
          centerWidget(),
          // 大小 、单双、黑红
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 红、黑
              buildHHDXDS(
                leftValue: '${roulette100.red ?? 0}%',
                leftText: 'game_result117'.tr,
                leftWidth: (roulette100.red ?? 0) /
                    (100 - (roulette100.zeroNum ?? 0)) *
                    100,
                rightValue: '${roulette100.black ?? 0}%',
                rightText: 'game_result118'.tr,
                rightWidth: (roulette100.black ?? 0) /
                    (100 - (roulette100.zeroNum ?? 0)) *
                    100,
              ),
              // 大小
              buildHHDXDS(
                leftValue: '${roulette100.big ?? 0}%',
                leftText: 'game_result104'.tr,
                leftWidth: (roulette100.big ?? 0) /
                    (100 - (roulette100.zeroNum ?? 0)) *
                    100,
                rightValue: '${roulette100.small ?? 0}%',
                rightText: 'game_result105'.tr,
                rightWidth: (roulette100.small ?? 0) /
                    (100 - (roulette100.zeroNum ?? 0)) *
                    100,
                gradientR: PageStyle.mkLinearUpDown(
                    const Color(0xFF3388FF), const Color(0xFF176DE6)),
              ),
              // 单双
              buildHHDXDS(
                leftValue: '${roulette100.odd ?? 0}%',
                leftText: 'game_result106'.tr,
                leftWidth: (roulette100.odd ?? 0) /
                    (100 - (roulette100.zeroNum ?? 0)) *
                    100,
                gradientL: PageStyle.mkLinearUpDown(
                    const Color(0xFF3388FF), const Color(0xFF176DE6)),
                rightValue: '${roulette100.even ?? 0}%',
                rightText: 'game_result107'.tr,
                rightWidth: (roulette100.even ?? 0) /
                    (100 - (roulette100.zeroNum ?? 0)) *
                    100,
                gradientR: PageStyle.mkLinearUpDown(
                    const Color(0xFFFF5959), const Color(0xFFE63939)),
              ),
            ],
          ).marginSymmetric(horizontal: 14.w, vertical: 7.w),
          // 列
          buildLie(),
          // 打
          buildDa(),
          // 下注类型
          buildBetType(),
        ],
      ),
    );
  }

  Widget topWidget() {
    return Stack(
      children: [
        Container(
          height: 44.w,
          alignment: Alignment.center,
          child: Text(
            'record_100ju'.trParams({'s': '100'}),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                color: isDark
                    ? AppColors.darkTextColor07
                    : AppColors.color_253D61),
          ),
        ),
        Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              color:
                  isDark ? AppColors.darkTextColor07 : AppColors.color_253D61,
              onPressed: () => SmartDialog.dismiss(),
            )),
      ],
    );
  }

  Widget centerWidget() {
    final sheng1 = controller.textSList.first;
    final sheng2 = controller.textSList[1];
    final sheng3 = controller.textSList[2];
    final sheng4 = controller.textSList[3];
    final sheng5 = controller.textSList[4];

    final jang1 = controller.textJList.first;
    final jang2 = controller.textJList[1];
    final jang3 = controller.textJList[2];
    final jang4 = controller.textJList[3];
    final jang5 = controller.textJList[4];

    return Container(
      height: 226.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 36.w,
            height: 187.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.routte100bg(isDark: isDark)),
                  fit: BoxFit.fill,
                  alignment: Alignment.center),
            ),
            child: Column(
              children: [
                // 雪
                Image.asset(R.gemaRouletteSnow, width: 32.w, height: 36.w),
                // 7
                buildCenterText(
                    text: sheng1.text ?? '', isRed: sheng1.isRed ?? true),
                // 1
                buildCenterText(
                    text: sheng2.text ?? '', isRed: sheng2.isRed ?? true),
                // 35
                buildCenterText(
                    text: sheng3.text ?? '', isRed: sheng3.isRed ?? true),
                // 31
                buildCenterText(
                    text: sheng4.text ?? '', isRed: sheng4.isRed ?? true),
                // 28
                buildCenterText(
                    text: sheng5.text ?? '',
                    isRed: sheng5.isRed ?? true,
                    ishiddeLine: true),
              ],
            ),
          ),
          // 火
          Container(
            width: 216.w,
            height: 216.w,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage(AppImages.routteDiscBg(isDark: isDark)),
            //       fit: BoxFit.fill,
            //       alignment: Alignment.center),
            // ),
            child: CustomPaint(
                painter: RCirclePainter(isDark, controller.textList)),
          ),

          Container(
            width: 36.w,
            height: 187.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.routte100bg(isDark: isDark)),
                  fit: BoxFit.fill,
                  alignment: Alignment.center),
            ),
            child: Column(
              children: [
                // 热
                Image.asset(R.gemaRouletteFire,
                    scale: 3, width: 32.w, height: 36.w),
                // 19
                buildCenterText(
                    text: jang1.text ?? '', isRed: jang1.isRed ?? true),
                // 6
                buildCenterText(
                    text: jang2.text ?? '', isRed: jang2.isRed ?? true),
                // 16
                buildCenterText(
                    text: jang3.text ?? '', isRed: jang3.isRed ?? true),
                // 32
                buildCenterText(
                    text: jang4.text ?? '', isRed: jang4.isRed ?? true),
                // 10
                buildCenterText(
                    text: jang5.text ?? '',
                    isRed: jang5.isRed ?? true,
                    ishiddeLine: true),
              ],
            ),
          ),
        ],
      ),
    ).marginSymmetric(vertical: 5.w, horizontal: 14.w);
  }

  /// ********** 底线部分
  /// 中间部分的文本
  Widget buildCenterText({
    String text = '0',
    bool ishiddeLine = false,
    bool isRed = true, // 红 、黑分深色 浅色模式
  }) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: ishiddeLine ? 34.w : 27.5.w,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: text == '0'
                    ? const Color(0xFF0BB865)
                    : isRed
                        ? const Color(0xFFFF3E3E)
                        : isDark
                            ? const Color(0xFFDCDCDC)
                            : const Color(0xFF30425C)),
          ),
        ),
        // 线条
        ishiddeLine
            ? Container()
            : Container(
                height: 0.5.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    isDark
                        ? const Color(0xFF5c7099).withOpacity(0)
                        : Colors.white,
                    isDark ? const Color(0xFF5c7099) : const Color(0xFFADBACC),
                    isDark
                        ? const Color(0xFF5c7099).withOpacity(0)
                        : Colors.white,
                  ],
                ))).marginSymmetric(horizontal: 5.w),
      ],
    );
  }

  /// ********** 底线部分
  /// 第X列
  Widget buildLie() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //0
        buildItemtext(
          width: 56.w,
          radDirection: 0,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: '0',
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.zeroNum ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFF0ACC6B), const Color(0xFF08A657)),
        ),
        // 第一列
        buildItemtext(
          width: 94.w,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'lpan_lie'.trParams({'s': '一'}),
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.column1 ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFF3388FF), const Color(0xFF176DE6)),
        ),
        // 第二列
        buildItemtext(
          width: 100.w,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'lpan_lie'.trParams({'s': '二'}),
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.column2 ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFF3388FF), const Color(0xFF176DE6)),
        ),
        // 第三列
        buildItemtext(
          width: 94.w,
          radDirection: 1,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'lpan_lie'.trParams({'s': '三'}),
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.column3 ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFF3388FF), const Color(0xFF176DE6)),
        ),
      ],
    ).marginSymmetric(horizontal: 14.w, vertical: 7.w);
  }

  /// 第X打
  Widget buildDa() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //0
        buildItemtext(
          width: 56.w,
          radDirection: 0,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: '0',
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.zeroNum ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFF0ACC6B), const Color(0xFF08A657)),
        ),
        // 第一打
        buildItemtext(
          width: 94.w,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'lpan_da'.trParams({'s': '一'}),
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.dozen1 ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFFFF5959), const Color(0xFFE63939)),
        ),
        // 第二打
        buildItemtext(
          width: 100.w,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'lpan_da'.trParams({'s': '二'}),
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.dozen2 ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFFFF5959), const Color(0xFFE63939)),
        ),
        // 第三打
        buildItemtext(
          width: 94.w,
          radDirection: 1,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'lpan_da'.trParams({'s': '三'}),
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.dozen3 ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              const Color(0xFFFF5959), const Color(0xFFE63939)),
        ),
      ],
    ).marginSymmetric(horizontal: 14.w, vertical: 7.w);
  }

  /// 下注类型
  Widget buildBetType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //轮盘下角注
        buildItemtext(
          width: 86.w,
          radDirection: 0,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'game_result130'.tr,
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.thirdCylinder ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              isDark ? const Color(0xFF616267) : const Color(0xFF98A3B3),
              isDark ? const Color(0xFF73787E) : const Color(0xFFB8C6D9)),
        ),
        // 轮上孤注
        buildItemtext(
          width: 86.w,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'game_result131'.tr,
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.orphans ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              isDark ? const Color(0xFF616267) : const Color(0xFF98A3B3),
              isDark ? const Color(0xFF73787E) : const Color(0xFFB8C6D9)),
        ),
        // 零旁注上角
        buildItemtext(
          width: 86.w,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'game_result132'.tr,
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.neighborsOfZero ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              isDark ? const Color(0xFF616267) : const Color(0xFF98A3B3),
              isDark ? const Color(0xFF73787E) : const Color(0xFFB8C6D9)),
        ),
        // 轮上零旁
        buildItemtext(
          width: 86.w,
          radDirection: 1,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: 'game_result135'.tr,
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: '${roulette100.zero ?? 0}%',
          gradient: PageStyle.mkLinearUpDown(
              isDark ? const Color(0xFF616267) : const Color(0xFF98A3B3),
              isDark ? const Color(0xFF73787E) : const Color(0xFFB8C6D9)),
        ),
      ],
    ).marginSymmetric(horizontal: 14.w, vertical: 7.w);
  }

  /// 红、黑、单双、大小
  Widget buildHHDXDS({
    String leftText = '红',
    String leftValue = '0%',
    double leftWidth = 50.0,
    Gradient? gradientL,
    String rightText = '黑',
    String rightValue = '0%',
    double rightWidth = 50.0,
    Gradient? gradientR,
  }) {
    final height = 20.w;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildItemtext(
          width: leftWidth,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: leftText,
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: leftValue,
          radDirection: 0,
          position: 0,
          gradient: gradientL ??
              PageStyle.mkLinearUpDown(
                  const Color(0xFFFF5959), const Color(0xFFE63939)),
        ),
        Container(
            width: 8.w,
            height: height,
            decoration: BoxDecoration(
              gradient: PageStyle.mkLinearUpDown(
                  const Color(0xFF0ACC6B), const Color(0xFF08A657)),
            )),
        buildItemtext(
          width: rightWidth,
          textColor: isDark ? const Color(0xFFDCDCDC) : Colors.white,
          text: rightText,
          proColor: isDark ? const Color(0xFF73787E) : const Color(0xFF7288AA),
          proportion: rightValue,
          radDirection: 1,
          position: 1,
          gradient: gradientR ??
              PageStyle.mkLinearUpDown(
                  const Color(0xFF565D73), const Color(0xFF303440)),
        ),
      ],
    );
  }

  /// 百分比 背景条
  Widget buildItemtext({
    double width = 50,
    int position = 2, // 0 left 1right 2center
    int radDirection = 2, // 2center 0left 1right
    Gradient? gradient, // 渐变背景
    String proportion = '0%', // 比例 10%
    Color proColor = Colors.black,
    String? text, // 名称
    Color textColor = Colors.white,
  }) {
    final height = 20.w;
    return Column(
      crossAxisAlignment: position == 2
          ? CrossAxisAlignment.center
          : position == 0
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
      children: [
        Text(
          proportion,
          style: TextStyle(
            fontSize: 12.sp,
            color: proColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        1.w.verticalSpace,
        Container(
          height: height,
          width: width,
          padding: PageStyle.mkPaddingLR(4.w),
          decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: radDirection == 2
                  ? PageStyle.mkRadiusAll(0)
                  : radDirection == 0
                      ? PageStyle.mkRadiusLeft(3)
                      : PageStyle.mkRadiusRight(3)),
          alignment: position == 2
              ? Alignment.center
              : position == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
          child: Text(
            text ?? 'red',
            style: TextStyle(
              fontSize: 12.sp,
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
