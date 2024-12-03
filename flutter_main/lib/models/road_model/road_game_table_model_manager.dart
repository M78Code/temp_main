

class RoadGameTableModelManager {
  /// 游戏内部路子
  Map<String, dynamic> gameRoads = {};


  // 单例模式
  static final RoadGameTableModelManager _instance =
  RoadGameTableModelManager._internal();

  factory RoadGameTableModelManager() {
    return _instance;
  }

  RoadGameTableModelManager._internal();



}