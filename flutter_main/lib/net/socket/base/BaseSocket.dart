import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_main/net/socket/base/URLManager.dart';
import 'package:flutter_main/net/socket/crypto/SocketRequest.dart';
import 'package:flutter_main/net/socket/crypto/SocketResponse.dart';
import 'package:flutter_main/utils/jsCall.dart';
import 'package:web_socket_channel/io.dart';

import 'ColorLog.dart';
import 'Config.dart';
import 'ConfigManager.dart';
import 'CryptoUnit.dart';
import 'Enum.dart';
import 'HeartbeatChecker.dart';
import 'LocalStorageManager.dart';
import 'Singleton.dart';

abstract class ISocketHandler {
  void onGameProtobuf(SocketResponse res);
}

class BaseSocket extends Singleton implements IHeartbeatListener {
  IOWebSocketChannel? socket;
  HeartbeatChecker? heartbeatChecker;

  int lastPongTimestamp = 0;
  bool isForce = false;
  String? url;
  List<SocketType> asyncTypes = [];
  bool isLogin = false;

  // void registerHandler(ISocketHandler handler);
  // void sendPingPong();
  // void onClosed(bool isForce);
  // void onOpened();
  // void onReconnect();
  // void onTimeout();
  // void onBroadcastData(Uint8List data);

  // dart
  var connecting = false; //websocket连接状态

  BaseSocket() {
    final baseUrl =
        '${ConfigManager.socketServer}/?playerId=${UrlManager.playerId}&deviceId=${LocalStorageManager.deviceId}&jwtToken=${UrlManager.token}';

    final length = baseUrl.split("?")[1].length * 323;
    final fullUrl =
        '$baseUrl&platformId=1&applicationId=7&version=$GAME_VERSION_CODE&l=$length&ext=${CryptoUnit.ipToInt(ConfigManager.ip)}';
    url = fullUrl;
  }

  Future<void> initialize() async {
    final completer = Completer<void>();
    final url = this.url;
    IOWebSocketChannel socket = IOWebSocketChannel.connect(url!);
    // socket.binaryType = 'arraybuffer';
    print('[BaseSocket] $url: new socket');

    socket.stream.listen((data) => listenMessage(data),
        onError: onError, onDone: onDone);
    // Timer(const Duration(milliseconds: SOCKET_CONNECTION_TIMEOUT), () {
    //   if (socket.readyState == WebSocket.CLOSED) {
    //     return;
    //   }
    //   if (socket.readyState != WebSocket.OPEN) {
    //     print('[BaseSocket] $url: connection timeout');
    //     onTimeout();
    //   }
    // });

    // socket.onOpen.listen((event) {
    //   print('[BaseSocket] $url: onOpen, event = ${jsonEncode(event)}');
    //   isForce = false;
    //   isLogin = false;
    //   heartbeatChecker = HeartbeatChecker(this);
    //   lastPongTimestamp = DateTime.now().millisecondsSinceEpoch;
    //   completer.complete();
    //   onOpened();
    // });

    // socket.onClose.listen((event) {
    //   print('[BaseSocket] $url: onClose, event = ${jsonEncode(event)}');
    //   onClosed(isForce);
    // });

    // socket.onError.listen((event) {
    //   print('[BaseSocket] $url: onerror, event = ${jsonEncode(event)}');
    //   onError(event);
    // });

    // socket.onMessage.listen((messageEvent) {
    //   lastPongTimestamp = DateTime.now().millisecondsSinceEpoch;
    //   onBroadcastData(messageEvent.data);
    // });

    this.socket = socket;
    return completer.future;
  }

  void listenMessage(data) async {
    connecting = true;
    final text = await executeJS(
        'DataHandle', 'decryptWsData', [data, '"C772D621A98B3C38"']);

    print(json.decode(json.decode(text).jsonData).data);
  }

  void onError(error) {
    print('error------------>${error}');
  }

  void onDone() {
    print('websocket断开了');
    initialize();
    print('websocket重连');
  }

  void sendReq(SocketRequest reqVo) {
    GameColLog.logSendServerData(reqVo.typeString, reqVo.toJsonData());
    if (socket == null) {
      throw Exception('[BaseSocket] socket is null');
    }
    socket?.sink.add(reqVo.buffer);
  }

  // Future<SocketResponse> sendReqAsync(SocketRequest request, int waitType,
  //     [int timeout = 10000]) async {
  //   final completer = Completer<SocketResponse>();
  //   int timer = 0;
  //   GameColLog.logSendServerData(
  //       '${request.typeString}(async)', request.toJSON());

  //   void onData(Event event) {
  //     final res = SocketResponse(event.path as Uint8List);
  //     if (res.type == waitType) {
  //       GameColLog.logServerData('${res.typeString}(async)', res.toJSON());
  //       completer.complete(res);

  //       Timer(Duration(milliseconds: timer), () {});
  //       socket!.removeEventListener('message', onData);
  //     }
  //   }

  //   void onError(Event event) {
  //     completer.completeError(event);

  //     Timer(Duration(milliseconds: timer), () {});
  //     socket!.removeEventListener('error', onData);
  //   }

  //   void onClose(Event event) {
  //     completer.completeError(event);

  //     Timer(Duration(milliseconds: timer), () {});
  //     socket!.removeEventListener('close', onData);
  //   }

  //   socket!.addEventListener('message', onData);
  //   socket!.addEventListener('error', onError);
  //   socket!.addEventListener('close', onClose);

  //   timer = setTimeout(() {
  //     Timer(Duration(milliseconds: timer), () {});
  //     socket!.removeEventListener('message', onData);
  //     socket!.removeEventListener('error', onData);
  //     socket!.removeEventListener('close', onData);

  //     completer.completeError(Exception('Timeout'));
  //   }, timeout);

  //   if (socket!.readyState == WebSocket.OPEN) {
  //     asyncTypes.add(waitType as SocketType);
  //     socket!.send(request.buffer);
  //   }

  //   return completer.future;
  // }

  // void reconnect() {
  //   if (socket == null || socket!.readyState == WebSocket.CONNECTING) {
  //     print('當前Socket為空的不允許進行重新連線');
  //     return;
  //   }

  //   print('[BaseSocket] reconnect');
  //   onReconnect();
  // }

  // void close() {
  //   print('[BaseSocket] close');
  //   isForce = true;
  //   socket!.close();
  //   heartbeatChecker!.stop();
  // }

  @override
  void onTickPing() {
    // if (socket!.readyState == WebSocket.CLOSED) {
    //   return;
    // }

    if (!isLogin) {
      return;
    }
    // sendPingPong();
  }

  @override
  void onTickPong() {
    // if (socket!.readyState == WebSocket.CLOSED) {
    //   return;
    // }

    final elapsed = DateTime.now().millisecondsSinceEpoch - lastPongTimestamp;
    if (elapsed > SOCKET_PING_PONG_TIMEOUT) {
      // onTimeout();
    }
  }
}
