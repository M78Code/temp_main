import 'package:flutter_main/pages/splash/index.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "SplashController",
      builder: (_) {
        return Center(
          child: Text('SplashPage'),
        );
      },
    );
  }
}