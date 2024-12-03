import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_main/api/api_service.dart';
import 'package:flutter_main/components/custom_button.dart';
import 'package:flutter_main/configs/app_colors.dart';
import 'package:flutter_main/configs/app_images.dart';
import 'package:flutter_main/configs/app_svgs.dart';
import 'package:flutter_main/controllers/global_controller.dart';
import 'package:flutter_main/utils/toast_util.dart';
import 'package:flutter_main/widgets/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingNicknameDialog extends StatefulWidget {

  /// modifyCount: 如果未null表示是设置昵称，否则是修改昵称
  static void show({int? modifyCount}) async {
    SmartDialog.show(builder: (context) {
      return SettingNicknameDialog(modifyCount: modifyCount,);
    }, alignment: Alignment.center, keepSingle: true);
  }

  final int? modifyCount;

  const SettingNicknameDialog({super.key, this.modifyCount});

  @override
  State<SettingNicknameDialog> createState() => SettingNicknameDialogState();
}

class SettingNicknameDialogState extends State<SettingNicknameDialog> {
  final bool isDark = GlobalController.controller.isDark;

  final nickNameController = TextEditingController();

  /// 输入框是否为空
  bool isEmpty = true;

  @override
  initState() {
    super.initState();
    nickNameController.addListener(() {
      setState(() {
        isEmpty = nickNameController.text.isEmpty;
      });
    });
  }

  @override
  dispose() {
    nickNameController.dispose();
    super.dispose();
  }

  onDone() async {
    if (widget.modifyCount != null && widget.modifyCount == 0) {
      ToastUtil.showToast("本月修改昵称次数已用完");
      return;
    }
    await ApiService.modifyNickname(nickname: nickNameController.text);
    SmartDialog.dismiss();
  }

  generateNickName() async {
    String newNickname = await ApiService.generateNickName();
    nickNameController.text = newNickname;
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      height: 46.h,
      child: Row(children: [
        SizedBox(width: 14.w,),
        CustomButton(
          onPressed: () {
            SmartDialog.dismiss();
          },
          child: Icon(Icons.close_sharp, size: 22, color: isDark ? const Color(0xFFDCDCDC) : const Color(0xFFA8B4C7)),),
        const Spacer(),
        Text(widget.modifyCount == null ? '设置昵称' : '修改昵称', style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 17, fontWeight: FontWeight.w500),),
        const Spacer(),
        const SizedBox(width: 22, height: 22,),
        SizedBox(width: 14.w,),
      ],),
    );
  }

  Widget inputTextFieldWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 10.h, bottom: 20.h),
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: isDark ? const Color(0xFF303B54) : const Color(0xFFD5DDE3)),
        borderRadius: BorderRadius.circular(4.r),
        color: isDark ? const Color(0xFF1F2433) : Colors.white
      ),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        SizedBox(width: 8.w,),
        Expanded(child: TextField(
          controller: nickNameController,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(16)
          ],
          cursorColor: AppColors.textColor01(isDark),
          decoration: const InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              filled: false,
              fillColor: Colors.blue
          ),
          style: TextStyle(fontSize: 16.sp, color: isDark ? const Color(0xFFDCDCDC) : const Color(0xFFA8B4C7), fontWeight: FontWeight.w400),
          keyboardType: TextInputType.text,
        )),
        Text('${nickNameController.text.length}/16', style: TextStyle(fontSize: 12.sp, color: isDark ? const Color(0xFFDCDCDC) : const Color(0xFFA8B4C7)),),
        SizedBox(width: 8.w,),
      ],),
    );
  }

  Widget buttonsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 20.h),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Expanded(child: CustomButton(
          onPressed: generateNickName,
          height: 48.h,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.roundButtonBg01_36With(isDark: isDark)), fit: BoxFit.fill)
          ),
          child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(width: 20.w, height: 20.w, child: Image.asset(AppImages.diceIcon, fit: BoxFit.cover,),),
            SizedBox(width: 5.w,),
            Text('随机生成', style: TextStyle(color: AppColors.textColor01(isDark), fontSize: 14),)
          ],)
        )),
        SizedBox(width: 5.w,),
        Expanded(child: CustomButton(
          onPressed: isEmpty ? null : onDone,
          height: 48.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(isEmpty ? AppImages.roundButtonBg03_36With(isDark: isDark) : AppImages.roundButtonBg02_36With(isDark: isDark)),
              fit: BoxFit.fill),
          ), child: Center(child: Text('确定', style: TextStyle(fontSize: 14, color: isEmpty ? const Color(0xFF7C85A0) : Colors.white),),),
        ))
      ],),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 302.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: isDark ? const Color(0xFF252B3D) : const Color(0xFFF4F8FF)
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _header(),
        // widget
        if (widget.modifyCount != null)
          ...[
            SizedBox(height: 4.h,),
            Text('本月可用修改次数: ${widget.modifyCount!}次', style: TextStyle(fontSize: 14, color: AppColors.textColor02(isDark)),)
          ],
        inputTextFieldWidget(),
        buttonsWidget()
      ],),
    );
  }
}