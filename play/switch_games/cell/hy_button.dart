import 'package:flutter/material.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/utils/base/base_container.dart';

import '../../../../generated/r.dart';
import '../../../../utils/base/base_text.dart';

class HYButton extends StatefulWidget {
  HYButton(this.name,
      {this.isSelect = false,
      this.onTap,
      this.margin = const EdgeInsets.only(
        right: 16,
      ),
      this.width = 80});

  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final double? width;
  bool isSelect = false;
  String name;

  @override
  _HYButtonState createState() {
    return _HYButtonState();
  }
}

class _HYButtonState extends State<HYButton> {
  @override
  Widget build(BuildContext context) {
    Color selectCorlor = Colors.white;
    Color unselectCorlor =
        GlobalController.CheckWhiteBlack(Color(0xFF7288A9), Color(0xFF73787E));
    String selectStr = GlobalController.CheckWhiteBlack(
        R.gemaLightBtSelect, R.gemaDarkBtSelect);
    String unselectStr = GlobalController.CheckWhiteBlack(
        R.gemaLightBtUnselect, R.gemaDarkBtUnselect);
    return HYContainer(
      margin: widget.margin,
      backgroundImage: widget.isSelect ? selectStr : unselectStr,
      backgroundImageFit: BoxFit.fill,
      centerSlice: const Rect.fromLTRB(20, 10, 260, 74),
      // padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      // width: widget.width,
      // height: 28,
      onTap: widget.onTap,
      alignment: Alignment.center,
      constraints: const BoxConstraints(minWidth: 80, minHeight: 28),
      child: ZsText(
        widget.name,
        fontSize: 12,
        color: widget.isSelect ? selectCorlor : unselectCorlor,
      ),
    );
  }
}
