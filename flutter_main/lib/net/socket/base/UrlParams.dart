// ignore: file_names
class UrlParams {
  late String qs;
  late Map<String, String> params;

  UrlParams(String search) {
    qs = search.substring(0);
    params = {};
    parseQuerystring();
  }

  void parseQuerystring() {
    qs.split("&").forEach((b) {
      final parts = b.split("=");
      final key = parts[0];
      parts.removeAt(0);
      params[key] = parts.join('=');
    });
  }

  String? get(String key) {
    return params[key];
  }
}
