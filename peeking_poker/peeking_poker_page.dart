import 'package:flutter/material.dart';
import 'package:flutter_lib/pages/play/peeking_poker/peeking_poker_controller.dart';
import 'package:get/get.dart';

class PeekingPokerPage extends GetView<PeekingPokerController> {
  const PeekingPokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeekingPokerController>(
      id: "PeekingPokerPage",
      builder: (logic) {
        return Center(
          child: Text("咪牌"),
        );
      },
    );
  }


}
