import 'package:flutter/material.dart';
import 'package:flutter_main/widgets/gaps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/global_controller.dart';

class RoadHomeStyleChoosePage extends StatefulWidget {
  const RoadHomeStyleChoosePage({super.key});

  @override
  State<RoadHomeStyleChoosePage> createState() =>
      _RoadHomeStyleChoosePageState();
}

class _RoadHomeStyleChoosePageState extends State<RoadHomeStyleChoosePage> {
  GlobalController controller = GlobalController.controller;

  void onItemClick(int modeType) {
    controller.modeType.value = modeType;
    navigator?.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().setWidth(360),
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
                title: Text('game_desk_chose'.tr,
                    style: TextStyle(
                        fontSize: 18,
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
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ModeSelectView(margin: EdgeInsets.only(top: 10), children: [
                      modeSelectItem(
                        onPressed: () => onItemClick(4),
                        isActive: controller.modeType.value == 4,
                        icon:
                            'assets/images/modeSelect/com_pic_xianchangmoshi.png',
                        title: 'mode_type_xc'.tr,
                        desc: 'mode_desc_xc'.tr,
                      ),
                      modeSelectItem(
                          onPressed: () => onItemClick(1),
                          isActive: controller.modeType.value == 1,
                          icon:
                              'assets/images/modeSelect/com_pic_heguanmoshi.png',
                          title: 'mode_type_hg'.tr,
                          desc: 'mode_desc_jj'.tr,
                          margin: EdgeInsets.only(left: 15))
                    ]),
                    ModeSelectView(margin: EdgeInsets.only(top: 15), children: [
                      modeSelectItem(
                        onPressed: () => onItemClick(3),
                        isActive: controller.modeType.value == 3,
                        icon: 'assets/images/modeSelect/com_pic_luzhimoshi.png',
                        title: 'mode_type_jj'.tr,
                        desc: 'mode_desc_jj'.tr,
                      ),
                      modeSelectItem(
                          onPressed: () => onItemClick(2),
                          isActive: controller.modeType.value == 2,
                          icon:
                              'assets/images/modeSelect/com_pic_jijianmoshi.png',
                          title: 'mode_type_lz'.tr,
                          desc: 'mode_desc_lz'.tr,
                          margin: EdgeInsets.only(left: 15))
                    ])
                  ]),
            )),
      ),
    );
  }

  Widget modeSelectItem(
      {required VoidCallback onPressed,
      required bool isActive,
      required String icon,
      String title = '',
      String desc = '',
      EdgeInsets margin = EdgeInsets.zero}) {
    LinearGradient linearGradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: controller.checkWhiteBlack(
            [Color(0xff2656B0), Color(0xff0F4AB5), Color(0xff1472C9)],
            [Color(0xff6087D1), Color(0xff0F4AB5), Color(0xff3A9FFD)]));
    return Container(
      width: 158,
      height: 146,
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: controller.checkWhiteBlack(
                Color.fromARGB(214, 221, 225, 235),
                Color.fromARGB(51, 0, 0, 0)),
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        gradient: isActive ? linearGradient : null,
      ),
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: WidgetStateProperty.all(Size(0, 0)),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            shape: WidgetStateProperty.all(BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        child: Stack(
          children: [
            Image(
              width: double.infinity,
              height: double.infinity,
              image: AssetImage(controller.checkWhiteBlack(
                  'assets/images/modeSelect/light/table-pattern-bg.png',
                  'assets/images/modeSelect/dark/table-pattern-bg.png')),
              fit: BoxFit.fill,
            ),
            Image(
              width: double.infinity,
              height: double.infinity,
              image: AssetImage(icon),
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: controller.checkWhiteBlack(
                              Color(0xff1C386C),
                              isActive
                                  ? Color(0xffDCDCDC)
                                  : Color.fromRGBO(220, 220, 220, 0.6)),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  Text(desc,
                      style: TextStyle(
                          color: controller.checkWhiteBlack(
                              Color(0xff1C386C),
                              isActive
                                  ? Color(0xffDCDCDC)
                                  : Color.fromRGBO(220, 220, 220, 0.6)),
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ModeSelectView(
      {required List<Widget> children, EdgeInsets margin = EdgeInsets.zero}) {
    return Container(
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
