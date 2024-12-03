import 'package:flutter/material.dart';

class RoundedProgressIndicator extends StatefulWidget {
  final double radius;
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  const RoundedProgressIndicator({
    Key? key,
    this.radius = 50.0,
    this.progress = 0.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  }) : super(key: key);

  @override
  _RoundedProgressIndicatorState createState() =>
      _RoundedProgressIndicatorState();
}

class _RoundedProgressIndicatorState extends State<RoundedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..addListener(_rebuild);
    _animation =
        Tween<double>(begin: 0.0, end: widget.progress).animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(RoundedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _controller.animateTo(widget.progress);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RoundedProgressPainter(
        radius: widget.radius,
        progress: _animation.value,
        backgroundColor: widget.backgroundColor,
        progressColor: widget.progressColor,
      ),
    );
  }
}

class _RoundedProgressPainter extends CustomPainter {
  final double radius;
  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  _RoundedProgressPainter({
    required this.radius,
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(radius)), paint);

    paint.color = progressColor;
    final progressRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: rect.center,
        width: rect.width * progress,
        height: rect.height,
      ),
      Radius.circular(radius),
    );
    canvas.drawRRect(progressRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
