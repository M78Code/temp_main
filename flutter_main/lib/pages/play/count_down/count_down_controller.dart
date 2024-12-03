import 'dart:async';

import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/models/ws/ws_game_status_model.dart';
import 'package:flutter_main/pages/play/widgets/play_adapter.dart';
import 'package:get/get.dart';

class CountDownController extends GetxController {

  static CountDownController get controller {
    return Get.find<CountDownController>();
  }

  late WsGameStatusModel? handleGameStatusModel;

  Timer? _timer;
  int _secondsTotal = 0;
  int _secondsRemaining = 0; // 倒计时10秒

  RxInt countTime = 0.obs;

  RxString showContent = ''.obs;

  RxDouble progressValue = 0.0.obs;

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

  void startTimer() {
    _secondsRemaining = _secondsTotal;
    // countTime.value = _secondsRemaining;
    progressValue.value = 0;

    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_secondsRemaining < 1) {
        // var totalBetCountDown = handleGameStatusModel?.totalBetCountDown ?? 0;
        var countdownEndTime = handleGameStatusModel?.countdownEndTime ?? 0;
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

  updateHandleGameStatusModel(WsGameStatusModel onData) {

    handleGameStatusModel = onData;

    //
    // if(GameStatus.OPEN.value == gameStatusObs.value) {
    //   ToastUtil.showToast("停止下注");
    // }

    if(104 == handleGameStatusModel?.protocolId) {//下注中-开启倒计时
      // ToastUtil.showToast("开始下注");
      // var totalBetCountDown = handleGameStatusModel?.totalBetCountDown ?? 0;
      var countdownEndTime = handleGameStatusModel?.countdownEndTime ?? 0;
      var serverTime = handleGameStatusModel?.serverTime ?? 0;
      // if(serverTime > countdownEndTime) {
      //   //等待状态
      //   countTime.value = -2;
      // }
      _secondsTotal = (countdownEndTime - serverTime)~/1000;
      startTimer();
    } else {
      showContent.value = PlayAdapter.convertGameStatusText(handleGameStatusModel?.protocolId ?? 0);

      _timer?.cancel();
      _secondsRemaining = 0;
      _secondsTotal = 0;

      progressValue.value = 0;
      countTime.value = -1;
    }
  }



}
