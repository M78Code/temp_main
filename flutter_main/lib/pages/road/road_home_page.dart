import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/websocket_controller.dart';
import 'package:flutter_main/models/road_model/road_home_table_model_manager.dart';
import 'package:flutter_main/models/ws/ws_10053_model.dart';
import 'package:flutter_main/pages/road/road_home_account_info.dart';
import 'package:flutter_main/pages/road/road_home_dealer_list.dart';
import 'package:flutter_main/pages/road/road_home_live_list.dart';
import 'package:flutter_main/pages/road/road_home_route_list.dart';
import 'package:flutter_main/pages/road/road_home_setting_page.dart';
import 'package:flutter_main/pages/road/road_home_simple_list.dart';
import 'package:flutter_main/pages/road/road_home_style_choose_page.dart';
import 'package:flutter_main/utils/event_bus_util.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_main/controllers/global_controller.dart';

// - fat fsyreivy005/abc123456
// - pro us7uhtest16/abc123456
// - uat gn3hmuat0018/abc123456

//已新增所有人Fat帐号，密码都是 abc123456
//
//expds_winter
//expds_hacken
//expds_larry
//expds_len
//expds_rey
//expds_adam
//expds_mark

class RoadHomePage extends StatelessWidget {
  // const RoadHomePage({super.key});

  //👍  persistent_bottom_nav_bar 框架需要用的参数，此页面暂时 没用到
  const RoadHomePage({
    super.key,
    // required this.menuScreenContext,
    required this.onScreenHideButtonPressed,
    this.scrollController,
    this.onNavBarStyleChanged,
    this.hideStatus = false,
    this.showNavBarStyles = true,
  });

  // final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;
  final ScrollController? scrollController;
  final Function(NavBarStyle)? onNavBarStyleChanged;
  final bool showNavBarStyles;

  @override
  Widget build(BuildContext context) {
    return RoadHomePageContent();
  }
}

class RoadHomePageContent extends StatefulWidget {
  const RoadHomePageContent({super.key});

  @override
  State<RoadHomePageContent> createState() => _RoadHomePageContentState();
}

class _RoadHomePageContentState extends State<RoadHomePageContent> {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  @override
  void initState() {
    super.initState();
    WebsocketController.controller.initStream();
  }

  @override
  Widget build(BuildContext context) {
    // 获取状态栏高度
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: Obx(() {
          return AppBar(
            backgroundColor: globalController.mAppBgMode.value == 1
                ? AppColors.lightBackgroundColor01
                : AppColors.darkBackgroundColor01,
            centerTitle: true,
            // 标题文字
            flexibleSpace: Center(
                child: Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: Text("DP真人",
                  style: TextStyle(
                      fontSize: 18,
                      color: globalController.mAppBgMode.value == 1
                          ? AppColors.darkCommonColor01
                          : AppColors.lightCommonColor01)),
            )),
            // 左侧退出按钮
            leading: IconButton(
              icon: Icon(Icons.close),
              color: globalController.mAppBgMode.value == 1
                  ? AppColors.darkCommonColor01
                  : AppColors.lightCommonColor01,
              onPressed: () {
                const MethodChannel("flutter_to_Native").invokeMethod("flutterBackToNative", {"name":"test"});

              },
            ),
            // 右侧Appbar按钮
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: buildAppBarRightBtn(),
              )
            ],
          );
        }),
      ),
      body: Obx(() {
        return Container(
          color: globalController.mAppBgMode.value == 1
              ? AppColors.lightBackgroundColor01
              : AppColors.darkBackgroundColor01,
          child: RoadHomeBodyContent(),
        );
      }),
    );
  }

  /// 顶部导航栏 右侧按钮 封装 (金币图案+金币值)
  Widget buildAppBarRightBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // 内边距
      decoration: BoxDecoration(
        color: globalController.mAppBgMode.value == 1
            ? AppColors.lightBackgroundColor02
            : AppColors.darkBackgroundColor02, // 背景色
        borderRadius: BorderRadius.circular(30), // 圆角背景
        boxShadow: [
          // 阴影效果
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // 增加模糊半径，使阴影更柔和
            blurRadius: 4, // 调整阴影的偏移
            offset: Offset(0, 2), // 使阴影更贴合组件边缘，减少扩散
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // 适应内容的最小宽度
        children: [
          // 圆形图标部分
          const CircleAvatar(
            radius: 8, // 图标圆形的半径
            backgroundColor: Colors.orange, // 背景颜色
            child: Icon(
              Icons.currency_yuan, // 使用内置的人民币符号
              color: Colors.white,
              size: 12,
            ),
          ),
          SizedBox(width: 8), // 图标和文本的间距
          // 文本部分
          Text(
            '0.00',
            style: TextStyle(
              color: globalController.mAppBgMode.value == 1
                  ? AppColors.lightTextColor01
                  : AppColors.darkTextColor01, // 文本颜色
              fontWeight: FontWeight.bold, // 加粗字体
              fontSize: 12, // 字体大小
            ),
          ),
        ],
      ),
    );
  }
}

///  整个首页的body信息
class RoadHomeBodyContent extends StatefulWidget {
  const RoadHomeBodyContent({super.key});

  @override
  State<RoadHomeBodyContent> createState() => _RoadHomeBodyContentState();
}

