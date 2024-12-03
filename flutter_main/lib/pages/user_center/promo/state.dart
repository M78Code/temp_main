import 'package:get/get.dart';

import '../../../models/common/user_info/activity_data.dart';

class PromoState {
  PromoState() {
    ///Initialize variables
  }

  //1-可以展示的 2-正在进行的 3-历史, null或者小于等于0代表查询所有
  RxInt selectId = 1.obs;

  var list = <Activity>[].obs;
}
