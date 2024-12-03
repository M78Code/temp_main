import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../controllers/global_controller.dart';
import '../../utils/app_util.dart';
import '../../utils/storage_util.dart';
import '../../utils/toast_util.dart';

class RoadHomeSettingPage extends StatefulWidget {
  const RoadHomeSettingPage({super.key});

  @override
  State<RoadHomeSettingPage> createState() => _RoadHomeSettingPageState();
}

class _RoadHomeSettingPageState extends State<RoadHomeSettingPage> {
  GlobalController controller = GlobalController.controller;

  /// 游戏类型
  List<int> gameTypeSelect = [2002, 2001, 2003, 2005, 2004, 20014];
  List gameTypeList = [
    {
      'id': 2002,
      'name': '极速百家乐',
    },
    {
      'id': 2001,
      'name': '经典百家乐',
    },
    {
      'id': 2003,
      'name': '竞咪百家乐',
    },
    {
      'id': 2005,
      'name': '共咪百家乐',
    },
    {
      'id': 2004,
      'name': '包桌百家乐',
    },
    {
      'id': 20014,
      'name': '高额贵宾桌',
    }
  ];

  /// 好路设置
  List<int> roadTypeSelect = [2, 1, 3, 5, 6, 4];
  List roadTypeList = [
    {'id': 2, 'name': '长庄', 'road': 'luzi_1'},
    {'id': 1, 'name': '长闲', 'road': 'luzi_2'},
    {'id': 3, 'name': '大路单跳', 'road': 'luzi_3'},
    {'id': 5, 'name': '一庄两闲', 'road': 'luzi_4'},
    {'id': 6, 'name': '一闲两庄', 'road': 'luzi_5'},
    {'id': 4, 'name': '长路转单跳', 'road': 'luzi_6'}
  ];

  @override
  void initState() {
    super.initState();
    this.setGameType();
    this.setRoadType();
  }

  /// 设置游戏类型
  setGameType() {
    List<String> storageList = StorageUtil().getList('gameType');
    List<int> list = storageList.map((id) => int.parse(id)).toList();
    if (list.length <= 0) {
      List<String> arr =
          gameTypeList.map((item) => item['id'].toString()).toList();
      return StorageUtil().setList('gameType', arr);
    }
    ;
    setState(() => gameTypeSelect = list);
  }

  /// 设计好路数据
  setRoadType() {
    List<String> storageList = StorageUtil().getList('roadType');
    List<int> list = storageList.map((id) => int.parse(id)).toList();
    print(storageList);
    if (list.length <= 0) {
      List<String> arr =
          roadTypeList.map((item) => item['id'].toString()).toList();
      return StorageUtil().setList('roadType', arr);
    }
    ;
    setState(() => roadTypeSelect = list);
  }

