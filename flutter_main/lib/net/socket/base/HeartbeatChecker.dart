import 'dart:async';
import 'package:flutter_main/net/socket/base/Config.dart';

abstract class IHeartbeatListener {
  void onTickPing();
  void onTickPong();
}

class HeartbeatChecker {
  late IHeartbeatListener listener;
  late Timer pingTimerId;

  HeartbeatChecker(this.listener) {
    start();
  }

  void start() {
    pingTimerId = Timer.periodic(
        const Duration(milliseconds: SOCKET_PING_INTERVAL), (timer) {
      listener.onTickPing();
      Timer(const Duration(milliseconds: SOCKET_PING_PONG_TIMEOUT), () {
        listener.onTickPong();
      });
    });
  }

  void stop() {
    pingTimerId.cancel();
  }
}
