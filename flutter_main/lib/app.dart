import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/pages/home/home_router.dart';
import 'package:flutter_main/pages/home/my_home_page.dart';
import 'package:flutter_main/pages/splash/index.dart';
import 'package:flutter_main/routers/routers.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'language/translations_service.dart';
import 'models/app_config_model.dart';
import 'net/socket/base/URLManager.dart';

// class App extends StatelessWidget {
//   const App({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // var dataInfo = Provider.of<WebSocketProvide>(context).init();
//     // print(dataInfo);
//     return ScreenUtilInit(
//         designSize: const Size(375.0, 812.0), //设计稿的宽度和高度 px
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Main',
//             locale: TranslationService.locale, //默认语言
//             fallbackLocale: TranslationService.fallbackLocale,
//             translations: TranslationService(),
//             localizationsDelegates: const [
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: const [
//               Locale('en', 'US'), // 美国英语
//               Locale('zh', 'CN'), // 中文简体
//               Locale('tw', 'HK'), // 繁体中文
//               Locale('ko', 'KR'), // 韩语
//               Locale('th', 'TH'), // 泰文
//               Locale('vi', 'VI'), // 越南文
//             ],
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(
//                   seedColor: const Color.fromARGB(255, 4, 3, 5)),
//               useMaterial3: true,
//             ),
//             builder: FlutterSmartDialog.init(builder: EasyLoading.init()),
//             getPages: BaseRouter.pageRouters,
//             initialBinding: _InitBinding(),
//             initialRoute: HomeRouter.home,
//             home: const MyHomePage(title: "Demo"),
//           );
//         });
//   }
// }

// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(375.0, 812.0), //设计稿的宽度和高度 px
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Main',
//             locale: TranslationService.locale, //默认语言
//             fallbackLocale: TranslationService.fallbackLocale,
//             translations: TranslationService(),
//             localizationsDelegates: const [
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: const [
//               Locale('en', 'US'), // 美国英语
//               Locale('zh', 'CN'), // 中文简体
//               Locale('tw', 'HK'), // 繁体中文
//               Locale('ko', 'KR'), // 韩语
//               Locale('th', 'TH'), // 泰文
//               Locale('vi', 'VI'), // 越南文
//             ],
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(
//                   seedColor: const Color.fromARGB(255, 4, 3, 5)),
//               useMaterial3: true,
//             ),
//             builder: FlutterSmartDialog.init(builder: EasyLoading.init()),
//             getPages: BaseRouter.pageRouters,
//             initialBinding: _InitBinding(),
//             initialRoute: HomeRouter.home,
//             home: const MyHomePage(title: "Demo"),
//           );
//         });
//   }
// }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // addListenerWithNative();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375.0, 812.0), //设计稿的宽度和高度 px
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Main',
            locale: TranslationService.locale, //默认语言
            fallbackLocale: TranslationService.fallbackLocale,
            translations: TranslationService(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // 美国英语
              Locale('zh', 'CN'), // 中文简体
              Locale('tw', 'HK'), // 繁体中文
              Locale('ko', 'KR'), // 韩语
              Locale('th', 'TH'), // 泰文
              Locale('vi', 'VI'), // 越南文
            ],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 4, 3, 5)),
              useMaterial3: true,
            ),
            builder: FlutterSmartDialog.init(builder: EasyLoading.init()),
            getPages: BaseRouter.pageRouters,
            initialBinding: _InitBinding(),
            initialRoute: HomeRouter.home,
            home: const MyHomePage(title: "Demo"),
          );
        });
  }
}



// class App extends StatelessWidget {
//   const App({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // var dataInfo = Provider.of<WebSocketProvide>(context).init();
//     // print(dataInfo);
//     return ScreenUtilInit(
//         designSize: const Size(375.0, 812.0), //设计稿的宽度和高度 px
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return GetMaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Main',
//             locale: Language.locale,
//             fallbackLocale: Language.fallbackLocale,
//             translations: Language(),
//             localizationsDelegates: const [
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: const [
//               Locale('zh', 'CN'), // 中文简体
//             ],
//             theme: ThemeData(
//               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//               useMaterial3: true,
//             ),
//             builder: EasyLoading.init(builder: FlutterSmartDialog.init()),
//             getPages: BaseRouter.pageRouters,
//             initialBinding: _InitBinding(),
//             initialRoute: SplashRouter.splash,
//             home: const SplashPage(),
//           );
//         });
//   }
// }

class _InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController());
    Get.put<WebsocketController>(WebsocketController());
  }
}


