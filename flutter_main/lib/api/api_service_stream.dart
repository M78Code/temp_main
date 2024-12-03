import 'package:flutter_main/api/api_host.dart';
import 'package:flutter_main/models/common/base_response.dart';
import 'package:flutter_main/net/http/http.dart';
import 'package:flutter_main/net/http/http_stream_manager.dart';

class ApiServiceStream {

  static const String init = '/lvControlApi/sysConfig/init';
  static const String strategy = '/lvControlApi/strategy/getStrategy';
  static const String getToken = '/lvControlApi/auth/getToken';



  static Future<BaseResponse> requestInit({required String ticket, required int userId }) async {
    Map<String, dynamic>? parameters = {
      "ticket":ticket,
      "userId":userId,
      "applicationCode":"zr_game_1001",
      "versionId":"1.0",
      "userAgt":"Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36"
    };
    return HttpStreamManager().doRequest(init, HttpMethod.post,
        parameters: parameters, isShowLoading: false, isShowToast: false);
  }

  static Future<BaseResponse> requestStrategy({required String sessionId, required String channel, required int sharpess}){
    Map<String, dynamic>? parameters = {
      "sessionId":sessionId,
      // "channelName":channel,
      "sharpness":sharpess
    };
    return HttpStreamManager().doRequest(strategy, HttpMethod.post,
        parameters: parameters, isShowLoading: false, isShowToast: false);
  }

  static Future<BaseResponse> requestToken(
      {
        required String sessionId,
        required String domain,
        required int uid,
        required String channel,
        required int sharpess}
      ){
    Map<String, dynamic>? parameters = {
      'appId': 'zr_game_1001',
      'thirdpartyCode': '3001',
      'sharpness':sharpess,
      'userId': uid,
      'channelName':channel,
      'domain':domain,
      'mountPoint': 'live',
      'protocol': 'flv',
      'sessionId': sessionId,
    };
    return HttpStreamManager().doRequest(getToken, HttpMethod.post,
        parameters: parameters, isShowLoading: false, isShowToast: false);
  }

}
