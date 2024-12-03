/// HTTP 请求参数 公共类
class RequestBo {
  /// 商户id
  int? agentId;

  /// 限红id
  int? betLimitId;

  /// 投注状态 0禁止投注 1可以投注
  int? betStatus;

  /// 玩家类型：0、试玩 1、正式 2、内部测试 3、机器人
  int? category;

  /// 登陆ip的归属地
  String? city;

  /// 币种 CNY人民币KRW韩元MYR马来西亚币USD美元JPY日元THB泰铢BTC比特币IDR印尼盾VND越南盾EUR欧元INR印度卢比
  String? currency;

  /// 创建设备(1=网页，2=手机网页，3=Ios，4=Android，5=其他设备，与GameEnumConstant.Enum_DeviceType 对应)
  String? device;

  /// 设备id
  String? deviceId;

  /// 头像
  String? headPic;

  /// 登录ip
  String? ip;

  /// 1中文简体 2中文繁体 3英文
  int? language;

  /// 登录账号
  String? loginName;

  /// 设备型号，字符串类型，如:iphone6、华为Mate30
  String? model;

  /// 昵称
  String? nickName;

  /// 登录密码
  String? password;

  /// loginPassword
  String? loginPassword;

  /// 备注
  String? remark;

  /// 登录密码
  String? secret;

  /// 创建方式（0.其它 1.代理网 2.现金网）
  int? source;

  /// 玩家状态（0.启用 1.停用 ）
  int? status;

  /// backurl
  String? backurl;

  /// 3代表横竖 1代表pc
  int? deviceType;

  /// playerId
  int? playerId;

  /// playerId
  int? clientDeviceType;

  Map<String, dynamic> toMap(){
    Map<String, dynamic> requestMap = {};
    if (agentId != null) {
      requestMap['agentId'] = agentId;
    }
    if (betLimitId != null) {
      requestMap['betLimitId'] = betLimitId;
    }
    if (betStatus != null) {
      requestMap['betStatus'] = betStatus;
    }
    if (category != null) {
      requestMap['category'] = category;
    }
    if (city != null) {
      requestMap['city'] = city;
    }
    if (currency != null) {
      requestMap['currency'] = currency;
    }
    if (device != null) {
      requestMap['device'] = device;
    }
    if (deviceId != null) {
      requestMap['deviceId'] = deviceId;
    }
    if (headPic != null) {
      requestMap['headPic'] = headPic;
    }
    if (ip != null) {
      requestMap['ip'] = ip;
    }
    if (language != null) {
      requestMap['language'] = language;
    }
    if (loginName != null) {
      requestMap['loginName'] = loginName;
    }
    if (model != null) {
      requestMap['model'] = model;
    }
    if (nickName != null) {
      requestMap['nickName'] = nickName;
    }
    if (password != null) {
      requestMap['password'] = password;
    }
    if (loginPassword != null) {
      requestMap['loginPassword'] = loginPassword;
    }
    if (remark != null) {
      requestMap['remark'] = remark;
    }
    if (secret != null) {
      requestMap['secret'] = secret;
    }
    if (source != null) {
      requestMap['source'] = source;
    }
    if (status != null) {
      requestMap['status'] = status;
    }
    if (backurl != null) {
      requestMap['backurl'] = backurl;
    }
    if (deviceType != null) {
      requestMap['deviceType'] = deviceType;
    }
    if (playerId != null) {
      requestMap['playerId'] = playerId;
    }
    if (clientDeviceType != null) {
      requestMap['clientDeviceType'] = clientDeviceType;
    }

    return requestMap;
  }
}