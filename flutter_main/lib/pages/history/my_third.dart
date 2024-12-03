import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen3 extends StatelessWidget {
  const MainScreen3({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Go Back to Second Screen",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  PersistentNavBarNavigator
                      .popUntilFirstScreenOnSelectedTabScreen(context);
                },
                child: const Text(
                  "Pop back to First screen",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
}
