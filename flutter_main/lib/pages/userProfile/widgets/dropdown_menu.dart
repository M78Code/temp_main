
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key, required this.menuStart, this.onClose});
  /// 菜单起点
  final Offset menuStart;
  final VoidCallback? onClose;

  @override
  State<StatefulWidget> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  final GlobalController globalController = GlobalController.controller;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = Tween<double>(
      begin: 0,
      end: 1
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });

  }

  _dismiss() {
    _animationController.reverse().then((_) {
      widget.onClose?.call();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0, right: 0, top: 0, bottom: 0,
      child: GestureDetector(
        onTap: () {
          _dismiss();
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(top: widget.menuStart.dy),
          child: Stack(children: [
            AnimatedBuilder(animation: _animationController, builder: (ctx, child) {
              return FadeTransition(opacity: _animation, child: Container(color: Colors.black26,),);
            }),
            AnimatedBuilder(animation: _animation, builder: (ctx, child) {
              return SizeTransition(
                sizeFactor: _animation,
                child: SlideTransition(position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: Offset.zero
                ).animate(_animation), child: child,),
              );
            }, child: Container(
              width: double.infinity,
              height: 100,
              color: AppColors.pageBackgroundColor(globalController.isDark),),
            )
          ],),
        ),
      ),
    );
  }
}

Future<int?> showDropdownMenu(BuildContext context, { required GlobalKey tapKey }) {
  RenderBox? renderBox = tapKey.currentContext?.findRenderObject() as RenderBox?;
  if (renderBox == null) return Future.value(null);
  Completer<int?> completer = Completer();
  Offset position = renderBox.localToGlobal(Offset.zero);
  Offset menuStart = Offset(position.dx, position.dy + renderBox.size.height);
  OverlayEntry? entry;
  entry = OverlayEntry(builder: (context) {
    return DropdownMenu(menuStart: menuStart, onClose: () {
      entry?.remove();
      completer.complete(null);
    },);
  });
  Overlay.of(context).insert(entry);
  return completer.future;
}

// Future<int?> showDocumentOverlay(BuildContext context,
//     {required GlobalKey tapKey,
//       required CurrentProjViewModel projViewModel}) async {
//   RenderBox? renderBox =
//   tapKey.currentContext?.findRenderObject() as RenderBox?;
//   if (renderBox == null) {
//     return null;
//   }
//   Completer<int?> completer = Completer();
//   Offset position = renderBox.localToGlobal(Offset.zero);
//   Offset menuOffset = Offset(position.dx, position.dy + renderBox.size.height);
//   OverlayEntry? entry;
//   entry = OverlayEntry(
//     builder: (context) {
//       return DocumentMenu(
//         projViewModel: projViewModel,
//         menuOffset: menuOffset,
//         onDismiss: () {
//           entry?.remove();
//           completer.complete(null);
//         },
//         onDone: (value) {
//           entry?.remove();
//           completer.complete(value);
//         },
//       );
//     },
//   );
//   Overlay.of(context).insert(entry);
//   return completer.future;
// }
