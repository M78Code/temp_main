class Ws114Model {
  int? tableId;
  String? dealerName;
  int? dealerId;
  int? dealerLogin;
  String? dealerCountry;
  DealerNameLanguageMap? dealerNameLanguageMap;
  int? receiveTime;

  Ws114Model({
    this.tableId,
    this.dealerName,
    this.dealerId,
    this.dealerLogin,
    this.dealerCountry,
    this.dealerNameLanguageMap,
    this.receiveTime,
  });

  factory Ws114Model.fromJson(Map<String, dynamic> json) => Ws114Model(
        tableId: json["tableId"],
        dealerName: json["dealerName"],
        dealerId: json["dealerId"],
        dealerLogin: json["dealerLogin"],
        dealerCountry: json["dealerCountry"],
        dealerNameLanguageMap: json["dealerNameLanguageMap"] == null
            ? null
            : DealerNameLanguageMap.fromJson(json["dealerNameLanguageMap"]),
        receiveTime: json["receiveTime"],
      );

  Map<String, dynamic> toJson() => {
        "tableId": tableId,
        "dealerName": dealerName,
        "dealerId": dealerId,
        "dealerLogin": dealerLogin,
        "dealerCountry": dealerCountry,
        "dealerNameLanguageMap": dealerNameLanguageMap?.toJson(),
        "receiveTime": receiveTime,
      };
}

class DealerNameLanguageMap {
  Cn? cn;
  Cn? tc;

  DealerNameLanguageMap({
    this.cn,
    this.tc,
  });

  factory DealerNameLanguageMap.fromJson(Map<String, dynamic> json) =>
      DealerNameLanguageMap(
        cn: json["cn"] == null ? null : Cn.fromJson(json["cn"]),
        tc: json["tc"] == null ? null : Cn.fromJson(json["tc"]),
      );

  Map<String, dynamic> toJson() => {
        "cn": cn?.toJson(),
        "tc": tc?.toJson(),
      };
}

class Cn {
  String? languageCode;
  String? content;

  Cn({
    this.languageCode,
    this.content,
  });

  factory Cn.fromJson(Map<String, dynamic> json) => Cn(
        languageCode: json["languageCode"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "languageCode": languageCode,
        "content": content,
      };
}
