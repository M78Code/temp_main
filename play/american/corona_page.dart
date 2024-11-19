import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/r.dart';
import '../gift/lottie_view.dart';
import 'AmericanView.dart';
import 'corona_controller.dart';

class CoronaPage extends GetView<CoronaController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTop(context),
        buildButton(context),
      ],
    );
  }

  Widget buildTop(BuildContext context) {
    return Expanded(
        child: IgnorePointer(
      ignoring: true, // true时事件会穿透
      child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: LottieWidget(
          url: R.coronaM16,
          onStatusBlock: (s, c) {
            if (s.isCompleted) {
              c.stop();
            }
          },
        ),
      ),
    ));
  }

  Widget buildButton(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Container(
      width: screenWidth,
      height: ScreenUtil().screenHeight * 0.62,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color(0xFF91022E),
            Color(0xFF91022E),
            Color(0xFF730425),
            Color(0xFF740426)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 32,
            left: screenWidth * 0.135,
            right: screenWidth * 0.135,
            bottom: bottomSafeArea + 48,
            child: AmericanView(),
          ),
          Positioned(
              top: 8,
              left: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '局号:GC02411758F',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.699999988079071),
                      fontSize: 10,
                      fontFamily: 'PingFang SC',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 8,
              right: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '限红:20～5000',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.699999988079071),
                      fontSize: 10,
                      fontFamily: 'PingFang SC',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 32,
              right: 11,
              child: Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.00, 1.00),
                    end: const Alignment(0, -1),
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.80,
                      color: Colors.white.withOpacity(0.20000000298023224),
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x33330008),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Text(
                  '玩法',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'PingFang SC',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
              )),
          Positioned(
              top: 32,
              left: 0,
              bottom: bottomSafeArea + 38,
              width: screenWidth * 0.1,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(10)),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(4),
                      itemBuilder: (c, index) {
                        if (index == 0) {
                          return Container(
                            alignment: Alignment.center,
                            height: 19,
                            decoration: ShapeDecoration(
                              gradient: const RadialGradient(
                                center: Alignment(0.40, 0.75),
                                radius: 0,
                                colors: [
                                  Color(0xFFFF3528),
                                  Color(0xFFBA1308),
                                  Color(0xFFC53229)
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xFFC52828)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x66000000),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                )
                              ],
                            ),
                            child: Text(
                              '$index',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'SF Pro',
                                // height: 0.08,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              '$index',
                              style: TextStyle(
                                color:
                                    index % 2 == 0 ? Colors.red : Colors.white,
                                fontSize: 12,
                                fontFamily: 'SF Pro',
                              ),
                            ),
                          );
                        }
                      }),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: bottomSafeArea,
              height: 38,
              child: Container(
                color: Colors.green,
              )),
        ],
      ),
    );
  }
}
