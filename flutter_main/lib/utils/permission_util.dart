// import 'package:permission_handler/permission_handler.dart';
//
// /// 根据业务需要 封装权限相关操作
// class PermissionUtil {
//
//   static Future<bool> checkPermission(Permission permission) async {
//     String permissionName = '';
//
//     if (permission == Permission.photos) {
//       permissionName = 'Photos';
//     } else if (permission == Permission.camera) {
//       permissionName = 'Camera';
//     } else if (permission == Permission.microphone) {
//       permissionName = 'Microphone';
//     }
//     final status = await permission.request();
//     if (status != PermissionStatus.granted) {
//       // 用户未授权，可能需要提示用户为何需要此项权限
//       return false;
//     }
//     return true;
//   }
// }