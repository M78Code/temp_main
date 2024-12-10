import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/pages/play/peeking_poker/peeking_poker_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PeekingPokerPage extends GetView<PeekingPokerController> {
  const PeekingPokerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeekingPokerController>(
      id: "PeekingPokerPage",
      builder: (logic) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                R.playingCardsBgPeeking,
              ),
            ),
          ),
          width: double.infinity,
          // height: 400,
          child: Column(
            children: [
              _playerAndBankerView(),
              _openPokerResultView(),
              _peekingPokerBgView(),
            ],
          ),
        );
      },
    );
  }

  Widget _playerAndBankerView() {
    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pillboxView(const Color(0xff147CF7), "闲牌全开"),
          _buildText("闲"),
          _buildTimerView(),
          _buildText("庄"),
          _pillboxView(const Color(0xffF71414), "庄牌全开"),
        ],
      ),
    ).marginSymmetric(
      vertical: ScreenUtil().setHeight(10),
    );
  }

  //咪牌主背景
  Widget _peekingPokerBgView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          R.playingCardsPokerBg,
          width: ScreenUtil().setWidth(180),
          height: ScreenUtil().setHeight(250),
          fit: BoxFit.cover,
        ),
        Image.asset(
          R.playingCardsBgEllipse,
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setHeight(100),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "点击中央开牌",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(14),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _pillboxView(color, text) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(80),
      height: ScreenUtil().setHeight(28),
      decoration: BoxDecoration(
        color: color, // 背景色
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenUtil().radius(14)),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(12),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildText(text, {size = 24}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: ScreenUtil().setSp(size),
        color: Colors.white,
      ),
    ).marginSymmetric(
      horizontal: ScreenUtil().setWidth(10),
    );
  }

  //开处理结果
  Widget _openPokerResultView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPokerImage(),
        _buildPokerImage(),
        _buildText("可选择开牌", size: 12),
        _buildPokerImage(),
        _buildPokerImage(),
      ],
    ).marginOnly(top: 10, bottom: 25);
  }

  Widget _buildPokerImage({String path = R.playingCardsPokerBg}) {
    return Image.asset(
      path,
      width: ScreenUtil().setWidth(36),
      height: ScreenUtil().setHeight(50),
      fit: BoxFit.cover,
    ).marginAll(3);
  }

  Widget _buildTimerView() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(56),
      height: ScreenUtil().setHeight(56),
      color: Colors.blue,
      child: const Text(
        "倒计时",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
