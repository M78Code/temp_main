class WsBaseRequest {
  final int? playerId;
  // c端设备类型	integer(int32)	TRUE	1=网页，2=手机网页，3=Ios，4=Android，5=其他设备，6=无
  final int? clientDeviceType;
  // 用户设备Id	String	TRUE	取用户设备ID
  final String? deviceId;
  // 用户设备类型	String	TRUE	1-网页，2-手机网页，3-Ios，4-Android，5-其他设备，6-未知
  final int? deviceType;

  const WsBaseRequest({
    this.playerId,
    this.clientDeviceType,
    this.deviceId,
    this.deviceType,
  });
}