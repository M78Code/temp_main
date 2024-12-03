import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

/// kv离线存储
class StorageUtil {
  /// 用户名
  static const String KEY_LOGIN_NAME = 'key_login_name';

  /// 解密后 配置信息 持久化
  static const String KEY_APP_CONFIG_MODEL = 'key_app_config_model';

  /// 白天黑夜状态 本地维护 0浅 1深 2自动  皮肤切换使用字段用原来的，规则不变
  static const String KEY_APP_BG_MODE = 'key_app_config_mode';

  /// 路纸模式 0浅色 1深色
  static const String KEY_ROAD_MODE = 'key_road_mode';

  /// 声音总开关 ture开启  false关闭
  static const String KEY_VOICE_SWITCH = 'voice_switch';

  /// 语音 语种
  static const String KEY_VOICE = 'key_voice';

  /// 游戏声音 0~100
  static const String KEY_GAME_VOICE = 'game_voice';

  /// 游戏音效 0~100
  static const String KEY_GAME_YINX = 'game_yinx';

  /// 现场声音 0~100
  static const String KEY_SCENE_VOICE = 'scene_voice';

  /// 现场视频 ture开启  false关闭
  static const String KEY_SCENE_VIDEO = 'scene_video';

  /// 快速换桌 ture开启  false关闭
  static const String KEY_CHANGE_TALBE = 'change_table';

  /// 快速投注 ture开启  false关闭
  static const String KEY_QUIK_BET = 'quik_bet';

  /// deviceId
  static const String KEY_DEVICE_ID = 'key_device_id';

  /// languageCode
  static const String KEY_APP_LANGUAGE_CODE = 'key_app_language_code';

  // 单例写法
  static final StorageUtil _instance = StorageUtil._internal();
  factory StorageUtil() => _instance;
  late final SharedPreferences _prefs;

  StorageUtil._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setJson(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  ///0、1、2容易用到
  int getInt(String key) {
    return _prefs.getInt(key) ?? 100;
  }

  double getDouble(String key) {
    return _prefs.getDouble(key) ?? 50;
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? true;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  /// 写入数据
  Future<void> set<T>(String key, T value) async {
    Type type = value.runtimeType;
    switch (type) {
      case String:
        await _prefs.setString(key, value as String);
        break;
      case int:
        await _prefs.setInt(key, value as int);
        break;
      case bool:
        await _prefs.setBool(key, value as bool);
        break;
      case double:
        await _prefs.setDouble(key, value as double);
        break;
      case const (List<String>):
        await _prefs.setStringList(key, value as List<String>);
        break;
    }

    /// map不能直接判断Type类型，他是一个_InternalLinkedHashMap是一个私有类型，没有办法引用出来。
    if (value is Map) {
      // map，转成json格式的字符串进行保存。序列化成json字符串
      await _prefs.setString(key, json.encode(value));
      return;
    }
  }

  /// 根据key。读取数据，
  Object? get<T>(String key) {
    var value = _prefs.get(key);
    if (value is String) {
      try {
        // 反序列化，处理map，原样返回map回去。
        return const JsonDecoder().convert(value) as Map<String, dynamic>;
      } on FormatException catch (e) {
        return value; // 返回字符串
      }
    }
    return value;
  }

  /// -------------其他方法封装-----------------
  /// 获取所有的key
  Set<String> getKeys() {
    return _prefs.getKeys();
  }

  /// 判断数据中是否包含某个key
  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  /// 删除数据中某个key
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  /// 清空所有数据
  Future<bool> clear() async {
    return await _prefs.clear();
  }

  /// 重新加载
  Future<void> reload() async {
    return await _prefs.reload();
  }
}
