import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/pages/home/custom-widget-tabs.widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../models/app_config_model.dart';
import '../../net/socket/base/URLManager.dart';

BuildContext? testContext;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MainMenuState();
}

class _MainMenuState extends State<MyHomePage> {


  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text("Custom widget example"),
                onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: CustomWidgetExample(),
                ),
              ),
            ),
          ],
        ),
      );

}
