import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';

class CustomRoundedRectSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged; // 进度回调

  const CustomRoundedRectSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  _CustomRoundedRectSliderState createState() =>
      _CustomRoundedRectSliderState();
}

class _CustomRoundedRectSliderState extends State<CustomRoundedRectSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value; // 初始进度
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: AppColors.color_748EB2, // 已选部分的颜色
        inactiveTrackColor: AppColors.color_C2CBD9, // 未选部分的颜色
        trackHeight: 4.0, // 轨道的高度
        thumbColor: AppColors.color_55A3FF, // 滑块的颜色
        thumbShape: const RoundRectSliderThumbShape(
          enabledThumbRadius: 12.0, // 圆角半径
          thumbHeight: 16.0, // 滑块高度
          thumbWidth: 6.0, // 滑块宽度
        ),
        overlayColor: Colors.blue.withOpacity(0.2), // 滑块点击时的颜色
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 20.0, // 滑块点击时的扩展半径
        ),
      ),
      child: Slider(
        value: _currentValue,
        min: widget.min,
        max: widget.max,
        onChanged: (value) {
          setState(() {
            _currentValue = value; // 更新当前进度
          });
          widget.onChanged(value); // 回调当前进度值
        },
      ),
    );
  }
}

/// 自定义的矩形滑块形状
class RoundRectSliderThumbShape extends SliderComponentShape {
  final double enabledThumbRadius;
  final double thumbHeight;
  final double thumbWidth;

  const RoundRectSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.thumbHeight = 20.0,
    this.thumbWidth = 10.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
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
    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: thumbWidth,
      height: thumbHeight,
    );

    final RRect thumbRRect = RRect.fromRectAndRadius(
      thumbRect,
      Radius.circular(enabledThumbRadius),
    );

    canvas.drawRRect(thumbRRect, paint);
  }
}
