import 'package:flutter_main/api/api_host.dart';
import 'package:flutter_main/api/param_models/game_record_list_request_model.dart';
import 'package:flutter_main/api/param_models/limit_record_list_request_model.dart';
import 'package:flutter_main/models/common/base_response.dart';
import 'package:flutter_main/models/game_record/game_record_response.dart';
import 'package:flutter_main/models/limit_record/limit_record_response.dart';
import 'package:flutter_main/net/http/http.dart';

class ApiService {
  /// 设备类型
  static const int deviceType = 1;

  /// 登录-login
  static const String playerLogin = '${ApiHost.API_NAME}/player/login';

  /// 登录-loginGame
  static const String playerLoginGame = '${ApiHost.API_NAME}/player/loginGame';

  /// 获取配置列表
  static const String loadConfigList = '${ApiHost.API_NAME}/loadConfig/list';

  /// 获取用户修改昵称的次数
  static const String _modifyNicknameCount =
      '${ApiHost.API_NAME}/account/modify/nickname/count';

  /// 生成昵称
  static const String _generateNickname =
      '${ApiHost.API_NAME}/account/generateNickName';

  /// 修改昵称
  static const String _modifyNickname =
      '${ApiHost.API_NAME}/account/modify/nickname';

  /// 视频验真
  static const String _digitalVerification =
      '${ApiHost.API_NAME}/digitalVerification';

  /// 优惠活动
  static const String _getRunningActivityType =
      '${ApiHost.API_NAME}/activity/getRunningActivityType';

  /// 投注记录
  static const String _gameRecord = '${ApiHost.API_NAME}/game-record/search';

  /// 额度记录
  static const String _limitRecord =
      '${ApiHost.API_NAME}/account/search-record';

  static Future<BaseResponse> playerLoginApi(
      Map<String, dynamic>? parameters) async {
    return HttpManager().doRequest(playerLoginGame, HttpMethod.post,
        parameters: parameters, isShowLoading: false, isShowToast: false);
  }

  static Future<BaseResponse> wheatOrderListApi(
      int deviceType, int platformType) async {
    return HttpManager().doRequest(loadConfigList, HttpMethod.get,
        parameters: {'deviceType': deviceType, 'platformType': platformType},
        isShowLoading: true,
        isShowToast: true);
  }

  /// 获取昵称修改次数
  static Future<int> getModifyNicknameCount() async {
    final result = await HttpManager()
        .doRequest(_modifyNicknameCount, HttpMethod.get, isShowLoading: true);
    return (result.data as int?) ?? 0;
  }

  /// 生成昵称
  static Future<String> generateNickName() async {
    final result = await HttpManager().doRequest(
      _generateNickname,
      HttpMethod.get,
    );
    return result.data ?? "";
  }

  /// 修改昵称
  static Future<void> modifyNickname({required String nickname}) async {
    await HttpManager().doRequest(_modifyNickname, HttpMethod.post,
        parameters: {'nickName': nickname}, isShowLoading: true);
  }

  /// 视频验真
  static Future digitalVerification(
      {required int tableId, required String digitalVerificationNum}) async {
    final result = await HttpManager().doRequest(
        _digitalVerification, HttpMethod.get,
        parameters: {
          'tableId': tableId,
          'digitalVerificationNum': digitalVerificationNum
        },
        isShowLoading: false,
        isShowToast: false);
    if (result.code != 200) {
      throw result.msg ?? "视频验真失败";
    }
  }

  /// 优惠活动
  static Future<BaseResponse> getRunningActivityType({
    int? pageIndex = 1,
    int? pageSize = 20,
    int? searchType = 0,
  }) async {
    final result =
        await HttpManager().doRequest(_getRunningActivityType, HttpMethod.get,
            parameters: {
              'pageIndex': pageIndex,
              'pageSize': pageSize,
              'searchType': searchType,
              'deviceType': deviceType,
            },
            isShowLoading: false,
            isShowToast: false);
    if (result.code != 200) {
      throw result.msg ?? '';
    }
    return result;
  }

  /// 投注记录
  static Future<GameRecordResponse?> getGameRecordWith(
      {required GameRecordListRequestModel params}) async {
    BaseResponse result = await HttpManager().doRequest(
        _gameRecord, HttpMethod.get,
        parameters: params.toJson(), isShowLoading: false, isShowToast: false);
    if (result.code != 200) throw result.msg ?? "未知错误";
    GameRecordResponse? gameRecordResponse;
    if (result.data != null) {
      gameRecordResponse = GameRecordResponse.fromJson(result.data);
    }
    return gameRecordResponse;
  }

  /// 额度记录
  static Future<LimitRecordResponse?> getLimitRecordWith(
      {required LimitRecordListRequestModel params}) async {
    BaseResponse result = await HttpManager().doRequest(
        _limitRecord, HttpMethod.get,
        parameters: params.toJson(), isShowLoading: false, isShowToast: false);
    if (result.code != 200) throw result.msg ?? "未知错误";
    LimitRecordResponse? limitRecordResponse;
    if (result.data != null) {
      limitRecordResponse = LimitRecordResponse.fromJson(result.data);
    }
    return limitRecordResponse;
  }
}