import 'package:flutter/material.dart';
import 'package:flutter_main/net/socket/base/URLManager.dart';
import 'package:flutter_main/api/api_service.dart';
import 'package:flutter_main/models/common/base_response.dart';
import 'package:flutter_main/net/socket/crypto/WebSocket.dart';
import 'package:flutter_main/pages/game/my_second.dart';
import 'package:flutter_main/components/screen/modal_screen.dart';
import 'package:flutter_main/pages/road/my_list.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

late BuildContext tecon;

class MainScreen extends StatelessWidget {
  const MainScreen({
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

  _getOrderList() async {
    // await Wheat.wheatOrderListApi({'deviceType': 1, 'platformType': 1});
    // UrlManager.initialize(
    //     'https://pc.dpzrfat6.com/?params=q7hS7q03+yAp16ec4LNbcCxNY4SsLKS3NV3rQvnlnuh8Y9uRvsdPTkSap2OtBlDzERote5wqIzbhypnYPWxWf4xo3HaGN0dBLyb8luPL8rflJHgSu2vfDqJLhDkLBhtnXhZoOk+UkD2K+va3Ndkk55UHT+eeYcuHd3jihe3U288z31WZ6sK+3713P5IU3SouIrzCvKo3miatO3Jz2Qabe9VzQZmqNxzLVdwT7IteyXEgLSaHvK4ZxmnnqIU3z3pGLbn0RocNuURxNyrJK9SCua/y/TbkYH5SkRl7ao9h3+9OlJaCGXmQFyIQJVAWjUKpr30TCy40OY+MAh/ozuxvp2f3Wso0EuH0VbwnrIYxPjGsSJWg60MMgibnpLxmDB6qArB8OHFH4mATvGEUMHVIZHKA4IPP0bWp35agrGid9OKjGPZ0YQvh9f0TYNs7yiEgnu9xGkz2TBEK8sE5u4x2S3Iq4Kx34Akt5kylKolqTiOCBGBMeUZp0HP6FHkC5pbxUvEqdecPJsVAH4iMHVWXjp7e2ONBP65DtchqmZMiFe7Tbep2A1BNigDEEar5I+mVa/vxmLQNyrqFYuq18jZY7KrRq56xrhKZTUaqHY2ZfFPMrA7kkU9G7gcvvkfrHyLphmHahzkGpj1qdR5Zm9y/KweLxEQ15IEpOooaYrite1jVcwo+y4sAYdyiGeHqPV8MkVmtICQWPKcAl9yO8N7DC7PMvt4Tn3q2dctog9F1cFObxkwAHqRlugdxX1TJj0A2Z8XGZXl64iGD5sOdA7kk3zRng7TkHEZ/1Zdm4EZ0no8cdrZtWlwNQ3IO+cjiZ3SZJr5hfsZawO/FNgUJIDEzLl8rEN+Kj7Lt9XO+zztPaGueCb8xKJv5gbUp6y7b0SSaWeMG/Y6k2GpUW18rba5BzR8j98g+8ZHv1ZKNu79FtgIfMYUEd6OKkbBj5fAQ7ZmA+hED7/UsueWy1fTmnSo/wKthB/GispUKE53i7cOoalZVe8oyuO5F5+Z+jSp2GVBUi2pvhZvTDwm4g08A/jotO7QHbS/f82ivezazSm1B7zTcLNysqrsiFB7pe3R7nr9/ogcSeuqjjCh0mJgMMqOxTBAwJvj4FckBIqiqOQybh4ETrKwC0r3zWi0Vtrz3aPUV6+ARKECS0QcU7Db3xAaD+MqK7rHjy22/VHirRYSs4tEw5NFp1/6oNFCwnDx6X8INpAkl+yZp4mlm2rGHAYWfkioHcwjbojad3utszDaCfAo=&signature=7846B9E9B39AFB205D0778E7315569B0&ttl=1726120288014');
    // BaseResponse response = await ApiService.wheatOrderListApi(1, 1);
    // LogUtil.log("_getOrderList-isSuccess=${response.isSuccess}");

    // String pcLoginBackUrl =
    //     'https://pc.dpzrfat6.com/?params=LeIke74M4S+HJaUtV9UdMI2ZVANDhuJHLvpisR9HX/+JRL7aldIYSzdNtCICkEEPcRQM/5XDRUsnACPuL4q5+UQWWZCkFTjNJqAErmJHu6Wi2TQ/b6EuxESzhs+4ffgPcTAI62p0jR4LkHTdrk0PF45+HGnv+2eku8ZEHDS1NsHPoiC8qD949dVeF1XfBszSHDXSfu2ovo1aG8qsrk7kSeKAFfL74QN6LUdVHHjcOsps/yYxUctAi8ezahV+9n7lKUv0aClqgy1utj91XXPTPVotrtM/Hpy9O4vcTc4+zDtpZ8TLz9s0drq6OvVe4VmBbGG+dGwD+a9KjFBgI/PPUF8JjEaEn7OK8LtBV3DFiG3knEPVH94eYY+dZ3BoeJ14hK6Js4zeYqzf5wr4KwHmEMGwX7sgzJ9A7WfxfGsU+25hZsfSnG/pq6gz5QWNO2jh6MFlsXtRhZkgoyGyKwdnz0Zrh9UaVXfIh6ebEa38nXh+uPW0rcofw2vTqp/YOCtb583vX4dRsO0ocgXxeP/yzU27ST2GpCfpTfhnJgqPHp5XWyvK+fd4UBtMb8E3fL4SXqdjaZqOqnid1BQBJ4QHV2OgB/FjbqmATRTMzviFtRqEGh4aWHlOnYDbMYeqMu0cjaPzkGGamh4XsNflm6fY/QvkVmeZry6zS9Lu8fYOZ/izyn3DKTKzZaK+TbFnp7FKWYLxtyWtAYKtWp7XkKPS45sodg7hTGKp0wZKPfeRhZAViPzLHTJ0f7USI6l7OJCtCzEPAcauAG4RNkVuvgWptsNG0qNAH8glX7SAV2+YGWxHtVAotznSCC4EKJQiwcF7SajF573ZX1D4oLHVsC67XNLMg4fW3mgaXqOk2mVCzNKkDZ2M3Ua3gsxBi/ABII3y2zN1k8b+h9+RB9W2UJePBOIgKmUGVMZwhRsw9BsjYk+YBsIVWKAh0rOK9RhoVJv7/8SCpBwSoqw7PoNguuiRv/oGJJseet+oXCtWyhLHN5LdsJRBlzya1bBVXY3ZGuk8JE24bZW2n+r+U2x5cAVEWQnoI334QxTT2l+F0G/M2AId8aJwcZjJMrapHw1uU7y/GsVCHl5aUykaHW4JzooDkCXZ1fB2W0BYz0PcM+a2oMN/ht56bRzQ1iRkrHEwmSPvpV2jrOHRDmeqjy2lQe2mss/35TZ3oHBu0xRkJR2/m1Np3wuA0DUhhmqU1WqaWPY4dkK6tH1ESYpOV1BfK3h5h/yzkVfYHO/BmaYydLcFiCk=&signature=3F2CD3283DDC122188017A38B761509E&ttl=1726386010881';

    // //  UrlManager 初始化
    // await UrlManager.initialize(pcLoginBackUrl);

    // // ignore: use_build_context_synchronously
    // var dataInfo = Provider.of<WebSocketProvide>(tecon).init();
    // print(dataInfo);
  }

  @override
  Widget build(final BuildContext context) {
    tecon = context;
    return SingleChildScrollView(
      controller: scrollController,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 6,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Test Text Field"),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  // onPressed: () {
                  //   PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  //     context,
                  //     settings: const RouteSettings(name: "/home"),
                  //     screen: const MainScreen2(),
                  //     pageTransitionAnimation:
                  //         PageTransitionAnimation.scaleRotate,
                  //   );
                  //   // PersistentNavBarNavigator.pushNewScreen(context,
                  //   //     screen: const CustomWidgetExamples());
                  // },
                  onPressed: _getOrderList,
                  child: const Text(
                    "Go to Second Screen ->",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    //   context,
                    //   settings: const RouteSettings(name: "/home"),
                    //   screen: const MainScreen2(),
                    //   pageTransitionAnimation:
                    //       PageTransitionAnimation.scaleRotate,
                    // );
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: const MainScreenList(
                          title: 'this is a list page',
                        ));
                  },
                  child: const Text(
                    "Go to List Screen ->",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: true,
                      builder: (final context) => Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Exit",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Push bottom sheet on TOP of Nav Bar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: false,
                      builder: (final context) => Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Exit",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Push bottom sheet BEHIND the Nav Bar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushDynamicScreen(context,
                        screen: SampleModalScreen(), withNavBar: true);
                  },
                  child: const Text(
                    "Push Dynamic/Modal Screen",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: onScreenHideButtonPressed,
                  child: Text(
                    hideStatus
                        ? "Reveal Navigation Bar"
                        : "Hide Navigation Bar",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(menuScreenContext).pop();
                  },
                  child: const Text(
                    "<- Main Menu",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 30),
                if (showNavBarStyles)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Navigation Bar Style",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 4,
                        children: List.generate(
                          NavBarStyle.values.length,
                          (final index) => ElevatedButton(
                            onPressed: () => onNavBarStyleChanged
                                ?.call(NavBarStyle.values[index]),
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.teal)),
                            child: Text(
                              NavBarStyle.values[index].name.toUpperCase(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
