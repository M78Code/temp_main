import 'package:flutter_main/net/socket/base/Enum.dart';

// ignore: constant_identifier_names
const String GAME_VERSION_CODE = "v1.0.5";
// ignore: constant_identifier_names
const GAME_ENV ENV = GAME_ENV.dev;
// ignore: constant_identifier_names
const bool PC = true;

// ------ socket
// ignore: constant_identifier_names
const String CRYPTO_KEY = "C772D621A98B3C38";
// ignore: constant_identifier_names
const int SOCKET_CONNECTION_TIMEOUT = 5000;
// ignore: constant_identifier_names
const int SOCKET_PING_INTERVAL = 10000;
// ignore: constant_identifier_names
const int SOCKET_PING_PONG_TIMEOUT = 2000;

// ------ system
// ignore: constant_identifier_names
const int DEFAULT_WIDTH = 1280;
// ignore: constant_identifier_names
const int DEFAULT_HEIGHT = 720;
// ignore: constant_identifier_names
const double MAX_ASPECT_RATIO = 3.16; // 2280/720
// ignore: constant_identifier_names
const double MIN_ASPECT_RATIO = 1.78; // 1280/720

// ------ 未知
// ignore: constant_identifier_names
const int TABLE_ID = 0;
// ignore: non_constant_identifier_names
final GROUP_TYPE_MAPPER = {
  GroupType.CLASSIC_BACCARAT: GameType.ALL_BACCARAT,
  GroupType.WESTERN_GAME: GameType.ALL_EUROPE_AMERICA,
  GroupType.ASIA_GAME: GameType.ALL_ASIA,
  GroupType.FEATURE_BACCARAT: GameType.ALL_FBACCARAT,
  GroupType.LIVE_GAME: GameType.ALL_LIVEGAME,
};
