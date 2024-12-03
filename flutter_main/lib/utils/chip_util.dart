import 'package:flutter_main/models/chip_model.dart';

class ChipUtil {
  static List<ChipModel>? stringToChipModelList(String? chips, int type) {
    List<ChipModel>? list;

    var defaultChipList = chips?.split(",").map((item) => int.parse(item));
    list = defaultChipList?.map((i) {
      var icon = "assets/images/chips/common_chip_custom.png";
      if (type == 1) {
        icon = "assets/images/chips/common_chip_custom.png";
      } else {
        switch (i) {
          case 1:
            icon = "assets/images/chips/common_chip_1.png";
            break;
          case 5:
            icon = "assets/images/chips/common_chip_5.png";
            break;
          case 10:
            icon = "assets/images/chips/common_chip_10.png";
            break;
          case 20:
            icon = "assets/images/chips/common_chip_20.png";
            break;
          case 50:
            icon = "assets/images/chips/common_chip_50.png";
            break;
          case 100:
            icon = "assets/images/chips/common_chip_100.png";
            break;
          case 200:
            icon = "assets/images/chips/common_chip_200.png";
            break;
          case 500:
            icon = "assets/images/chips/common_chip_500.png";
            break;
          case 1000:
            icon = "assets/images/chips/common_chip_1000.png";
            break;
          case 2000:
            icon = "assets/images/chips/common_chip_2000.png";
            break;
          case 5000:
            icon = "assets/images/chips/common_chip_5000.png";
            break;
          case 10000:
            icon = "assets/images/chips/common_chip_10k.png";
            break;
          case 20000:
            icon = "assets/images/chips/common_chip_20k.png";
            break;
          case 50000:
            icon = "assets/images/chips/common_chip_50k.png";
            break;
          case 100000:
            icon = "assets/images/chips/common_chip_100k.png";
            break;
          case 200000:
            icon = "assets/images/chips/common_chip_200k.png";
            break;
          case 500000:
            icon = "assets/images/chips/common_chip_500k.png";
            break;
          case 1000000:
            icon = "assets/images/chips/common_chip_1m.png";
            break;
          case 2000000:
            icon = "assets/images/chips/common_chip_2m.png";
            break;
          case 5000000:
            icon = "assets/images/chips/common_chip_5m.png";
            break;
        }
      }

      return ChipModel(type: type, icon: icon, parValue: i);
    }).toList();

    return list;
  }

  static ChipModel betAmountToChipModelFly(int betAmount) {
    int type = 0;
    var icon = "assets/images/chips/common_chip_custom_fly.png";
    switch (betAmount) {
      case 1:
        icon = "assets/images/chips/common_chip_fly_1.png";
        break;
      case 5:
        icon = "assets/images/chips/common_chip_fly_5.png";
        break;
      case 10:
        icon = "assets/images/chips/common_chip_fly_10.png";
        break;
      case 20:
        icon = "assets/images/chips/common_chip_fly_20.png";
        break;
      case 50:
        icon = "assets/images/chips/common_chip_fly_50.png";
        break;
      case 100:
        icon = "assets/images/chips/common_chip_fly_100.png";
        break;
      case 200:
        icon = "assets/images/chips/common_chip_fly_200.png";
        break;
      case 500:
        icon = "assets/images/chips/common_chip_fly_500.png";
        break;
      case 1000:
        icon = "assets/images/chips/common_chip_fly_1000.png";
        break;
      case 2000:
        icon = "assets/images/chips/common_chip_fly_2000.png";
        break;
      case 5000:
        icon = "assets/images/chips/common_chip_fly_5000.png";
        break;
      case 10000:
        icon = "assets/images/chips/common_chip_fly_10k.png";
        break;
      case 20000:
        icon = "assets/images/chips/common_chip_fly_20k.png";
        break;
      case 50000:
        icon = "assets/images/chips/common_chip_fly_50k.png";
        break;
      case 100000:
        icon = "assets/images/chips/common_chip_fly_100k.png";
        break;
      case 200000:
        icon = "assets/images/chips/common_chip_fly_200k.png";
        break;
      case 500000:
        icon = "assets/images/chips/common_chip_fly_500k.png";
        break;
      case 1000000:
        icon = "assets/images/chips/common_chip_fly_1m.png";
        break;
      case 2000000:
        icon = "assets/images/chips/common_chip_fly_2m.png";
        break;
      case 5000000:
        icon = "assets/images/chips/common_chip_fly_5m.png";
        break;
      default:
        icon = "assets/images/chips/common_chip_custom_fly.png";
        type = 1;
        break;
    }

    var cm = ChipModel(type: type, icon: icon, parValue: betAmount);

    return cm;
  }
}
