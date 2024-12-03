import "package:flutter/material.dart";
import "package:flutter_main/pages/default/my_first.dart";
import "package:flutter_main/pages/game/my_second.dart";
import "package:flutter_main/pages/history/my_third.dart";
import "package:flutter_main/pages/road/road_home_page.dart";
import "package:get/get.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

import "../../controllers/global_controller.dart";

class CustomWidgetExample extends StatefulWidget {
  const CustomWidgetExample({super.key});

  // final BuildContext menuScreenContext;

  @override
  State<CustomWidgetExample> createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  late PersistentTabController _controller;
  late GlobalController _globalController;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
    ScrollController(),
  ];
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _globalController = GlobalController.controller;
    _hideNavBar = false;
  }

  @override
  void dispose() {
    for (final element in _scrollControllers) {
      element.dispose();
    }
    super.dispose();
  }

  List<CustomNavBarScreen> _buildScreens() => [
        CustomNavBarScreen(
          screen: RoadHomePage(
            // menuScreenContext: widget.menuScreenContext,
            scrollController: _scrollControllers[0],
            hideStatus: _hideNavBar,
            showNavBarStyles: false,
            onScreenHideButtonPressed: () {
              setState(() {
                _hideNavBar = !_hideNavBar;
              });
            },
          ),
        ),
        CustomNavBarScreen(
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const MainScreen2(),
              "/second": (final context) => const MainScreen3(),
            },
          ),
          screen: MainScreen(
            // menuScreenContext: widget.menuScreenContext,
            scrollController: _scrollControllers[1],
            hideStatus: _hideNavBar,
            showNavBarStyles: false,
            onScreenHideButtonPressed: () {
              setState(() {
                _hideNavBar = !_hideNavBar;
              });
            },
          ),
        ),
        CustomNavBarScreen(
          screen: MainScreen(
            // menuScreenContext: widget.menuScreenContext,
            scrollController: _scrollControllers[2],
            hideStatus: _hideNavBar,
            showNavBarStyles: false,
            onScreenHideButtonPressed: () {
              setState(() {
                _hideNavBar = !_hideNavBar;
              });
            },
          ),
        ),
        CustomNavBarScreen(
          screen: MainScreen(
            // menuScreenContext: widget.menuScreenContext,
            scrollController: _scrollControllers[3],
            hideStatus: _hideNavBar,
            showNavBarStyles: false,
            onScreenHideButtonPressed: () {
              setState(() {
                _hideNavBar = !_hideNavBar;
              });
            },
          ),
        ),
        CustomNavBarScreen(
          screen: MainScreen(
            // menuScreenContext: widget.menuScreenContext,
            scrollController: _scrollControllers.last,
            hideStatus: _hideNavBar,
            showNavBarStyles: false,
            onScreenHideButtonPressed: () {
              setState(() {
                _hideNavBar = !_hideNavBar;
              });
            },
          ),
        ),
      ];

  // List<PersistentBottomNavBarItem> is just for example here. It can be anything you want like List<YourItemWidget>
  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: getImageWidget('road', isSelected: true),
          inactiveIcon: getImageWidget('road'),
          iconSize: 24,
          title: "好路",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: getImageWidget('game', isSelected: false),
          inactiveIcon: getImageWidget('game'),
          iconSize: 24,
          title: "游戏",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: getImageWidget('histroy', isSelected: false),
          inactiveIcon: getImageWidget('histroy'),
          iconSize: 24,
          title: "历史",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: getImageWidget('table', isSelected: false),
          inactiveIcon: getImageWidget('table'),
          iconSize: 24,
          title: "多台",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: getImageWidget('view', isSelected: false),
          inactiveIcon: getImageWidget('view'),
          iconSize: 24,
          title: "全景",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  Widget getImageWidget(String name, {bool isSelected = false}) {
    return Obx(() {
      String img =
          'assets/images/tabbar/${_globalController.mAppBgMode.value == 2 ? 'dark/night' : 'light/white'}-$name-${isSelected ? 'checked' : 'unchecked'}.png';
      return Image.asset(
        img,
        width: 24,
        height: 24,
        fit: BoxFit.fitWidth,
      );
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        // 此处需要 注释上 每个页面单独去配置 appbar
        // appBar: AppBar(title: const Text("Navigation Bar Demo")),
        // drawer: const Drawer(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Text("This is the Drawer"),
        //       ],
        //     ),
        //   ),
        // ),
        body: PersistentTabView.custom(
          context,
          controller: _controller,
          screens: _buildScreens(),
          itemCount: 5,
          isVisible: !_hideNavBar,
          hideOnScrollSettings: HideOnScrollSettings(
            hideNavBarOnScroll: true,
            scrollControllers: _scrollControllers,
          ),
          backgroundColor: Colors.grey.shade900,
          customWidget: CustomNavBarWidget(
            _navBarsItems(),
            onItemSelected: (final index) {
              //Scroll to top
              if (index > 0) {
                return;
              }
              if (index == _controller.index) {
                _scrollControllers[index].animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }

              setState(() {
                _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
              });
            },
            selectedIndex: _controller.index,
          ),
        ),
      );
}

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
    this.items, {
    required this.selectedIndex,
    required this.onItemSelected,
    final Key? key,
  }) : super(key: key);
  final int selectedIndex;
  // List<PersistentBottomNavBarItem> is just for example here. It can be anything you want like List<YourItemWidget>
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  Widget _buildItem(
          final PersistentBottomNavBarItem item, final bool isSelected) =>
      Container(
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: item.iconSize,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.activeColorPrimary),
                child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                  item.title ?? "",
                  style: TextStyle(
                      color: isSelected
                          ? (item.activeColorSecondary ??
                              item.activeColorPrimary)
                          : item.inactiveColorPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                )),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(final BuildContext context) {
    return Obx(() => Container(
          color: GlobalController.controller.checkWhiteBlack(
            Colors.white,
            Colors.grey.shade900,
          ),
          child: SizedBox(
            width: double.infinity,
            height: kBottomNavigationBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((final item) {
                final int index = items.indexOf(item);
                return Flexible(
                  child: GestureDetector(
                    onTap: () {
                      onItemSelected(index);
                    },
                    child: _buildItem(item, selectedIndex == index),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}
