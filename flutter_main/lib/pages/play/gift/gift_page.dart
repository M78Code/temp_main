import 'package:flutter/cupertino.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:get/get.dart';

import 'lottie_view.dart';

class GiftPage extends GetView<PlayRoomController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildGift(),
      ],
    );
  }

  Widget buildGift() {
    return Obx(() {
      if (!controller.isShowGift.value) {
        return Container();
      }
      String str =
          controller.s50024model.value.result?.first.animationEffectFileUrls ??
              '';
      var url = '';
      if (str == '') {
        return Container();
      } else if (str.startsWith('http')) {
        url = str;
      } else {
        url = 'assets/json/$str.json';
      }
      return SizedBox(
        width: Get.width,
        height: Get.height,
        child: LottieWidget(
          url: url,
          onStatusBlock: (s, c) {
            if (s.isCompleted) {
              c.stop();
              controller.isShowGift.value = false;
            }
          },
        ),
      );
    });
  }
}
