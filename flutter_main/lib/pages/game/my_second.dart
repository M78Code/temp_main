import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:flutter_js/javascript_runtime.dart';
import 'package:flutter_js/js_eval_result.dart';
import 'package:flutter_main/pages/history/my_third.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen2 extends StatelessWidget {
  const MainScreen2({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(context,
                      screen: const MainScreen3());
                },
                child: const Text(
                  "Go to Third Screen",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Go Back to First Screen",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
}

// class CustomWidgetExamples extends StatefulWidget {
//   const CustomWidgetExamples({super.key});

//   @override
//   State<CustomWidgetExamples> createState() => _FlutterJsHomeScreenState();
// }

// class _FlutterJsHomeScreenState extends State<CustomWidgetExamples> {
//   String _jsResult = '';

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   javascriptRuntime.setInspectable(true);
//   //   javascriptRuntime.onMessage('getDataAsync', (args) async {
//   //     await Future.delayed(const Duration(seconds: 1));
//   //     final int count = args['count'];
//   //     Random rnd = Random();
//   //     final result = <Map<String, int>>[];
//   //     for (int i = 0; i < count; i++) {
//   //       result.add({'key$i': rnd.nextInt(100)});
//   //     }
//   //     return result;
//   //   });
//   //   javascriptRuntime.onMessage('asyncWithError', (_) async {
//   //     await Future.delayed(const Duration(milliseconds: 100));
//   //     return Future.error('Some error');
//   //   });
//   // }

//   // @override
//   // void dispose() {
//   //   javascriptRuntime.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FlutterJS Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'JS Evaluate Result:\n\n$_jsResult\n',
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // const Padding(
//             //   padding: EdgeInsets.all(10),
//             //   child: Text(
//             //       'Click on the big JS Yellow Button to evaluate the expression bellow using the flutter_js plugin'),
//             // ),
//             // const Padding(
//             //   padding: EdgeInsets.all(8.0),
//             //   child: Text(
//             //     "Math.trunc(Math.random() * 100).toString();",
//             //     style: TextStyle(
//             //         fontSize: 12,
//             //         fontStyle: FontStyle.italic,
//             //         fontWeight: FontWeight.bold),
//             //   ),
//             // ),
//             // ElevatedButton(
//             //   onPressed: () => Navigator.of(context).push(
//             //     MaterialPageRoute(
//             //       builder: (ctx) => AjvExample(
//             //           //widget.javascriptRuntime,
//             //           javascriptRuntime),
//             //     ),
//             //   ),
//             //   child: const Text('See Ajv Example'),
//             // ),
//             // SizedBox.fromSize(size: const Size(double.maxFinite, 20)),
//             // ElevatedButton(
//             //   child: const Text('Fetch Remote Data'),
//             //   onPressed: () async {
//             //     var asyncResult = await javascriptRuntime.evaluateAsync("""
//             //     fetch('https://raw.githubusercontent.com/abner/flutter_js/master/FIXED_RESOURCE.txt').then(response => response.text());
//             //   """);
//             //     javascriptRuntime.executePendingJob();
//             //     final promiseResolved =
//             //         await javascriptRuntime.handlePromise(asyncResult);
//             //     var result = promiseResolved.stringResult;
//             //     setState(() => _quickjsVersion = result);
//             //   },
//             // ),
//             // Text(
//             //   'QuickJS Version\n${_quickjsVersion ?? '<NULL>'}',
//             //   textAlign: TextAlign.center,
//             // )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         //backgroundColor: Colors.transparent,
//         child: Image.asset('assets/js.ico'),
//         onPressed: () async {
//           final result = await executeJS('test', 'test', [1, 23, 3]);
//           // if (!mounted) return;
//           setState(() {
//             _jsResult = result;
//           });
//         },
//       ),
//     );
//   }
// }
