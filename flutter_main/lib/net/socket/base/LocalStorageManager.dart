import 'dart:math';

import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/utils/utils.dart';

enum NormalKeys {
  // ignore: constant_identifier_names
  DEVICE_ID("deviceId"),

  // ignore: constant_identifier_names
  USER_SKIN("userSkin");

  final String value;
  const NormalKeys(this.value);
}

enum ReplaceKeys {
  // ignore: constant_identifier_names
  HIGH_END_MODE("{0}_{1}_HighEndMode"),

  // ignore: constant_identifier_names,
  DO_NOT_CHECK_HIGH_LOW("{0}_{1}_DoNotCheckHighLow");

  final String value;
  const ReplaceKeys(this.value);
}

class LocalStorageManager {
  static void setItem(String key, String value) {
    if (isKeyInEnum(key, NormalKeys.values)) {
      // localStorage.setItem(key.toString(), value);
      StorageUtil().setString(key, value);
    }
  }

  static void delItem(String key) {
    if (isKeyInEnum(key, NormalKeys.values)) {
      // localStorage.removeItem(key.toString());
      StorageUtil().remove(key);
    }
  }

  static Future getItem(String key) async {
    if (isKeyInEnum(key, NormalKeys.values)) {
      // return localStorage.getItem(key.toString());
      return GlobalController.mNetworkAvailable;
    }
    return null;
  }

  static bool isKeyInEnum(dynamic key, List<dynamic> enumValues) {
    return enumValues.contains(key);
  }

  static String get deviceId {
    // String? deviceId = localStorage.getItem(NormalKeys.DEVICE_ID.toString());
    // String? deviceId = getItem(NormalKeys.DEVICE_ID.toString()) as String?;
    // if (deviceId == null || deviceId.isEmpty) {
    //   deviceId = DateTime.now().millisecondsSinceEpoch.toString() +
    //       (Random().nextInt(900000) + 100000).toString();
    //   // localStorage.setItem(NormalKeys.DEVICE_ID.toString(), deviceId);
    //   setItem(NormalKeys.DEVICE_ID.toString(), deviceId);
    // }
    String deviceId = DateTime.now().millisecondsSinceEpoch.toString() +
        (Random().nextInt(900000) + 100000).toString();
    String fixDeviceId = "$deviceId-${Random().nextInt(90000000) + 10000000}";
    // return fixDeviceId;
    return '1726474772360664400-94014324';
  }
}