  onSubmit() {
    List<String> gameList = gameTypeSelect.map((id) => id.toString()).toList();
    List<String> roadList = roadTypeSelect.map((id) => id.toString()).toList();
    if (gameList.length < 1) return ToastUtil.showToast('最少需选择 1 种游戏类型');
    GlobalController.controller.gameList =
        gameList.map((e) => int.parse(e)).toList();
    GlobalController.controller.roadList =
        roadList.map((e) => int.parse(e)).toList();
    StorageUtil().setList('gameType', gameList);
    StorageUtil().setList('roadType', roadList);
    const protocolId = 10056;
    Map jsonData = {
      "id": protocolId,
      "param": {
        "goodRoadTypeList": roadList,
        "goodRoadGameList": gameList,
        "deviceType": 6,
        "deviceId": AppUtil.deviceId
      }
    };
    // String jsonDataStr = json.encode(jsonData).toString();
    // Map data = {
    //   "jsonData": jsonDataStr,
    //   "protocolId": protocolId,
    //   "gameTypeId": 2013,
    //   "playerId": GlobalController.controller.appConfigModel?.playerId ?? 0,
    //   "tableId": 0,
    //   "serviceTypeId": 7
    // };
    // String text = json.encode(data).toString();
    // WebSocketManager().sendEncryptUint8ListMessage(text).then((onValue){
    //   LogUtil.log('onSubmit=$onValue');
    // });
    // navigator?.pop();
    String jsonDataStr = json.encode(jsonData).toString();
    Map data = {
      "jsonData": jsonDataStr,
      "protocolId": protocolId,
      "gameTypeId": 2013,
      "playerId": GlobalController.controller.appConfigModel?.playerId ?? 0,
      "tableId": 0,
      "serviceTypeId": 7
    };
    String text = json.encode(data).toString();
    // WebSocketManager().sendEncryptUint8ListMessage(text).then((onValue){
    //   LogUtil.log('onSubmit=$onValue');
    // });

    // WebSocketHelp.switchTab();
    navigator?.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 480.sp,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        child: Obx(() => Scaffold(
              backgroundColor:
                  Color(controller.checkWhiteBlack(0xffF4F8FF, 0xFF252B3D)),
              appBar: AppBar(
                backgroundColor:
                    Color(controller.checkWhiteBlack(0xffF4F8FF, 0xFF252B3D)),
                centerTitle: true,
                title: Text('好路设置',
                    style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(controller.checkWhiteBlack(
                            0xFF253D61, 0xFFDCDCDC)))),
                leading: IconButton(
                  icon: Icon(Icons.close),
                  color: controller.checkWhiteBlack(
                      Color(0xffA8B4C7), Color.fromRGBO(220, 220, 220, 0.3)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(left: 12.sp),
                    children: [
                      TitleWidget(
                          title: '游戏类型',
                          isAll: gameTypeSelect.length == gameTypeList.length,
                          onPressed: () {
                            if (gameTypeSelect.length == gameTypeList.length) {
                              return setState(() => gameTypeSelect = []);
                            }
                            List<int> list = [];
                            gameTypeList
                                .forEach((item) => list.add(item['id']));
                            setState(() => gameTypeSelect = list);
                          }),
                      GameTypeWidget(),
                      SizedBox(height: 24.sp),
                      TitleWidget(
                          title: '好路类型',
                          isHelp: true,
                          isAll: roadTypeSelect.length == roadTypeList.length,
                          onPressed: () {
                            if (roadTypeSelect.length == roadTypeList.length) {
                              return setState(() => roadTypeSelect = []);
                            }
                            List<int> list = [];
                            roadTypeList
                                .forEach((item) => list.add(item['id']));
                            setState(() => roadTypeSelect = list);
                          }),
                      RoadTypeWidget(),
                      Gaps.h10,
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: ConfirmWidget(),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget ConfirmWidget() {
    return Container(
      width: Get.width,
      height: 66.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: controller.checkWhiteBlack([
                Color.fromRGBO(255, 255, 255, 0),
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 255, 255, 1),
              ], [
                Color.fromRGBO(37, 43, 61, 0),
                Color.fromRGBO(37, 43, 61, 1),
                Color.fromRGBO(37, 43, 61, 1),
                Color.fromRGBO(37, 43, 61, 1),
              ]))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: onSubmit,
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
              ),
              child: Container(
                width: 188.sp,
                height: 36.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/common/light/mode_but.png'))),
                child: Text('确定',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white)),
              ))
        ],
      ),
    );
  }

  Widget GameTypeWidget() {
    return Wrap(
      runSpacing: 11.sp,
      spacing: 8.sp,
      children: gameTypeList.map((item) => GameTypeItem(item)).toList(),
    );
  }

  Widget GameTypeItem(item) {
    return Container(
      width: 112.sp,
      height: 27.sp,
      padding: EdgeInsets.only(left: 6.sp, right: 6.sp),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: controller.checkWhiteBlack(
                  Color.fromRGBO(199, 204, 219, 0.34),
                  Color.fromRGBO(0, 0, 0, 0.2)),
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/game_type_bg.png'))),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          int index = gameTypeSelect.indexOf(item['id']);
          setState(() {
            if (index == -1) return gameTypeSelect.add(item['id']);
            gameTypeSelect.removeAt(index);
          });
        },
        child: Row(
          children: [
            Image(
                width: 16.sp,
                height: 16.sp,
                image: AssetImage(
                    'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/${gameTypeSelect.contains(item['id']) ? 'radio_sel' : 'radio'}.png')),
            Padding(
              padding: EdgeInsets.only(left: 5.sp),
              child: Text(
                item['name'],
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(
                        controller.checkWhiteBlack(0xff30425C, 0xffDCDCDC))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget RoadTypeWidget() {
    return Wrap(
      spacing: 8.sp,
      runSpacing: 12.sp,
      children: roadTypeList.map((item) => RoadTypeItem(item)).toList(),
    );
  }

  Widget RoadTypeItem(item) {
    return Container(
      width: 112.sp,
      height: 91.5.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: controller.checkWhiteBlack(
                  Color.fromRGBO(199, 204, 219, 0.34),
                  Color.fromRGBO(0, 0, 0, 0.2)),
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/radio_type_bg.png'),
              fit: BoxFit.cover)),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          int index = roadTypeSelect.indexOf(item['id']);
          setState(() {
            if (index == -1) return roadTypeSelect.add(item['id']);
            roadTypeSelect.removeAt(index);
          });
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.sp, right: 6.sp, top: 3.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['name'],
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(controller.checkWhiteBlack(
                              0xFF30425C, 0xFFDCDCDC)))),
                  Image(
                      width: 16.sp,
                      height: 16.sp,
                      image: AssetImage(
                          'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/${roadTypeSelect.contains(item['id']) ? 'radio_sel' : 'radio'}.png')),
                ],
              ),
            ),
            Positioned(
              top: 23.sp,
              left: 4.sp,
              child: Image(
                  width: 102.sp,
                  image: AssetImage(
                      'assets/images/road/roadSetting/${item['road']}.png')),
            )
          ],
        ),
      ),
    );
  }

  Widget TitleWidget({
    required String title,
    required VoidCallback onPressed,
    bool isHelp = false,
    bool isAll = false,
  }) {
    return Container(
      padding: EdgeInsets.only(right: 12.sp, bottom: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5.sp),
                child: Text(title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(controller.checkWhiteBlack(
                            0xFF30425C, 0xFFDCDCDC)))),
              ),
              Offstage(
                offstage: !isHelp,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewPage()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: controller.mAppBgMode.value == 0 ? 2 : 4),
                      child: Image(
                          width: controller.checkWhiteBlack(14.sp, 16.sp),
                          height: controller.checkWhiteBlack(14.sp, 16.sp),
                          image: AssetImage(
                              'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/help.png')),
                    )),
              )
            ],
          ),
          InkWell(
              onTap: onPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Offstage(
                    offstage: isAll,
                    child: Image(
                        width: 16.sp,
                        height: 16.sp,
                        image: AssetImage(
                            'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/radio.png')),
                  ),
                  Offstage(
                    offstage: !isAll,
                    child: Image(
                        width: 16.sp,
                        height: 16.sp,
                        image: AssetImage(
                            'assets/images/road/roadSetting/${controller.checkWhiteBlack('light', 'dark')}/radio_sel.png')),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.sp),
                    child: Text('全选',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(controller.checkWhiteBlack(
                                0xFF30425C, 0xFFDCDCDC)))),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    String webUrl =
        'https://xsjj.dpzrfat6.com/#/gameHelp?anchorId=5002&brandType=1&shenji=0';
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
                Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
            print(request);
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(webUrl));
    // setBackgroundColor is not currently supported on macOS.
    if (kIsWeb || !Platform.isMacOS) {
      controller.setBackgroundColor(const Color(0x80000000));
    }

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('好路帮助'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