class _RoadHomeBodyContentState extends State<RoadHomeBodyContent> {
  // 获取全局控制器实例
  final GlobalController globalController = GlobalController.controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 监听 10053 WebSocket 的事件
    EventBusRoadUtil.eventBus
        .on<Ws10053GameTableMapModelEvent>()
        .listen((event) {
      print("监听到了10053的总Map");

      // 将数据传递给单例类
      RoadHomeTableModelManager().setData(event.mainMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1.顶部用户info信息
        RoadHomeAccountInfo(),
        // 2.左右两侧筛选按钮 (现场模式  好路设置)
        buildFilterBtn(context),
        // Image.asset("assets/images/road/roadPaperIcon/1.png"),
        // 3.网格布局
        Expanded(child: Obx(() {
          // 根据 selectedListIndex 的值返回不同的列表
          // 荷官模式1 极简模式2 路子模式3 现场模式4
          switch (globalController.modeType.value) {
            case 1:
              return RoadHomeDealerList();
            case 2:
              return RoadHomeSimpleList();
            case 3:
              return RoadHomeRouteList();
            case 4:
              return RoadHomeLiveList();
            default:
              return RoadHomeLiveList();
          }
        })),
      ],
    );
  }

  /// 2.左右两侧筛选按钮 (现场模式  好路设置)
  Widget buildFilterBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: <Widget>[
          // 现场模式按钮
          GestureDetector(
              onTap: () {
                print("点击了现场模式按钮");
                showModalBottomSheet(
                  context: context,
                  // backgroundColor: AppColors.lightBackgroundColor04,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (final context) => RoadHomeStyleChoosePage(),
                );
              },
              child: buildRoadStyleBtn()),
          Expanded(child: Text("")),
          // 好路设置按钮
          GestureDetector(
              onTap: () {
                print("点击了好路设置按钮");
                showModalBottomSheet(
                  context: context,
                  // backgroundColor: AppColors.lightBackgroundColor04,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (final context) => RoadHomeSettingPage(),
                );
              },
              child: buildRoadSettingBtn()),
        ],
      ),
    );
  }

  /// 构建 “现场模式” 按钮
  Widget buildRoadStyleBtn() {
    return Obx(() {
      String displayText;
      Widget displayLightImage =
          Image.asset("assets/images/road/light/ic_xianchangmoshi.png");
      Widget displayDarkImage =
          Image.asset("assets/images/road/dark/black_ic_xianchangmoshi.png");

      //荷官模式1 极简模式2 路子模式3 现场模式4
      switch (globalController.modeType.value) {
        case 1:
          displayText = 'mode_type_hg'.tr;
          displayLightImage =
              Image.asset("assets/images/road/light/ic_heguanmoshi.png");
          displayDarkImage =
              Image.asset("assets/images/road/dark/black_ic_heguanmoshi.png");
          break;
        case 2:
          displayText = 'mode_type_lz'.tr;
          displayLightImage =
              Image.asset("assets/images/road/light/ic_jijianmoshi.png");
          displayDarkImage =
              Image.asset("assets/images/road/dark/black_ic_jijianmoshi.png");
          break;
        case 3:
          displayText = 'mode_type_jj'.tr;
          displayLightImage =
              Image.asset("assets/images/road/light/ic_luzhimoshi.png");
          displayDarkImage =
              Image.asset("assets/images/road/dark/black_ic_luzhimoshi.png");
          break;
        case 4:
          displayText = 'mode_type_xc'.tr;
          displayLightImage =
              Image.asset("assets/images/road/light/ic_xianchangmoshi.png");
          displayDarkImage = Image.asset(
              "assets/images/road/dark/black_ic_xianchangmoshi.png");
          break;
        default:
          displayText = 'mode_type_xc'.tr;
          displayLightImage =
              Image.asset("assets/images/road/light/ic_xianchangmoshi.png");
          displayDarkImage = Image.asset(
              "assets/images/road/dark/black_ic_xianchangmoshi.png");
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 14,
            height: 14,
            child: globalController.mAppBgMode.value == 1
                ? displayLightImage
                : displayDarkImage,
            padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
          ),
          Text(
            displayText,
            style: TextStyle(
                fontSize: 12,
                color: globalController.mAppBgMode.value == 1
                    ? AppColors.lightTextColor02
                    : AppColors.darkTextColor02),
          ),
          Container(
            width: 12,
            height: 12,
            child: globalController.mAppBgMode.value == 1
                ? Image.asset(
                    'assets/images/road/dark/black_xuanzhuo_icon_sanjiao1.png')
                : Image.asset(
                    'assets/images/road/light/xuanzhuo_icon_sanjiao1.png'),
            padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
          ),
        ],
      );
    });
  }

  /// 构建 “好路设置” 按钮
  Widget buildRoadSettingBtn() {
    return Obx(() {
      return Row(
        children: [
          Container(
            width: 14,
            height: 14,
            child: globalController.mAppBgMode.value == 1
                ? Image.asset('assets/images/road/light/xuanzhuo_btn_hlsz.png')
                : Image.asset('assets/images/road/light/xuanzhuo_btn_hlsz.png'),
            padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
          ),
          Text(
            "好路设置",
            style: TextStyle(
                fontSize: 12,
                color: globalController.mAppBgMode.value == 1
                    ? AppColors.lightTextColor02
                    : AppColors.darkTextColor02),
          )
        ],
      );
    });
  }
}
