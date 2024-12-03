import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/pages/base/base_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// 声音设置对话框

class VoiceSettingDialog extends StatelessWidget {

  static void show() async {
    SmartDialog.show(builder: (context) {
      return VoiceSettingDialog();
    }, alignment: Alignment.bottomCenter, keepSingle: true);
  }

  final bool isDark = GlobalController.controller.isDark;

  VoiceSettingDialog({super.key});

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
        const Spacer(),
        Text('声音设置', style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 17, fontWeight: FontWeight.w500),),
        const Spacer(),
        const SizedBox(width: 22, height: 22,),
        SizedBox(width: 14.w,),
      ],),
    );
  }

  Widget _content(BuildContext context) {
    settingRow({ required String label, required List<Widget> rightChild, required bool isShowDivider }) {
      return SizedBox(
        width: double.infinity,
        height: 45.h,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: Row(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(width: 14.w,),
            Text(label, style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 14, fontWeight: FontWeight.w400),),
            SizedBox(width: 14.w,),
            ...rightChild,
            SizedBox(width: 14.w,)
          ],)),
          if (isShowDivider)
            ...[Divider(height: 1.h, color: AppColors.dividerColor(isDark), indent: 14.w, endIndent: 14.w,)]
        ],),
      );
    }
    sliderWidget() {
      return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: const Color(0xFF748EB2),
          inactiveTrackColor: const Color(0xFFC2CBD9),
          thumbColor: const Color(0xFF55A3FF),
          overlayColor: const Color(0xFF748EB2).withOpacity(0.2),
          trackShape: CustomTrackShape(),
          thumbShape: RectangularSliderThumbShape(),
        ),
        child: Slider(
          value: 0.5, // 滑块的当前值
          onChanged: (value) {},
          min: 0,
          max: 1,
        ),
      );
    }
    return BaseCardWidget(isDark: isDark, child: Column(children: [
      settingRow(
        label: "声音开关",
        rightChild: [const Spacer(), CupertinoSwitch(
          value: false,
          activeColor: const Color(0xFF748EB2),
          trackColor: isDark ? Colors.black38 : const Color(0xFFD8E1EC),
          onChanged: (value) {})],
        isShowDivider: true),
      settingRow(
          label: "游戏语音",
          rightChild: [Expanded(child: sliderWidget())],
          isShowDivider: true),
      settingRow(
          label: "游戏音效",
          rightChild: [Expanded(child: sliderWidget())],
          isShowDivider: true),
      settingRow(
          label: "现场声音",
          rightChild: [Expanded(child: sliderWidget())],
          isShowDivider: false),
    ],),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.pageBackgroundColor(isDark),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(),
          Padding(
            padding: EdgeInsets.only(top: 14.h, left: 14.w, right: 14.w, bottom: 40.h),
            child: _content(context),
          )
        ],),
    );
  }

}

// 自定义矩形滑块
class RectangularSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(12.0, 20.0); // 设置矩形滑块的大小 (宽, 高)
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;
    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: 6.0,  // 矩形滑块的宽度
      height: 14.0, // 矩形滑块的高度
    );

    // 绘制矩形滑块
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue;
    final RRect rrect = RRect.fromRectAndRadius(thumbRect, const Radius.circular(2));

    canvas.drawRRect(rrect, paint);
  }
}

// 自定义轨道形状，确保thumb不会滑出轨道
class CustomTrackShape extends SliderTrackShape {

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required Offset thumbCenter, Offset? secondaryOffset,
        bool isEnabled = true, bool isDiscrete = true, required TextDirection textDirection}) {
    final double trackHeight = sliderTheme.trackHeight ?? 4.0;
    final double thumbRadius = sliderTheme.thumbShape?.getPreferredSize(isEnabled, isDiscrete).width ?? 0.0;

    // 限制轨道绘制区域，使其缩进 thumb 的半径
    final Rect trackRect = Rect.fromLTRB(
    offset.dx + thumbRadius / 2, // 开始位置：缩进 thumb 的半径一半
    thumbCenter.dy - trackHeight / 2, // 轨道居中
    offset.dx + parentBox.size.width - thumbRadius / 2, // 结束位置：缩进 thumb 的半径一半
    thumbCenter.dy + trackHeight / 2,
    );

    final Paint activeTrackPaint = Paint()..color = sliderTheme.activeTrackColor!;
    final Paint inactiveTrackPaint = Paint()..color = sliderTheme.inactiveTrackColor!;

    // 绘制激活部分轨道
    final RRect activeRRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom),
      Radius.circular(trackHeight / 2.0)
    );
    context.canvas.drawRRect(activeRRect, activeTrackPaint);

    // 绘制未激活部分轨道
    final RRect inactiveRRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom),
      Radius.circular(trackHeight / 2.0)
    );
    context.canvas.drawRRect(inactiveRRect, inactiveTrackPaint);
  }

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = true, bool isDiscrete = true}) {
    final double trackHeight = sliderTheme.trackHeight ?? 50;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    // 让轨道宽度等于 Slider 宽度
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }


}