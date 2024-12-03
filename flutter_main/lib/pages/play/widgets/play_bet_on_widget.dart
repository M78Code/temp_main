import 'package:flutter/material.dart';
import 'package:flutter_main/generated/r.dart';
import 'package:flutter_main/pages/play/bet_on/index.dart';
import 'package:flutter_main/pages/play/widgets/play_adapter.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_main/widgets/theme_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 百家乐-经典玩法
class PlayBetOnWidget extends GetView<BetOnController> {
  const PlayBetOnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        height: ScreenUtil().setWidth(176),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.playBetOnTopBrBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          // alignment: Alignment.center,
          children: [
            betOnBottomWidget(),
            betOnTopClassicsWidget(),
          ],
        ),
      );
    });
  }

  /// 投注区域-经典玩法
  betOnTopClassicsWidget() {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CustomPlayWidget(
                betPointId: BaccaratBetPointGroupType.PLAYER_NUMBER_PAIR.value,
                betOnController: controller,
                isFirst: true,
              ),
              _CustomPlayWidget(
                betPointId: BaccaratBetPointGroupType.BANKER_NUMBER_PAIR.value,
                betOnController: controller,
              ),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: 0.6,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  /// 投注区域-闲和庄
  betOnBottomWidget() {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(controller.profitBetPointDTOSMapObs
              .containsKey(BaccaratBetPointGroupType.TIE.value)
              ? R.playBottomBgRebateCn
              : R.playBetOnBottomBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          _CustomPlayWidget2(
            betPointId: BaccaratBetPointGroupType.PLAYER.value,
            betOnController: controller,
          ),
          _CustomPlayWidget2(
            betPointId: BaccaratBetPointGroupType.TIE.value,
            betOnController: controller,
          ),
          _CustomPlayWidget2(
            betPointId: BaccaratBetPointGroupType.BANKER.value,
            betOnController: controller,
          ),
        ],
      ),
    );
  }
}

class _CustomPlayWidget extends StatelessWidget {
  final int betPointId;
  final BetOnController betOnController;
  final bool isFirst;

  const _CustomPlayWidget({
    super.key,
    required this.betPointId,
    required this.betOnController,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          betOnController.onTapBetOn(betPointId);
        },
        child: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: betOnController.onTapBetHelp,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5, right: 9),
                          width: 10,
                          height: 10,
                          alignment: Alignment.center,
                          // 内容居中对齐
                          child: Image.asset(R.playIconPlayHelp),
                        ),
                      )
                    ],
                  ),
                  // Gaps.h2,
                  Text(PlayAdapter.getTextContent(betPointId),
                      style: PlayAdapter.getTextStyle(betPointId, true)),
                  Gaps.h4,
                  Text(
                      betOnController
                          .mTableBootNumberLimitMapObs[betPointId]
                          ?.playRate ??
                          "0:0",
                      style: PlayAdapter.getTextStyle(betPointId, false)),
                  Gaps.h5,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        alignment: Alignment.center,
                        child: Image.asset(R.playIconPlayPlayer),
                      ),
                      Gaps.w2,
                      Text(
                          "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.player ?? 0 : 0}",
                          style:
                          TextStyle(fontSize: 10, color: Color(0xFFFFFFFF))),
                      Gaps.w10,
                      Container(
                        width: 10,
                        height: 10,
                        alignment: Alignment.center,
                        child: Image.asset(R.playIconPlayAmount),
                      ),
                      Gaps.w2,
                      Text(
                          "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0 : 0}",
                          style:
                          TextStyle(fontSize: 10, color: Color(0xFFFFFFFF))),
                    ],
                  )
                ],
              ),
            ),
            if (betOnController.tableBetPointDetailMapObs.containsKey(betPointId))
              Positioned(
                top: 5,
                child: ThemeImage(
                  width: 25,
                  height: 25,
                  isFirst ? R.playIconRebateRCn : R.playIconRebateCn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomPlayWidget2 extends StatelessWidget {
  final int betPointId;
  final BetOnController betOnController;

  const _CustomPlayWidget2({
    super.key,
    required this.betPointId,
    required this.betOnController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          betOnController.onTapBetOn(betPointId);
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(PlayAdapter.getTextContent(betPointId),
                  style: PlayAdapter.getTextStyle(betPointId, true)),
              Gaps.h5,
              Text(
                  betOnController.mTableBootNumberLimitMapObs[betPointId]
                      ?.playRate ??
                      "0:0",
                  style: PlayAdapter.getTextStyle(betPointId, false)),
              Gaps.h8,
              Container(
                // betOnBottomTotalAmount 50
                width: getAmountRatio(betPointId),
                height: 2,
                decoration: BoxDecoration(
                  gradient: PlayAdapter.getGradient(betPointId),
                ),
              ),
              Gaps.h7,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10, // 给Container设置宽度
                    height: 10, // 给Container设置高度
                    alignment: Alignment.center, // 内容居中对齐
                    child: Image.asset(R.playIconPlayPlayer), // Text可设置为需要的内容或占位符
                  ),
                  Gaps.w2,
                  Text(
                      "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.player ?? 0 : 0}",
                      style: TextStyle(fontSize: 10, color: Color(0xFFFFFFFF))),
                  Gaps.w10,
                  Container(
                    // color: Colors.red,// 背景颜色
                    width: 10, // 给Container设置宽度
                    height: 10, // 给Container设置高度
                    alignment: Alignment.center, // 内容居中对齐
                    child: Image.asset(R.playIconPlayAmount), // Text可设置为需要的内容或占位符
                  ),
                  Gaps.w2,
                  Text(
                      "${betOnController.tableBetPointDetailMapObs.containsKey(betPointId) ? betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0 : 0}",
                      style: TextStyle(fontSize: 10, color: Color(0xFFFFFFFF))),
                ],
              ),
              Gaps.h18,
            ],
          ),
        ),
      ),
    );
  }

  double getAmountRatio(int betPointId) {
    if(!betOnController.tableBetPointDetailMapObs.containsKey(betPointId) || 0 == betOnController.betOnBottomTotalAmount) {
      return 2;
    }
    var amount = betOnController.tableBetPointDetailMapObs[betPointId]?.amount ?? 0;
    if(0 == amount) {
      return 2;
    }

    var d = amount/betOnController.betOnBottomTotalAmount;

    return 50 * d;
  }
}
