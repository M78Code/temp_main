/// brandType : 0
/// jwtToken : ""
/// playerId : 0
/// sid : ""

class LoginModel {
  LoginModel({
      this.brandType, 
      this.jwtToken, 
      this.playerId, 
      this.sid,});

  LoginModel.fromJson(dynamic json) {
    brandType = json['brandType'];
    jwtToken = json['jwtToken'];
    playerId = json['playerId'];
    sid = json['sid'];
  }
  num? brandType;
  String? jwtToken;
  num? playerId;
  String? sid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brandType'] = brandType;
    map['jwtToken'] = jwtToken;
    map['playerId'] = playerId;
    map['sid'] = sid;
    return map;
  }

}