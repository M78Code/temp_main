import 'package:get/get.dart';

import '../../../../models/ws/ws_401_model.dart';

class Roulette100DialogController extends GetxController {
  // var roulette100 = RouletteStatisticsCache().obs;

  final List<RoulletteText> textList = [
    RoulletteText(text: '12', isRed: true),
    RoulletteText(text: '35', isRed: false),
    RoulletteText(text: '3', isRed: true),
    RoulletteText(text: '26', isRed: false),
    RoulletteText(text: '0', isRed: false), // 绿色
    RoulletteText(text: '32', isRed: true),
    RoulletteText(text: '15', isRed: false),
    RoulletteText(text: '19', isRed: true),
    RoulletteText(text: '4', isRed: false),
    RoulletteText(text: '21', isRed: true),
    RoulletteText(text: '2', isRed: false),
    RoulletteText(text: '25', isRed: true),
    RoulletteText(text: '17', isRed: false),
    RoulletteText(text: '34', isRed: true),
    RoulletteText(text: '6', isRed: false),
    RoulletteText(text: '27', isRed: true),
    RoulletteText(text: '13', isRed: false),
    RoulletteText(text: '36', isRed: true),
    RoulletteText(text: '11', isRed: false),
    RoulletteText(text: '30', isRed: true),
    RoulletteText(text: '8', isRed: false),
    RoulletteText(text: '23', isRed: true),
    RoulletteText(text: '10', isRed: false),
    RoulletteText(text: '5', isRed: true),
    RoulletteText(text: '24', isRed: false),
    RoulletteText(text: '16', isRed: true),
    RoulletteText(text: '33', isRed: false),
    RoulletteText(text: '1', isRed: true),
    RoulletteText(text: '20', isRed: false),
    RoulletteText(text: '14', isRed: true),
    RoulletteText(text: '31', isRed: false),
    RoulletteText(text: '9', isRed: true),
    RoulletteText(text: '22', isRed: false),
    RoulletteText(text: '18', isRed: true),
    RoulletteText(text: '29', isRed: false),
    RoulletteText(text: '7', isRed: true),
    RoulletteText(text: '28', isRed: false),
  ];

  List<RoulletteText> textSList = [];
  List<RoulletteText> textJList = [];

  @override
  void onReady() {}

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initBaseData(RouletteStatisticsCache roulette100) {
    final keyV = roulette100.getRecords();
    for (RoulletteText ele in textList) {
      ele.proportion = keyV[ele.text ?? ''] * 1.0;
    }

    final sList = textList.toList()
      ..sort((a, b) => a.proportion!.compareTo(b.proportion ?? 0));
    textSList = sList;

    final jList = textList.toList()
      ..sort((a, b) => b.proportion!.compareTo(a.proportion ?? 0));
    textJList = jList;

    // 以最大值 为填充满来计算， 最小值为1/15(0除外)
    const min = 1 / 15;
    final max = jList.first.proportion ?? 0;
    for (RoulletteText ele in textList) {
      double value = (ele.proportion ?? 0) / max;
      if (value < min && value != 0) value = min;
      ele.proportion = value;
    }
  }
}

class RoulletteText {
  String? text;
  bool? isRed;
  double? proportion;

  RoulletteText({this.text, this.isRed, this.proportion});
}
