import 'package:flutter_main/configs/app_config.dart';
import 'package:logger/logger.dart';

enum LogLevel {
  trace(1000),
  debug(2000),
  info(3000),
  warning(4000),
  error(5000),
  fatal(6000),
  off(10000);

  final int value;

  const LogLevel(this.value);
}

class LogUtil {
  /// 单例模式
  late Logger _logger;
  static final LogUtil _instance = LogUtil._internal();

  factory LogUtil() => _instance;

  LogUtil._internal() {
    _logger = Logger(
      printer: PrefixPrinter(
          PrettyPrinter(printEmojis: false, colors: false, printTime: true)),
    );
  }

  static void changeDisplayLevel(LogLevel level) {
    switch (level) {
      case LogLevel.trace:
        Logger.level = Level.trace;
      case LogLevel.debug:
        Logger.level = Level.debug;
      case LogLevel.info:
        Logger.level = Level.info;
      case LogLevel.warning:
        Logger.level = Level.warning;
      case LogLevel.error:
        Logger.level = Level.error;
      case LogLevel.fatal:
        Logger.level = Level.fatal;
      case LogLevel.off:
        Logger.level = Level.fatal;
    }
  }

  // static void printLongLog(String tag, String message) {
  //   if (!AppConfig.isDebug) {
  //     return;
  //   }
  //   const maxLogLength = 4000;
  //   final parts = message.split(RegExp('.{1,${maxLogLength - 1}}'));
  //   for (var part in parts) {
  //     log('$tag: $part');
  //   }
  // }

  /// 自定义的打印
  static void log(
      dynamic log, {
        LogLevel level = LogLevel.trace,
      }) {
    if (!AppConfig.isDebug) {
      level = LogLevel.off;
    }
    switch (level) {
      case LogLevel.trace:
        _instance._logger.t(log);
      case LogLevel.debug:
        _instance._logger.d(log);
      case LogLevel.info:
        _instance._logger.i(log);
      case LogLevel.warning:
        _instance._logger.w(log);
      case LogLevel.error:
        _instance._logger.e(log);
      case LogLevel.fatal:
        _instance._logger.f(log);
      case LogLevel.off:
      // 什么也不做
    }
  }
}
