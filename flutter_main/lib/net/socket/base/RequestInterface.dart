import 'package:flutter_main/net/socket/base/Enum.dart';

class LoginReq {
  /// 玩家token
  String jwtToken;

  LoginReq({required this.jwtToken});
}

class HeartbeatReq {
  int clientTime;

  HeartbeatReq({required this.clientTime});
}

class LobbyGameMapperReq {
  int labelTypeId;
  int playerId;
  int gameCasinoId;

  LobbyGameMapperReq({
    required this.labelTypeId,
    required this.playerId,
    required this.gameCasinoId,
  });
}

class GroupRoomMapperReq {
  GameCasinoType gameCasinoId; // 游戏厅类型，用于指定查询的游戏厅
  int groupId; // 分组ID，用于在多个游戏分组中筛选
  int labelType; // 标签类型，根据是否是HV客户端决定值为2或1
  List<GameType>
      gameLabelList; // 游戏标签列表，枚举类型对应ChangeTableLabelNewEnum，用于进一步筛选游戏
  int playerId; // 玩家ID，用于标识请求的玩家
  int sort; // 排序方式，0为默认排序，1为好路排序
  int pageNum; // 请求的页码，用于分页显示结果
  int pageSize; // 每页显示的数据数量，用于分页控制
  int isAll; // 是否查询全部游戏，0为否，1为是，用于控制是否限制查询结果的数量
  List<int> gameTypeIds; // 游戏类型ID列表，用于筛选特定类型的游戏

  GroupRoomMapperReq({
    required this.gameCasinoId,
    required this.groupId,
    required this.labelType,
    required this.gameLabelList,
    required this.playerId,
    required this.sort,
    required this.pageNum,
    required this.pageSize,
    required this.isAll,
    required this.gameTypeIds,
  });
}
