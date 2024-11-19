import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/pages/play/bet_commission_switch/bet_game_commission_switch_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BetGameCommissionSwitchPage extends StatefulWidget {
  BetGameCommissionSwitchPage({super.key});

  @override
  State<BetGameCommissionSwitchPage> createState() => _BetGameCommissionSwitchPageState();
}

class _BetGameCommissionSwitchPageState extends State<BetGameCommissionSwitchPage> {
  BetGameCommissionSwitchController controller = Get.put(BetGameCommissionSwitchController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: SizedBox(
        width: Get.width,
        height: 300.h,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(46.h),
              // 设置APPBar 顶部圆角
              child: AppBar(
                backgroundColor: AppColors.lightGameSwitchFullBackColor01,
                title: Text(
                  "切换免佣",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                leading: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.black26,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                // 标题居中对其
                centerTitle: true,
              ),
            ),
            body: buildBodyWidget()),
      ),
    );
  }

  Widget buildBodyWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
      height: 300.h - 46.h,
      // color: #F4F9FF,
      color: AppColors.lightGameSwitchFullBackColor01,
      child:  Obx((){
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                print("点击了庄不免佣金");
                controller.isCommission.value = 0;
              },
              child: buildItemWidget(Text("“庄”不免佣",
                  style: TextStyle(fontSize: 16,
                      color: Colors.black, fontWeight: FontWeight.bold)),
                [
                  TextSpan(
                      text: "庄以", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "任何点数", style: TextStyle(color: Colors.red)),
                  TextSpan(
                      text: "取胜，赔率都为1:0.95; 开和时退回本金",
                      style: TextStyle(color: Colors.black)),
                ],
                isSelected: controller.isCommission.value == 0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                print("点击了庄免佣");
                controller.isCommission.value = 1;
              },

              child: buildItemWidget(Text("“庄”免佣",
                  style: TextStyle(fontSize: 16,
                      color: Colors.black, fontWeight: FontWeight.bold)),
                [
                  TextSpan(
                      text: "庄以", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "6点以为的点数", style: TextStyle(color: Colors.red)),
                  TextSpan(
                      text: "取胜，赔率都为1:1;以",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "6点", style: TextStyle(color: Colors.red)),
                  TextSpan(
                    text: "取胜，赔率为1:0.5;开和时退回本金",
                    style: TextStyle(color: Colors.black),

                  ),
                ],
                isSelected: controller.isCommission.value == 1,
              ),

            ),
          ],
        );
      }),

    );
  }


  Widget buildItemWidget(Text textTitle, List<TextSpan> textSpanList,{required bool isSelected}) {

    return  Container(
      width: double.infinity,
      height: 92.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), // 左上角圆角半径
          topRight: Radius.circular(10), // 右上角圆角半径
          bottomLeft: Radius.circular(10), // 左下角圆角半径
          bottomRight: Radius.circular(10), // 右下角圆角半径
        ),
        border: Border.all(
          // color: controller.checkBorderColor(isSelected),
            color: isSelected
                ? AppColors.lightGameSwitchBorderColor01
                : AppColors.lightGameSwitchFullBackColor01,
            width: 1.0),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle,
            // Text("庄以任何点数取胜，赔率都为1:0.95; 开和时退回本金"),
            SizedBox(height: 5,),
            RichText(
              text: TextSpan(children: textSpanList ),
            ),
          ],
        ),
      ),
    );

  }



}
