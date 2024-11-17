import 'dart:async';

import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/ws/ws_104_model.dart';
import 'package:flutter_main/models/ws/ws_401_model.dart';
import 'package:flutter_main/models/ws/ws_game_status_model.dart';
import 'package:flutter_main/pages/play/widgets/play_adapter.dart';
import 'package:flutter_main/utils/Commond/Data/GameEnum.dart';
import 'package:get/get.dart';

class CountDownController extends GetxController {

  static CountDownController get controller {
    return Get.find<CountDownController>();
  }

  Timer? _timer;
  int _secondsTotal = 0;
  int _secondsRemaining = 0; // 倒计时10秒

  RxInt countTime = 0.obs;

  RxString showContent = ''.obs;

  RxDouble progressValue = 0.0.obs;

  int mGameProtocolId = 0;

  @override
  void onReady() {
    super.onReady();
    // GlobalController.controller.obsGameStatus.listen((onData){
    //
    // });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer(int countdownEndTime) {
    _secondsRemaining = _secondsTotal;
    // countTime.value = _secondsRemaining;
    progressValue.value = 0;

    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining < 1) {
        // var totalBetCountDown = handleGameStatusModel?.totalBetCountDown ?? 0;
        var serverTime = GlobalController.controller.mServerTime ?? 0;

        timer.cancel();
        _secondsRemaining = 0;
        _secondsTotal = 0;

        countTime.value = 0;
        showContent.value = '0';


        // Future.delayed(const Duration(seconds: 1), () {
        //   countTime.value = -1;
        //   showContent.value = '开牌中';
        // });

        if(serverTime > countdownEndTime) {
          //等待状态
          progressValue.value = 100;
          countTime.value = -2;
        } else {
          // 倒计时结束的操作
          // countTime.value = 0;
        }
      } else {
        showContent.value = _secondsRemaining.toString();

        countTime.value = _secondsRemaining;

        _secondsRemaining--;
        countTime.value = _secondsRemaining;

        progressValue.value = (_secondsTotal - _secondsRemaining) / _secondsTotal;
      }
    });
  }

  updateGameStatusModel(int protocolId,dynamic model) {
    mGameProtocolId = protocolId;
    switch(protocolId) {
      case 401:
        var ws401gameTableDetailModel = model as Ws401GameTableDetailModel;
        var gameStatus = ws401gameTableDetailModel.gameStatus ?? 0;

        if(GameStatus.BET.value == gameStatus) {
          var countdownEndTime = ws401gameTableDetailModel.countdownEndTime ?? 0;
          var serverTime = ws401gameTableDetailModel.serverTime ?? 0;
          _secondsTotal = (countdownEndTime - serverTime)~/1000;
          startTimer(countdownEndTime);
        } else {
          showContent.value = PlayAdapter.convertGameStatusText(gameStatus);

          _timer?.cancel();
          _secondsRemaining = 0;
          _secondsTotal = 0;

          progressValue.value = 0;
          countTime.value = -1;
        }

        break;
      case 104:
        var ws104model = model as Ws104Model;
        var countdownEndTime = ws104model.countdownEndTime ?? 0;
        var serverTime = ws104model.serverTime ?? 0;
        _secondsTotal = (countdownEndTime - serverTime)~/1000;
        startTimer(countdownEndTime);
        break;
      case 103:
      case 113:
      case 160:
      case 107:
      case 112:
      case 207:
        showContent.value = PlayAdapter.convertProtocolIdText(mGameProtocolId);

        _timer?.cancel();
        _secondsRemaining = 0;
        _secondsTotal = 0;

        progressValue.value = 0;
        countTime.value = -1;
        break;
    }
  }
}
