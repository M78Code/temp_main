import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';
import '../../../models/ws/ws_10053_model.dart';

class TableController extends GetxController {
  final flvUrl = ''.obs;
  final WebsocketController  websocketController = WebsocketController.controller;

  static TableController get controller {
    return Get.find<TableController>();
  }

  getFlvUrl() async {
    Ws10053TableModel item = Get.arguments;
    final videoUrl = item.videoUrl ?? '';
    if(videoUrl.isEmpty)return;
    flvUrl.value = await websocketController.getToken(channel: videoUrl);
    LogUtil.log("======>>>>>>>>>>>>>>>>${flvUrl.value}");
  }

  @override
  void onReady() {
    super.onReady();
    LogUtil.log("--TableController--onReady-");
    getFlvUrl();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handPlayPause(bool isPlaying){

  }
}