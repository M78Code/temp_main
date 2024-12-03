import 'package:flutter/material.dart';
import 'package:flutter_main/app.dart';
import 'package:flutter_main/utils/utils.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil().init();

  runApp(const App());
}
