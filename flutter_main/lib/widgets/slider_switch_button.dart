import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideSwitchButton extends StatefulWidget {
  final bool initialState;
  final ValueChanged<bool> onToggle;

  const SlideSwitchButton({
    super.key,
    this.initialState = false,
    required this.onToggle,
  });

  @override
  _SlideSwitchButtonState createState() => _SlideSwitchButtonState();
}

class _SlideSwitchButtonState extends State<SlideSwitchButton> {
  late bool isActive;
  late double position;
  final GlobalController globalController = GlobalController.controller;
  final double width = 46.w;
  final double hight = 26.w;
  final double harfWidth = 46.w / 2;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    isActive = widget.initialState;
    position = isActive ? harfWidth : 0;
  }

  void _toggleSwitch() {
    setState(() {
      isActive = !isActive;
      position = isActive ? harfWidth : 0;
      widget.onToggle(isActive); // 调用回调通知外部状态切换
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          // 更新滑块的位置
          position += details.delta.dx;
          if (position < 0) position = 0;
          if (position > harfWidth) position = harfWidth;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          isActive = position > harfWidth / 2;
          position = isActive ? harfWidth : 0;
          widget.onToggle(isActive); // 通知外部状态切换
        });
      },
      onTap: _toggleSwitch, // 点击切换状态
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: isActive
                  ? [
                      const Color(0XFF748eb2),
                      const Color(0XFF5b708c),
                    ]
                  : (globalController.mAppBgMode.value == 1
                      ? [const Color(0XFFD8e1ec), const Color(0XFFffffff)]
                      : [const Color(0XFF1f2433), const Color(0XFF1f2433)])),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: position,
              top: 0,
              bottom: 0,
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Slide Switch Button')),
//         body: Center(
//           child: SlideSwitchButton(
//             initialState: false,
//             onToggle: (value) {
//               print('Switch is now: ${value ? "ON" : "OFF"}');
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
