import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/pages/play/table/table_controller.dart';
import 'package:flutter_main/widgets/flv_video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/toast_util.dart';

class TablePage extends GetView<TableController> {
  @override
  Widget build(BuildContext context) {
    return tableBg();
  }

  /// 桌牌背景
  /// 视频显示 or 默认桌牌
  tableBg() {
    return Obx(() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenUtil().screenHeight * 0.38,
            child: CustomVDViwn(
                flvUrl: controller.flvUrl.value,
                defaultImg: R.playPlayRoomTopBg,
                isPlaying: true,
                onPlayPause: (isPlaying) {}),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            child: const Image(
              width: double.infinity,
              height: double.infinity,
              image: AssetImage(R.playPlayRoomBg),
              fit: BoxFit.fill,
            ),
          ))
        ],
      );
    });
  }
}
