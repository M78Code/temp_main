import 'package:flutter/material.dart';
import 'package:flutter_main/pages/play/count_down/count_down_controller.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:get/get.dart';

class CountDownPage extends GetView<CountDownController> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CountDownController());

    // Color(0xFFFFF065)

    // style: TextStyle(fontSize: 20, color: Color(0xFF25E315))  18
    // style: TextStyle(fontSize: 20, color: Color(0xFFFF0000))  3
    // style: TextStyle(fontSize: 20, color: Color(0xFFFFF065))  7
    // style: TextStyle(fontSize: 10, color: Color(0xFFC1C5CF))  开牌中

    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(2),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0x99000000)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
                value: controller.progressValue.value,
                strokeWidth: 2.5,
                backgroundColor: const Color(0x33FFFFFF),
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color(getProgressColor(controller.countTime.value)))),
            Text(controller.showContent.value,
                style: getContentTextStyle(controller.countTime.value)),
          ],
        ),
      );
    });
  }

  int getProgressColor(int countTime) {
    if (0 > countTime) {
      return 0x33FFFFFF;
    } else if (0 <= countTime &&
        8 >= countTime) {
      return 0xFFFF0000;
    } else if (8 < countTime) {
      return 0xFF25E315;
    } else {
      return 0x33FFFFFF;
    }
  }

  // String getShowContent(int gameStatus) {
  //   String showContent = '';
  //   if(GameStatus.BET.value == gameStatus) {
  //     if (0 <= countTime) {
  //       return "${countTime}";
  //     }
  //   } else {
  //     showContent = controller.showContent;
  //   }
  //   return showContent;
  // }

  TextStyle getContentTextStyle(int countTime) {
    if (-1 == countTime) {
      return const TextStyle(fontSize: 10, color: Color(0xFFC1C5CF));
    }
    if (-2 == countTime) {
      return const TextStyle(fontSize: 20, color: Color(0xFFFF0000));
    }
    if (0 <= countTime && 8 >= countTime) {
      return const TextStyle(fontSize: 20, color: Color(0xFFFF0000));
    }
    if (8 < countTime) {
      return const TextStyle(fontSize: 20, color: Color(0xFF25E315));
    }
    return const TextStyle(fontSize: 10, color: Color(0xFFC1C5CF));
  }
}
