import 'package:flutter/material.dart';
import 'package:flutter_main/pages/play/switch_games/cell/hy_button.dart';
import 'package:get/get.dart';

import '../../../../utils/hex_color.dart';

class PopupMenuUtil {
  static Future showPopupMenu(BuildContext context, List<TapItem> items,
      {initialValue}) {
    final List<PopupMenuItem> popupMenuItems = <PopupMenuItem>[];

    for (TapItem item in items) {
      PopupMenuItem popupMenuItem = PopupMenuItem(
        padding: const EdgeInsets.all(1),
        child: Builder(
          builder: (BuildContext context0) {
            return HYButton(
              item.text,
              isSelect: item.text == initialValue,
              onTap: () {
                if (item.onTap != null) {
                  Get.back();
                  item.onTap!();
                }
              },
            );
          },
        ),
      );
      popupMenuItems.add(popupMenuItem);
    }

    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;

    // 获取按钮的 RenderBox
    final RenderBox button = context.findRenderObject() as RenderBox;

    // 计算按钮在全局坐标中的位置
    final Offset buttonPosition =
        button.localToGlobal(Offset.zero, ancestor: overlay);

    // 计算菜单的位置
    final RelativeRect position = RelativeRect.fromLTRB(
      buttonPosition.dx + button.size.width, // 左边距
      buttonPosition.dy - button.size.height, // 上边距
      button.size.width, // 右边距
      buttonPosition.dy, // 下边距
    );

    return showMenu(
      context: context,
      position: position,
      items: popupMenuItems,
      initialValue: initialValue,
      color: HexColor.ColorHex('#252B3D'),
      // useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class TapItem {
  final String img;
  final String text;
  final GestureTapCallback? onTap;

  const TapItem({this.img = '', this.text = '', this.onTap});
}
