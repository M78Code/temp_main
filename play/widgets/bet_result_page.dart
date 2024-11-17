import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/pages/play/play_room/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BetResultPage extends GetView<PlayRoomController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.center,
        children: [
          if (controller.mBetResultAmountObs.value != 0)
            Positioned(
                top: ScreenUtil().screenHeight * 0.3,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 22.w,
                    bottom: 5.w,
                  ),
                  width: 262.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(controller.mBetResultAmountObs.value > 0
                          ? R.playWinBg
                          : R.playLostBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(children: [
                    Text(controller.mBetResultAmountObs.value > 0
                        ? '恭喜您赢'
                        : '您输',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'BetPlay',
                          color: Color(0xFFFFFFFF),
                        )),
                    Text(controller.mBetResultAmountObs.value.abs().toStringAsFixed(2).toString(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'BetPlay',
                          color: Color(0xFFFFFFFF),
                        )),
                  ]),
                ))
        ],
      );
    });
  }
}
