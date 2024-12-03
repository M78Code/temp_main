import 'package:get/get.dart';

class BettingRecordsController extends GetxController {

  final listItemExpandStatus = <int, bool>{};

  bool listItemExpandWith({ required int index }) => listItemExpandStatus[index] ?? false;

  void toggleListItemExpandWith({ required int index }) {
    bool isExpand = listItemExpandStatus[index] ?? false;
    listItemExpandStatus[index] = !isExpand;
    update();
  }
}