import 'package:flutter_main/configs/good_road_images_loader.dart';

enum OddsType {
  xian(type: 'xian'),
  he(type: 'he'),
  zhuang01(type: 'zhuang01'),
  zhuang02(type: 'zhuang02');

  const OddsType({ required this.type });

  final String type;

  String get oddsImgUrl => GoodRoadImagesLoader.oddsWith(type: type);
  String get bettingImgUrl {
    if (this == OddsType.zhuang01 || this == OddsType.zhuang02) {
      return GoodRoadImagesLoader.bettingStatusWith('zhuang');
    }
    return GoodRoadImagesLoader.bettingStatusWith(type);
  }

  int get betPointId {
    switch (this) {
      case OddsType.xian:
        return 3002;
      case OddsType.he:
        return 3003;
      case OddsType.zhuang01:
        return 3001;
      case OddsType.zhuang02:
        return 3001;
    }
  }
}

const Map<int, String> gameStatus = {
  0: '准备中',
  1: '洗牌中',
  2: '下注中',
  3: '开牌中',
  4: '结算中',
  6: '维护中'
};
