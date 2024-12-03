import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_main/pages/home/home_router.dart';
import 'package:flutter_main/utils/utils.dart';
import 'package:get/get.dart';

import '../../../api/api_service.dart';
import '../../../models/common/user_info/activity_data.dart';
import 'state.dart';

class PromoLogic extends GetxController {
  final PromoState state = PromoState();

  late EasyRefreshController eController;

  int page = 1;
  int totalNum = 0;

  // 当前
  int page1 = 1;
  int totalNum1 = 0;
  var cList = <Activity>[];

  // 历史
  int page2 = 1;
  int totalNum2 = 0;
  var hList = <Activity>[];

  @override
  void onReady() {}

  @override
  void onInit() async {
    super.onInit();
    eController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    await refreshData();
  }

  @override
  void onClose() {
    eController.dispose();
    super.onClose();
  }

  tabSelect(int index) async {
    debugPrint('click ${index}');
    if (index == 3) {
      page = page2;
      state.list.value = hList;
    } else {
      page = page1;
      state.list.value = cList;
    }
    state.selectId.value = index;
    if (state.list.isEmpty) {
      refreshData();
    }
  }

  listItemClick(String url) {
    NavigatorUtil.push(HomeRouter.webView, arguments: {
      'url': url,
    });
  }

  /// request
  refreshData() {
    page = 1;
    if (state.selectId.value == 3) {
      page2 = 1;
    } else {
      page1 = 1;
    }
    getRunningActivityTypeRequest();
  }

  loadMoreData() {
    if (state.selectId.value == 0) {
      if (state.list.length >= totalNum2) {
        return;
      }
      page2++;
      page = page2;
    } else {
      if (state.list.length >= totalNum1) {
        return;
      }
      page1++;
      page = page1;
    }
    getRunningActivityTypeRequest();
  }

  getRunningActivityTypeRequest() async {
    int type = state.selectId.value;
    try {
      final res = await ApiService.getRunningActivityType(
        pageIndex: page,
        searchType: type,
      );
      if (res.isSuccess) {
        final activity = ActivityData.fromJson(res.data);
        List<Activity> temp = activity.record ?? [];
        if (state.selectId.value == 3) {
          totalNum1 = activity.totalRecord ?? 0;
          if (page == 1) {
            hList = temp;
          } else {
            hList += temp;
          }
          state.list.value = hList;
        } else {
          totalNum2 = activity.totalRecord ?? 0;
          if (page == 1) {
            cList = temp;
          } else {
            cList += temp;
          }
          state.list.value = cList;
        }
      }
      antionEnd();
    } catch (error) {
      Loading.error(error.toString());
      antionEnd();
    }
  }

  /// 刷新完后，状态变更
  antionEnd() {
    if (page == 1) {
      eController.finishRefresh();
    } else {
      eController.finishLoad();
    }
    if (state.list.length >= totalNum) {
      eController.finishLoad(IndicatorResult.noMore);
    }
  }
}
