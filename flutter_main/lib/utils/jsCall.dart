import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

// JS运行时初始化
final JavascriptRuntime javascriptRuntime =
    getJavascriptRuntime(forceJavascriptCoreOnAndroid: false);

// JS执行入口
Future<String> executeJS(String name, String fun, List<dynamic> args) async {
  // 加载地址
  String code = await rootBundle.loadString('assets/js/$name.js');

  // 处理字符串加上"
  var result = args.map((item) {
    if (item is String) {
      return "${json.encode(item)}";
    } else {
      return item;
    }
  }).toList();
  String para = result.join(',');

  // 函数执行
  JsEvalResult jsResult = await javascriptRuntime.evaluateAsync(
    """
    $code;
    dataHandle().default.$fun($para);
    """,
    sourceUrl: 'script.js',
  );

  javascriptRuntime.executePendingJob();
  JsEvalResult asyncResult = await javascriptRuntime.handlePromise(jsResult);
  return asyncResult.stringResult;
}


// ERROR: Unexpected token '}'. Expected an identifier as property name. 
//   at undefined