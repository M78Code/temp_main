import 'dart:convert';
import 'package:flutter_main/net/socket/base/BaseSocket.dart';
import 'package:flutter_main/net/socket/base/ColorLog.dart';
import 'package:flutter_main/net/socket/base/Config.dart';
import 'package:flutter_main/net/socket/base/ConfigManager.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/net/socket/base/LocalStorageManager.dart';
import 'package:flutter_main/net/socket/base/RequestInterface.dart';
import 'package:flutter_main/net/socket/base/URLManager.dart';
import 'package:flutter_main/net/socket/crypto/SocketRequest.dart';
import 'package:flutter_main/net/socket/crypto/SocketResponse.dart';
import 'package:flutter_main/utils/jsCall.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketProvide with ChangeNotifier {
  var historyMessage = []; //接收到哦的所有的历史消息
  // var messageList = []; // 所有消息页面人员
  // var currentMessageList = []; //选择进入详情页的消息历史记录
  var connecting = false; //websocket连接状态
  late IOWebSocketChannel channel;
  String? url;
  late Map<String, dynamic> processData;
  late IRequestJsonData jsonData;
  // late SocketType socketType;
  late IRequestData encodeData;
  late String buffer;
  late BaseSocket baseSocket;

  // 处理器
  ISocketHandler? handler;

  @override
  void onClosed(bool isForce) {}

  @override
  void onOpened() {}
  @override
  void onReconnect() {}
  @override
  void onTimeout() {}

  @override
  void registerHandler(ISocketHandler handler) {
    this.handler = handler;
  }

  init(String pcLoginBackUrl) async {
    // String pcLoginBackUrl =
    // //     'https://pc.dpzrfat6.com/?params=oMrjPLBQnnNLfPepXh3+JwTuGrnOhUKs4uu2E170hCWyrHEb/IcGZclzCA2XRlQDw7QPczIhhF3HH0dr5vNPXMNcrNXPviw/1OjeKQIuO88D2Q1eNdXxAr9Xuo+0mKT6WvH1kMWdcf6Wif1Nci6gWUFqKl3mqbwT9QMGp9d8857MlLW9pCJY81wA0f0ePfH6wo3RRbdwIp+9ycnyIl/o0MS9fSPgGTGB4fNsQyE1NOOYwssdWiqRDLveg87uBJt6mDTHjksGbu43mTTuwV6s/27MxdEk/WW3hT6gGmSLOOyr1THYJ2d4WokAJxYJy9tXS3hHBj3aA3bbGTUO0YtuPhWnmwbSiIHJzbnYEKiE8BO5QJqqLv6/ybD3ShTwd8LCgtNcNLvQKzaiXF9eJrfGiFaujN+4Hpwusc/9k60fYHzBHlY/qf22DbIhj+aFs30kHEE3UMB6+AKXDbOcEk8CdW/elz8on/+h7RK2hmNJlF+smmMr52dvNXCTKFwqZnsVD2NIDa0gCMZM5tCp9/5/71CkcPM5It6ltGMu7uU7J9bWIwq/VpupfMd6DRHPsY4ZcSpkhczqbHdHVL8j6AFCzac1e2sNdvNstAM5U8VT6jTXQ+6VFbzWpyFQbHbpC61/PuUPFrSkGDuRB7SZY5/J7+L0bqBaAZeaZKASzbr44AY1VFLq9pviSrT3ZhIztqET1OZuMvKoextxl3dDrl7aawLHj6cNL0ulz0Rw0N6nCqlYq3zyhNrgUnmistWGCpQri1CgA50ESZrwk2m7Hzkx9PNqO4D/7bXKSQNOU7PzDn8pqBIleyP8ivwzkzc0Vg2+6yW6NjFxN0uzIIsePCl6IBuOgZaHLxWAEhbsZrdojjM8VhvbCh2fzufVVmipcRg6kNcI6H13YifeW7kmTprk+50H76ptluYW5JhSPpusmeLvto8KMYR+lVnTyuXb8oTujQk9ohglCptHKNaJNIl/F+5GE6DTbotnxQqsH4WPEhWZ93n7V12LcUyB2fgwMdxSSm7XKDAm//Rz1p9WsED/Vwmy+WVplAyT+b0BFZX7fp3rfl+BUGLAPTGw+GYZwA3Zbb12lBzTBDIPnuupeYxfHjHqehJSUEDs/9UiSytwlKrHNr4lQGH0DXfhvQSqPbIB8HRJfMTE7pTrZMYCw7raxEAIazImx0LLp9QvOmZGQT4slnk8Ctt2TDeY2lb9NoPd0QN6DONqlGkZKXSop5n00wM3rzVM+zBK7PlzkYqRB0lAZSAV206WNi4Tc9SZT22G&signature=DFC9C9B0786671D8E130371CEB8AF6FF&ttl=1726478310671';
    //
    // 'https://ep.dpzrfat6.com/?params=fBUjekqpMEC2RLRlXVe4V7ITO7167Ck8sOPT5TUnNGt/cN/IlHwxIfFwTcWeyPS3RRqb8xzCNfB6UJhpxV9achOalUvL7osAXXcdpbTgeF79mBrNqQFKfD1scOGfpE5xd2x7pACszmYxJ9VezQApxbzvIGpMwkqy7sp2byKhC4aJPSi7rqLWYNMi3TYx1wMDB6Qw9FXR14DIGchz1qq75dDm1AoNDc/5OUBFJpOKAuufygb8BIk1DrfBhcdUjddRIG0iIxPNrHTJZNRMQmTwQmSTswGQ9ahjzJcgSqdGgpiAaigDDNobxKsXhsQ3hv9U5TlkpCapy6pAyy1/3enyDFpPLOryIsdwoQr6uE6Mb6v+/rht8lGj9e1AQGEAoYekjO7fhwwaAUbBGNp5UVjIh6wQEAnGbz1AetrGIj/1mIJTYa8pMKtp6smtpidsit0K6SgNdUrvKSFKN+nv05i/GloTTQ09rLUQP2Ho8ImgvD+GXJlAhkqr6GAXP83qPlYX+ONzPx8omS5dL26j1F6YZPG+G96O9GCKEKVn+BM48C2dptxbP/d3ep7nd1fAfhl47+JQIFMlSyzPGtp2AhKQRwrpWVWPZeE2rfIvC6VtOaSFKG0l8leFEQ35cPWOaAXK2/1FwCVAZ13IqJSb2Ld1mrLufOI1cOFO2dQYlO+iOwCs832X2akfgdf6mNb2ygw9SZyhtQh59K3zg2rKx9iO8+18blu++E5P6qqxG4Ca9KUSpdi9qwGC3i/R8mwHk7TAdT+xIuqZt9HAPmNdCpu6lvnLZidsP7sbpfi75FfUFNZ0vYyQS4D6TTfi2l84qifxMKIjCjFKuhSSK7zXz0OODX0Ro2Cj5E1Xn/Po5XZSqawfCuAxz/rWIi/aepri8GHkCb8R/Pbwy2qC45CedWMAyKOO6iVE2M3WhgSSJsO4dpVI27Qst6eKh5k/Lhx8aPq47TlYms1zMdP1WP5DztFUYsWLp910+z9yAbxSG5hq/bqWne4TQfSUQgFHGmWjIrbm9i7j4WAnW0HY6NsGqHvJ/UmG788Jk1znUmmqYYbpWgqYo5YK/eLl5/G+Ip+DmCWPbx8NkhBuTOymU4o4TRucatx1r23aoFL/JARmTCWCyo63gcSSKTTj0HqtLSzOkTHp+XRKKLb4UpkTnh4WRd19TTrk3/uVceuHQV+t9F0YvhXXfagotlIFq+9PVBF9yzN6ZV7eketVaZJMTZ2QaS1v3C2VVJULEQiI+icADGh5tzD+q5hlg7L8j+n8DhGHp4sn&signature=C542B4664EFC54AF52B960B972CA1E83&ttl=1726637212526&platform=app';
    //  UrlManager 初始化
    await UrlManager.initialize(pcLoginBackUrl);

    final para = UrlManager.getDecodeParams();

    //初始化 ws url
    await ConfigManager.initialize(para.backendDomainUrl);

    baseSocket = BaseSocket();

    return await createWebsocket();
  }

  createWebsocket() async {
    var url = baseSocket.url;
    LogUtil.log('createWebsocket-url=$url');
    // 创建连接并且发送鉴别身份信息
    channel = IOWebSocketChannel.connect(baseSocket.url!);

    // 拼接登录参数
    // final timestamp = await _initcreateFun('createTimestamp', []);
    final timestamp = AppUtil.currentTimeMillis;
    LogUtil.log('createWebsocket-timestamp=$timestamp');
    processData = {};
    processData['jwtToken'] = UrlManager.token;
    processData['clientDeviceType'] = DeviceTypeEnum.WEB.value;
    processData['deviceType'] = UrlManager.deviceType;
    processData['deviceId'] = LocalStorageManager.deviceId;

    jsonData = IRequestJsonData()
      ..id = SocketType.LOGIN.value
      ..param = jsonEncode(processData);
    String jsonDataText = jsonEncode(
        {'id': SocketType.LOGIN.value, 'param': jsonEncode(processData)});

    int nonce = int.parse(await _initcreateFun('createNonce', []));
    final sign = await _initcreateFun(
        'createSign', [jsonDataText, nonce, timestamp, CRYPTO_KEY]);

    final request = SocketRequest(
        SocketType.LOGIN, // 心跳的请求ID
        {'id': SocketType.LOGIN.value, 'param': jsonEncode(processData)},
        GameType.MULTI_PLAY,
        ServiceTypeId.HALL,
        timestamp,
        processData,
        jsonDataText,
        UrlManager.playerId,
        nonce,
        sign,
        null);

    buffer = await _initcreateFun(
        'encryptWsData', [jsonEncode(request.toObject()), CRYPTO_KEY]);

    // try {
    //   Map<int, int> resultMap = jsonDecode(buffer) as Map<int, int>;
    //   print(resultMap);
    // } catch (e) {
    //   print('Error parsing JSON: $e');
    // }

    // LogUtil.log('buffer=$buffer');

    List<int> myList = [];
    var split = buffer.split(',').toList();

    for (int i = 0; i < split.length; i++) {
      var value = split[i];
      // print(value);
      var split2 = value.split(":")[1].trim();
      String replaced = split2.replaceFirst("}", "");
      myList.add(int.parse(replaced));
    }

    // LogUtil.log('split=$split');

    // var list = Uint8List.fromList(buffer.split(',').cast<int>()).toList();

    // LogUtil.log('list=$myList');

    //监听到服务器返回消息
    channel.stream.listen((data) => listenMessage(data),
        onError: onError, onDone: onDone);

    Future.delayed(const Duration(seconds: 3), () {
      channel.sink
      // .add(Uint8List.fromList(buffer.split(',').map(int.parse).toList())),
          .add(Uint8List.fromList(myList));
    });
  }

  _initcreateFun(fun, para) async {
    final data = await executeJS('DataHandle', fun, para);
    return data;
  }

  listenMessage(data) async {
    connecting = true;
    LogUtil.log('createWebsocket-listenMessage-connecting=$connecting');
    // 解密
    final text =
        await executeJS('DataHandle', 'decryptWsData', [data, CRYPTO_KEY]);

    print(json.decode(json.decode(text)['jsonData'])['data']);
    //接收到消息
    // historyMessage.add(obj);
    // print(historyMessage);
    notifyListeners();
  }

  sendMessage(type, data, index) {
    var obj = {"type": 2, "groupId": 1};
    String text = json.encode(obj).toString();
    print(text);
    channel.sink.add(text);
  }

  void onError(error) {
    print('error------------>${error}');
  }

  void onDone() {
    print('websocket断开了');
    createWebsocket();
    print('websocket重连');
  }

  closeWebSocket() {
    //关闭链接
    channel.sink.close();
    print('关闭了websocket');
    notifyListeners();
  }

  // 广播
  void onBroadcastData(Uint8List data) {
    final response = SocketResponse(data);

    // if (asyncTypes.contains(response.type)) {
    //   asyncTypes.remove(response.type);
    //   return;
    // }

    GameColLog.logServerData(response.typeString, response.toJSON());
    if (handler != null) {
      handler!.onGameProtobuf(response);
    }
  }

  // 心跳
  @override
  void sendPingPong() async {
    // if (socket?.readyState == WebSocket.closed) {
    //   return;
    // }

    final timeStamp = await executeJS('DataHandle', 'createTimestamp', []);

    final data =
        HeartbeatReq(clientTime: int.parse(timeStamp)) as Map<String, dynamic>;
    final heartbeatData = SocketRequest(
        SocketType.PROXY_HEART_BEAT, // 心跳的请求ID
        data,
        GameType.MULTI_PLAY,
        ServiceTypeId.HALL,
        '',
        '',
        '',
        0,
        '',
        '',
        null);

    // sendReq(heartbeatData);
  }
}
