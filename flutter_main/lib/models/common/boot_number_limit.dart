class BootNumberLimit {
  int? betPointId;
  int? groupId;
  int? bootLimitCount;
  String? playRate;
  int? status;

  BootNumberLimit({
    this.betPointId,
    this.groupId,
    this.bootLimitCount,
    this.playRate,
    this.status,
  });

  factory BootNumberLimit.fromJson(Map<String, dynamic> json) => BootNumberLimit(
    betPointId: json["betPointId"],
    groupId: json["groupId"],
    bootLimitCount: json["bootLimitCount"],
    playRate: json["playRate"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "betPointId": betPointId,
    "groupId": groupId,
    "bootLimitCount": bootLimitCount,
    "playRate": playRate,
    "status": status,
  };
}