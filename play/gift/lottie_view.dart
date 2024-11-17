import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

typedef AnimationStatusBlock = void Function(
    AnimationStatus, AnimationController);

class LottieWidget extends StatefulWidget {
  LottieWidget({required this.url, this.onStatusBlock});

  AnimationStatusBlock? onStatusBlock;
  String url;

  @override
  _LottieWidgetState createState() {
    return _LottieWidgetState();
  }
}

class _LottieWidgetState extends State<LottieWidget>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);
  String type = 'assets';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    String url = widget.url;

    if (url.startsWith('assets/')) {
      type = 'assets';
    } else if (url.startsWith('http')) {
      type = 'network';
    }
    if (widget.onStatusBlock != null) {
      _controller.addStatusListener((status) {
        widget.onStatusBlock!(status, _controller);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (type == 'network') {
      return Lottie.network(
        widget.url,
        repeat: false,
        controller: _controller,
        onLoaded: (composition) {
          _controller.duration = composition.duration;
          _controller.forward();
          // 设置动画播放完成时的行为
        },
      );
    }
    return Lottie.asset(
      widget.url,
      repeat: false,
      controller: _controller,
      onLoaded: (composition) {
        _controller.duration = composition.duration;
        _controller.forward();
        // 设置动画播放完成时的行为
        // Future.delayed(Duration(seconds: composition.duration.inSeconds), () {
        //   print('动画播放完成！');
        // });
      },
    );
  }

  ///停止动画
  stop() {
    _controller.stop();
  }

  ///执行动画
  repeat() {
    _controller.repeat();
  }
}
