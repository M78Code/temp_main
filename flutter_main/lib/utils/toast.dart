import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SuccessToast extends StatelessWidget {
  const SuccessToast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.done,
      color: Colors.white,
    );
  }
}

class ErrorToast extends StatelessWidget {
  const ErrorToast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.close,
      color: Colors.white,
    );
  }
}

class InfoToast extends StatelessWidget {
  const InfoToast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.info,
      color: Colors.white,
    );
  }
}

class WarningToast extends StatelessWidget {
  const WarningToast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.warning,
      color: Colors.white,
    );
  }
}

successToast({msg = '提交成功'}) {
  EasyLoading.show(status: msg, indicator: const SuccessToast());
  Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      EasyLoading.dismiss();
    },
  );
}

errorToast({msg = '提交失败'}) {
  EasyLoading.show(status: msg, indicator: const ErrorToast());
  Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      EasyLoading.dismiss();
    },
  );
}

infoToast({msg = '信息'}) {
  EasyLoading.show(status: msg, indicator: const InfoToast());
  Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      EasyLoading.dismiss();
    },
  );
}

warningToast({msg = '警告'}) {
  EasyLoading.show(status: msg, indicator: const WarningToast());
  Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      EasyLoading.dismiss();
    },
  );
}
