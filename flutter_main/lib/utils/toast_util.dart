import 'package:fluttertoast/fluttertoast.dart';

///Fluttertoast.showToast(
//               msg: "This is Centered Toast",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.CENTER,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0
//             ),
class ToastUtil {
  static void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
    );
  }

  static void showCenterToast(String text) {
    Fluttertoast.showToast(msg: text, gravity: ToastGravity.CENTER);
  }
}
