import 'package:flutter/cupertino.dart';
import 'package:flutter_main/utils/RoadPaper/Tool/RoadPaperSingleResultToStringTool_Baccarat.dart';
import 'package:flutter_main/utils/log_util.dart';
import 'package:get/get.dart';

import '../../../controllers/websocket_controller.dart';
import '../../../models/chip_model.dart';
import '../../../utils/chip_util.dart';
import '../../../utils/event_bus_util.dart';

class ChipAreaController extends GetxController {


  static ChipAreaController get controller {
    return Get.find<ChipAreaController>();
  }
  final WebsocketController websocketController =
      WebsocketController.controller;

  ScrollController scrollController = ScrollController();
  double scrollOffset = 0;
  List<ChipModel> selectedChipList = [
    //common_pz_chip1
    ChipModel(
        type: 3,
        icon: "assets/images/chips/common_chip_custom.png",
        parValue: 0),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_1.png", parValue: 1),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_5.png", parValue: 5),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_10.png", parValue: 10),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_20.png", parValue: 20),
    ChipModel(
        type: 0, icon: "assets/images/chips/common_chip_50.png", parValue: 50),
  ];

  ChipModel? _selectedChipModel;

  ChipModel? get selectedChipModel => _selectedChipModel;

  onSelectedChipValue(int index) {
    // var nowChip = selectedChipList[index];
    var newList = selectedChipList.asMap().entries.map((item) {
      if (item.key == index) {
        item.value.selected = true;
        _selectedChipModel = item.value;
      } else {
        item.value.selected = false;
      }
      return item.value;
    }).toList();
    selectedChipList = newList;
    update();
  }

  String? defaultChip;
  String? selfEditChips;

  @override
  void onInit() {
    super.onInit();
    _initOnEventBus();
    _initHandleChip();
  }

  _initOnEventBus() {
    EventBusUtil.getInstance().on<ChipModelListEvent>().listen((event) {
      var defaultChipList = event.defaultChipList;
      var selfEditChipList = event.selfEditChipList;
      var fList = selectedChipList.where((item) => item.type == 3).toList();
      if (defaultChipList?.isNotEmpty ?? false) {
        fList.addAll(defaultChipList ?? []);
        defaultChip = defaultChipList?.map((item) => item.parValue).join(",");
      }
      if (selfEditChipList?.isNotEmpty ?? false) {
        fList.addAll(selfEditChipList ?? []);
        selfEditChips =
            selfEditChipList?.map((item) => item.parValue).join(",");
      }
      selectedChipList = fList;
      update();
    });
  }

  _initHandleChip() {
    var selectedChip =
        websocketController.mWs10000Model.value.data?.selectedChip;
    var defaultChip = websocketController.mWs10000Model.value.data?.defaultChip;
    var selfEditChips =
        websocketController.mWs10000Model.value.data?.selfEditChips;
    this.defaultChip = defaultChip;
    this.selfEditChips = selfEditChips;
    LogUtil.log("ChipAreaController $selectedChip $defaultChip $selfEditChips");
    var fList = selectedChipList.where((item) => item.type == 3).toList();
    List<ChipModel> mylist = [];
    List<ChipModel> defaultChipList =
        ChipUtil.stringToChipModelList(defaultChip, 0) ?? [];
    List<ChipModel> selfEditChipsList =
        ChipUtil.stringToChipModelList(selfEditChips, 1) ?? [];
    mylist.addAll(defaultChipList);
    mylist.addAll(selfEditChipsList);

    if (mylist.isNotEmpty) {
      // mylist.sort((a, b) => ((a.parValue) ?? 0).compareTo(b.parValue ?? 0));

      LogUtil.log("ChipAreaController ${selectedChipList.length}");
      if (selectedChip?.isNotEmpty ?? false) {
        var mys = int.parse(selectedChip ?? "0");
        mylist.forEach((item) {
          if (item.parValue == mys) {
            item.selected = true;
            _selectedChipModel = item;
          }
        });
      }
      fList.addAll(mylist);
      selectedChipList = fList;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
