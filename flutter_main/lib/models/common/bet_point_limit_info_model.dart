/// 拼接后的限红和牌靴限制数据
class BetPointLimitInfoModel {
  //玩法组名，
  //需要在10074中先匹配该投注点betPointId，取里面的groupId，
  //再用groupId在10073中匹配gourpID相同的字段的betPointLimit里面betPointGroup字段
  //如果是10021则是betPointLimit列表中的每一个betPointGroup字段
  String? betPointGroup;

  //玩法组ID
  //如果是10074协议取中的bootNumberLimitMap里面MAP的value的list中每一个groupId
  //如果是10021中的"bootNumberLimitMap"每个value里面的groupId
  int? groupId;

  //玩法组ID对应10074中的bootNumberLimitMap里面MAP的value的list中每一个status
  //玩法组ID对应10021中的bootNumberLimitMap里面lvalue的list中每一个status
  //0表示停用，1表示启用
  int? status;

  //限红下限
  //需要在10074中先匹配该投注点betPointId，取里面的groupId，
  //再用groupId在10073中匹配gourpID相同的字段的betPointLimit里面min字段
  //如果是10021则是betPointLimit列表中的每一个min字段
  int? min;

  //限红上限，
  //需要在10074中先匹配该投注点betPointId，取里面的groupId，
  //再用groupId在10073中匹配gourpID相同的字段的betPointLimit里面max段
  //如果是10021则是betPointLimit列表中的每一个max字段
  int? max;

  //下注的牌靴限制，需要多少局才能下注
  //10074中bootLimitCount
  //10021中的"bootNumberLimitMap"每个value里面的betLimitCount
  int? betLimitCount;

  //赔率
  //限红下限对应10074中的betPointLimit里面playRate
  //10021中的"bootNumberLimitMap"每个value里面的playRate
  String? playRate;
}