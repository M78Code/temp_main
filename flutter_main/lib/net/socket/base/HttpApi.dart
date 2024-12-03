import 'dart:convert';
import 'package:flutter_main/net/http/http_manager.dart';
import 'package:flutter_main/net/http/http_method.dart';
import 'package:flutter_main/net/socket/base/ConfigManager.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static Future<Map<String, dynamic>> requestJSON({
    required String method,
    required String url,
    Map<String, dynamic>? data,
    bool isCrypto = false,
  }) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri); // Assuming GET method for simplicity
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } finally {
        if (response.body != null) {
          final body = response.body;
          return jsonDecode('{"ip": "$body"}');
        } else
          throw Exception('Failed to load data');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class HttpApi {
  static Future<String> getIp() async {
    final response = await HttpRequest.requestJSON(
      method: "GET",
      url: "https://api.ipify.org",
      data: {
        "format": "json",
      },
      isCrypto: false,
    );
    final ip = response['ip'];
    return ip;
  }

  static Future<dynamic> getLoadConfig() async {
    // final url = ConfigManager.httpServer;
    // final data = await HttpRequest.requestJSON(
    //   method: "GET",
    //   url: '$url/loadConfig/list?deviceType=1&platformType=1',
    //   data: {
    //     "deviceType": DeviceTypeEnum.MOBILE.toString(),
    //     "platformType": "1",
    //   },
    //   isCrypto: true,
    // );
    // return data;

    final data = await HttpManager().doRequest(
        'game-http/loadConfig/list', HttpMethod.get,
        parameters: {'deviceType': 1, 'platformType': 1},
        isShowLoading: true,
        isShowToast: true);
    return data;
  }
}
