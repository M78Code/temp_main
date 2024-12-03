import 'package:flutter_main/net/http/http.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/base/HttpApi.dart';

import 'Config.dart';
import 'UrlManager.dart';

class ConfigManager {
  // http服务器地址
  static String? _httpServer;
  static String? _wssServer;
  static String? _ip;
  static List<String> _keyIds = [];
  static String? _version;
  static dynamic _loadingConfig;

  static Future<void> initialize(backendDomainUrl) async {
    // final backendDomainUrl = UrlManager.getDecodeParams();

    _httpServer = 'https://gateway.$backendDomainUrl/game-http';
    _wssServer = 'wss://wsproxy.$backendDomainUrl';

    // _ip = await HttpApi.getIp();
    _ip = await HttpUtil.getIp();
    _keyIds = initKeyIds();
    _version = initVersion();
    _loadingConfig = await HttpApi.getLoadConfig();
  }

  static String get socketServer => _wssServer!;

  static String get httpServer => _httpServer!;

  static String get ip => _ip!;

  static String get version => _version!;

  static String getKeyId(bool isGameHttp) {
    return isGameHttp ? _keyIds[0] : _keyIds[1];
  }

  static String getApplication(bool isGameHttp) {
    final list = ["game_http", "activity_http"];
    return isGameHttp ? list[0] : list[1];
  }

  static List<String> initKeyIds() {
    final keyMap = {
      GAME_ENV.dev: ["tesbmb8fg38o7g5s", "tes9ljkoh0jqrrht"],
      GAME_ENV.test: ["tesbmb8fg38o7g5s", "tes9ljkoh0jqrrht"],
      GAME_ENV.test2: ["tesbmb8fg38o7g5s", "tes9ljkoh0jqrrht"],
      GAME_ENV.training: ["tesbmb8fg38o7g5s", "tes9ljkoh0jqrrht"],
      GAME_ENV.prerelease: ["preaacciqkhtg26b", "preak471h5p7tgqp"],
      GAME_ENV.release: ["probinpjms7rfm26", "pro9th36v4m70i6s"],
    };
    return keyMap[ENV]!;
  }

  static String initVersion() {
    final keyMap = {
      GAME_ENV.dev: "1.0.4",
      GAME_ENV.test: "1.0.4",
      GAME_ENV.test2: "1.0.4",
      GAME_ENV.training: "1.0.4",
      GAME_ENV.prerelease: "1.2.2",
      GAME_ENV.release: "1.2.2",
    };
    return keyMap[ENV]!;
  }
}
