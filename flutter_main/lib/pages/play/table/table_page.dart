import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/pages/play/table/table_controller.dart';
import 'package:flutter_main/widgets/flv_video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              height: ScreenUtil().setWidth(324),
              child: controller.flvUrl.value.isEmpty
                  ? const Image(
                width: double.infinity,
                height: double.infinity,
                image: AssetImage(R.playPlayRoomTopBg),
                fit: BoxFit.fill,
              )
                  :  Container()),
              // CustomFlvVideoPlayer(
              //         flvUrl:
              //         'https://play.vetupf.com/live/cc15s.flv?auth_token=1728358125-0-0-e1efe65eb3155ded663aaf25faa1fce5',
              //         isPlaying: true,
              //         onPlayPause: (isPlaying) {})),

          Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(
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
