import 'dart:ui';
import 'package:get/get.dart';

import '../utils/storage_util.dart';
import 'language_en.dart';
import 'language_cn.dart';
import 'language_kr.dart';
import 'language_tc.dart';
import 'language_th.dart';
import 'language_vi.dart';

/// 调用方法 在language_xx,里面找到对应的值，如：'OK'.tr
/// 带参数 'OK'.trParams({‘name’: '张三'})
/// 更新切换语种
/// updateLocale 参数传入语言环境对象
/// updateLocaleWithCode 参数传入languageCode
/// languageCode的获取方式: Get.locale?.languageCode; 或者 TranslationService.locale?.languageCode;
/// 兼容 历史遗留bug 简体中文zh、cn   繁体中文 tw、tc  韩文ko、kr
/// flutter 内部统一 简体中文cn    繁体中文 tc  韩文kr
/// 本地没得值，从登录信息取

class TranslationService extends Translations {
  // 获取设备语言环境
  // static Locale? get locale => Get.deviceLocale;
  static Locale? get locale => const Locale('cn', 'CN');
  static const fallbackLocale = Locale('cn', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {
        'cn': language_cn, //简体中文
        'tc': language_tc, //繁体中文-香港
        'en': language_en, //英文
        'kr': language_kr, //韩文
        'th': language_th, //泰文
        'vi': language_vi, //越南文
      };

  /// 修改多语言
  /// Locale('zh', 'HK');
  static updateLocale(Locale locale) {
    Get.updateLocale(locale);
    Get.locale = locale;
    // 保存本地
    StorageUtil()
        .setString(StorageUtil.KEY_APP_LANGUAGE_CODE, locale.languageCode);
  }

  /// 修改语言类型 languageCode
  /// 'cn' - 简体中文
  /// 'tc' — 繁体中文-香港
  /// 'en' — 英文
  /// 'kr' — 韩文
  /// 'th' — 泰文
  /// 'vi' — 越南文
  static updateLocaleWithCode(String languageCode) {
    String languageC = '';
    switch (languageCode) {
      case 'cn':
      case 'tc':
      case 'en':
      case 'kr':
      case 'th':
      case 'vi':
        languageC = languageCode;
        break;
      default:
        languageC = 'en';
        break;
    }

    final locle = Locale(languageC);
    TranslationService.updateLocale(locle);
  }

  // 接口取值，接口
  static getText(Map res) {
    String languageCode = TranslationService.locale?.languageCode ?? 'cn';
    final value = res[languageCode]['content'];
    if (value == null) {
      if (languageCode == 'cn') {
        return '${res['zh']['content']}';
      } else if (languageCode == 'kr') {
        return '${res['ko']['content']}';
      } else {
        return '${res['tw']['content']}';
      }
    }
    return value;
  }
}
