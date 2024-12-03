
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DateRangeSelectorDialog extends StatefulWidget {
  const DateRangeSelectorDialog({super.key});

  static Future<(String, String)?> show() async {
    return SmartDialog.show<(String, String)?>(builder: (context) {
      return const DateRangeSelectorDialog();
    }, alignment: Alignment.bottomCenter, keepSingle: true);
  }

  @override
  DateRangeSelectorDialogState createState() => DateRangeSelectorDialogState();

}

class DateRangeSelectorDialogState extends State<DateRangeSelectorDialog> {

  final GlobalController globalController = GlobalController.controller;

  int _startIndex = 0;
  int _endIndex = 0;

  // 生成日期列表
  List<String> _generateDateList() {
    List<String> dateList = [];
    for (int i = 0; i < 365; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      String formattedDate = "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}";
      dateList.add(formattedDate);
    }
    return dateList;
  }

  // 将数字转为两位
  String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  Widget datePicker(String title, int selectedIndex, ValueChanged<int> onSelectedItemChanged) {
    List<String> dateList = _generateDateList();
    Color selectedColor = globalController.isDark ? const Color(0xFF337AF8) : const Color(0xFF1C386C);
    Color normalColor = AppColors.textColor02(globalController.isDark);
    List<Widget> children = List<Widget>.generate(dateList.length, (index) {
      return Center(
        child: Text(
          dateList[index],
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400, color: index == selectedIndex ?  selectedColor : normalColor ),
        ),
      );
    });
    return Column(mainAxisSize: MainAxisSize.max, children: [
      SizedBox(
        width: double.infinity, 
        height: 30, 
        child: Center(child: Text(
          title,
          style: TextStyle(
              color: AppColors.textColor01(globalController.isDark),
              fontSize: 14,
              fontWeight: FontWeight.w400),),),),
      Expanded(child: CupertinoPicker(
          itemExtent: 44,
          onSelectedItemChanged: onSelectedItemChanged,
          children: children))
    ],);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = globalController.isDark;
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.pageBackgroundColor(isDark),
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
      ),
      child: Column(children: [
        SizedBox(
          width: double.infinity,
          height: 46,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text('取消', style: TextStyle(color: AppColors.textColor02(isDark), fontSize: 14, fontWeight: FontWeight.w400),)),
              Expanded(child: Text(
                '日期范围',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 17, fontWeight: FontWeight.w500),)),
              TextButton(
                  onPressed: () {},
                  child: Text('确定', style: TextStyle(color: isDark ? const Color(0xFF337AF8) : const Color(0xFF1C386C), fontSize: 14, fontWeight: FontWeight.w400),))
            ],
          ),
        ),
        Expanded(child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: datePicker("开始日期" , _startIndex, (index) {
              setState(() {
                _startIndex = index;
              });
            })),
            Expanded(child: datePicker("截止日期", _endIndex, (index) {
              setState(() {
                _endIndex = index;
              });
            }))
          ],
        ))
      ],),
    );
  }

}





//
// enum UserAgreeDialogAction {
//   cancel,
//   done,
//   lookUserAgreement,
//   lookPrivacyPolicy
// }
//
// class UserAgreeDialog extends StatelessWidget {
//   const UserAgreeDialog({super.key});
//
//   static Future<UserAgreeDialogAction> show() async {
//     var result = await SmartDialog.show<UserAgreeDialogAction?>(
//         useAnimation: true,
//         backDismiss: false,
//         clickMaskDismiss: false,
//         builder: (context) {
//           return const UserAgreeDialog();
//         }
//     );
//     return result ?? UserAgreeDialogAction.cancel;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     AppFontSizeProvider appFontSizeProvider = context.read<AppFontSizeProvider>();
//     return NormalDialog(
//       title: "提示",
//       content: RichText(
//         textAlign: TextAlign.center,
//         text: TextSpan(
//             style: appFontSizeProvider.bodyTextStyle,
//             children: [
//               const TextSpan(text: "请先同意 "),
//               TextSpan(text: "用户协议",
//                   style: const TextStyle(color: AppColors.primaryColor),
//                   recognizer: TapGestureRecognizer()..onTap = () {
//
//                   }
//               ),
//               const TextSpan(text: " 和 "),
//               TextSpan(text: "隐私政策",
//                   style: const TextStyle(color: AppColors.primaryColor),
//                   recognizer: TapGestureRecognizer()..onTap = () {
//
//                   }
//               ),
//             ]),
//       ),
//       onCancel: () {
//         SmartDialog.dismiss(result: UserAgreeDialogAction.cancel);
//       },
//       onDone: () {
//         SmartDialog.dismiss(result: UserAgreeDialogAction.done);
//       },
//     );
//   }
// }