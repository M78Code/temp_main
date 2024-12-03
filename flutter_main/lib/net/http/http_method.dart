/// Http类型
enum HttpMethod {
  get(value: "GET"),
  post(value: "POST"),
  postFormData(value: "POST"),;

  const HttpMethod({
    required this.value,
  });

  /// Dio的Option结果中需要method值
  final String value;
}