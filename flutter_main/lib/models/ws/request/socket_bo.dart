/// WebSocket 请求参数 公共类
class SocketBo {
  /// ws 10074
  List<int>? gameTypeIds;

  /// ws 10073
  List<int>? tableIds;

  /// ws 10084
  List<int>? tableIdList;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> requestMap = {};

    if (gameTypeIds != null) {
      requestMap['gameTypeIds'] = gameTypeIds;
    }
    if (tableIds != null) {
      requestMap['tableIds'] = tableIds;
    }
    if (tableIdList != null) {
      requestMap['tableIdList'] = tableIdList;
    }
    return requestMap;
  }
}