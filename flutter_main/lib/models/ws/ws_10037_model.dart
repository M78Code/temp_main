class Ws10037Model {
  int? playerId;
  double? balance;
  String? currencyCode;

  Ws10037Model({
    this.playerId,
    this.balance,
    this.currencyCode,
  });

  factory Ws10037Model.fromJson(Map<String, dynamic> json) => Ws10037Model(
        playerId: json["playerId"],
        balance: json["balance"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "playerId": playerId,
        "balance": balance,
        "currencyCode": currencyCode,
      };
}
