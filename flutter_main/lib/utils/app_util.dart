import 'dart:math';
import 'package:flutter_main/net/socket/base/Config.dart';
import 'package:flutter_main/net/socket/base/Enum.dart';
import 'package:flutter_main/utils/utils.dart';

class AppUtil {
  static int get currentTimeMillis {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String get deviceId {
    var deviceId = StorageUtil().getString(StorageUtil.KEY_DEVICE_ID);
    if (deviceId.isEmpty) {
      deviceId = DateTime.now().millisecondsSinceEpoch.toString() +
          (Random().nextInt(900000) + 100000).toString();
      StorageUtil().setString(StorageUtil.KEY_DEVICE_ID, deviceId);
    }
    String fixDeviceId = "$deviceId-${Random().nextInt(90000000) + 10000000}";
    return fixDeviceId;
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

  static String getQueryParameter(String url, String key) {
    var parameter = '';
    try {
      Uri parsedUrl = Uri.parse(url);
      parameter = parsedUrl.queryParameters[key] ?? '';
    } on Exception catch (e) {
      LogUtil.log('AppUtil-getParsedUrl-e=${e.toString()}',
          level: LogLevel.error);
    }
    return parameter;
  }

  /// 格式化时间
  /// 默认时间格式为 年-月-日 时:分:秒，可自定义，具体对应关系可参考 PHP 时间处理。
  static String dateFormat(DateTime time,
      {String format = "yyyy-mm-dd hh:ii:ss"}) {
    var dateObj = {
      'm+': time.month, //月份
      'd+': time.day, //日
      'h+': time.hour, //小时
      'i+': time.minute, //分
      's+': time.second, //秒
    };
    RegExp yearReg = new RegExp(r"(y+)");
    if (yearReg.hasMatch(format)) {
      var matches = yearReg.allMatches(format);
      String match = "${matches.elementAt(0).group(1)}";
      format =
          format.replaceAll(match, "${time.year}".substring(4 - match.length));
    }
    dateObj.forEach((key, value) {
      RegExp replaceReg = RegExp(r'(' "$key" ')');
      if (replaceReg.hasMatch(format)) {
        var matches = replaceReg.allMatches(format);
        String match = "${matches.elementAt(0).group(1)}";
        format = format.replaceAll(
            match,
            (match.length == 1)
                ? "$value"
                : "00$value".substring("$value".length));
      }
    });
    return format;
  }

  // 时间戳格式化
  static String dateForStamp(int timeStamp, {String format = "yyyy-mm-dd"}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return dateFormat(date, format: format);
  }
}
