import 'package:dio/dio.dart';
import 'package:flutter_main/utils/utils.dart';

class HttpUtil {
  /// 获取 当前网络 ip
  static Future<String> getIp() async {
    String ip = '103.84.47.146';
    final dio = Dio();

    try {
      // 发送GET请求
      final response = await dio.get('https://api.ipify.org');

      // 处理响应
      if (response.statusCode == 200) {
        // LogUtil.log('--AppUtil--getIp-Response data: ${response.data}');
        ip = response.data;
      } else {
        LogUtil.log('--AppUtil--getIp-Failed to fetch data.');
      }
    } on DioException catch (error) {
      LogUtil.log('--AppUtil--getIp-error=$error');
    } finally {
      dio.close();
    }
    // LogUtil.log('--AppUtil--getIp-ip=$ip');
    return ip;
  }
}