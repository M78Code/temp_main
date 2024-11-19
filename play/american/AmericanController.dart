import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AmericanModel.dart';
import 'corona_model.dart';

class AmericanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> redAnimation;
  late Animation<Color?> blackAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<int?> imageAnimation;

  late List<CoronaModel> c0;

  late List<CoronaModel> r1;

  late List<CoronaModel> r2;

  late List<CoronaModel> r3;

  late List<CoronaModel> r4;

  late List<CoronaModel> r5;

  final List<Color> colors = [
    Colors.black.withOpacity(0.30000001192092896),
    Color(0xFFF23040),
    Colors.black.withOpacity(0.9),
  ];

  final List<BorderRadius> radius = [
    BorderRadius.zero,
    BorderRadius.only(topLeft: Radius.circular(8)),
    BorderRadius.only(topRight: Radius.circular(8)),
    BorderRadius.only(bottomLeft: Radius.circular(8)),
    BorderRadius.only(bottomRight: Radius.circular(8)),
  ];

  RxDouble scale = 1.0.obs;
  RxSet<String> selectSet = <String>{}.obs;

  ///投注信息
  RxMap<int, List<int>> bettingMap = <int, List<int>>{}.obs;

  double nY = 0;
  double nX = 0;

  @override
  void onInit() {
    // 初始化 AnimationController，设置动画时长
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    // 设置颜色渐变动画：从蓝色到红色
    redAnimation = ColorTween(begin: Color(0xFFF23040), end: Color(0xFFCC2836))
        .animate(controller);
    blackAnimation =
        ColorTween(begin: Colors.black.withOpacity(0.9), end: Colors.brown)
            .animate(controller);
    colorAnimation = ColorTween(
            begin: Colors.black.withOpacity(0.30000001192092896),
            end: Colors.red)
        .animate(controller);
    imageAnimation = IntTween(begin: 1, end: 2).animate(controller);

    c0 = CoronaModel.coronaList()[0];
    r1 = CoronaModel.coronaList()[1];
    r2 = CoronaModel.coronaList()[2];
    r3 = CoronaModel.coronaList()[3];
    r4 = CoronaModel.coronaList()[4];

    r5 = CoronaModel.coronaList()[5];
    super.onInit();
  }

  void onStartAnimation() {
    controller.repeat();
    // scale.value = 0.8;
    Future.delayed(Duration(milliseconds: 1500), () {
      controller.stop();
      selectSet.clear(); // 停止动画
      // scale.value = 1;
    });
  }

  void onTapDown(Offset localPosition) {
    var dx = localPosition.dx;
    var dy = localPosition.dy;
    var minY = nY;
    var minX = nX;
    const double s = 5;

    if (dy < minY * 2 - s) {
      var x = minX * 2;
      if (dx >= x) {
        onIdClick(3100);
      }
    } else if (isWH(dy, minY * 2)) {
      /// 美式-四号
      if (isWH(dx, minX * 2)) {
        onIdClick(3402);

        ///美式-三数
      } else if (isWH(dx, minX * 6)) {
        onIdClick(3401);
      } else if (isWH(dx, minX * 10)) {
        onIdClick(3400);

        ///分注
      } else if (isWH(dx, minX * 4)) {
        onIdClick(3202);
      } else if (isWH(dx, minX * 8)) {
        onIdClick(3201);
      } else if (isWH(dx, minX * 12)) {
        onIdClick(3200);
      }
    } else {
      if (isRC(dx, 0, minX)) {
        ///row1

        if (isRC(dy, minY * 2, minY * 4)) {
          showRC(1, 0);
        } else if (isRC(dy, minY * 4, minY * 6)) {
          showRC(1, 1);
        } else if (isRC(dy, minY * 6, minY * 8)) {
          showRC(1, 2);
        } else if (isRC(dy, minY * 8, minY * 10)) {
          showRC(1, 3);
        } else if (isRC(dy, minY * 10, minY * 12)) {
          showRC(1, 4);
        } else if (isRC(dy, minY * 12, minY * 14)) {
          showRC(1, 5);
        }
      } else if (isRL(dx, minX, minX * 2)) {
        ///row2
        if (isRL(dy, minY * 2, minY * 6)) {
          showRC(2, 0);
        } else if (isRL(dy, minY * 6, minY * 10)) {
          showRC(2, 1);
        } else if (isRL(dy, minY * 10, minY * 14)) {
          showRC(2, 2);
        }
      } else if (isWH(dx, minX * 2)) {
        ///美式-线注
        onMS(dy, minY, row: 0);
      } else if (isWH(dx, minX * 6)) {
        ///角注
        onMS(dy, minY, row: 2);
      } else if (isWH(dx, minX * 10)) {
        ///角注
        onMS(dy, minY, row: 4);
      } else if (isRA(dx, minX * 2, minX * 6)) {
        ///row3
        onCClick(dy, dx, minY, minX, 3, 1, 4);
      } else if (isRA(dx, minX * 5, minX * 10)) {
        ///row4
        onCClick(dy, dx, minY, minX, 4, 3, 8);
      } else if (isRR(dx, minX * 10, minX * 14)) {
        ///row5
        onCClick(dy, dx, minY, minX, 5, 5, 12);
      } else {
        showTost('+++');
      }
    }
  }

  void onCClick(
      double dy, double dx, double minY, double minX, int c, int r, int w) {
    if (isRA(dy, minY * 2, minY * 3)) {
      showRC(c, 0);
    } else if (isRA(dy, minY * 3, minY * 4)) {
      showRC(c, 1);
    } else if (isRA(dy, minY * 4, minY * 5)) {
      showRC(c, 2);
    } else if (isRA(dy, minY * 5, minY * 6)) {
      showRC(c, 3);
    } else if (isRA(dy, minY * 6, minY * 7)) {
      showRC(c, 4);
    } else if (isRA(dy, minY * 7, minY * 8)) {
      showRC(c, 5);
    } else if (isRA(dy, minY * 8, minY * 9)) {
      showRC(c, 6);
    } else if (isRA(dy, minY * 9, minY * 10)) {
      showRC(c, 7);
    } else if (isRA(dy, minY * 10, minY * 11)) {
      showRC(c, 8);
    } else if (isRA(dy, minY * 11, minY * 12)) {
      showRC(c, 9);
    } else if (isRA(dy, minY * 12, minY * 13)) {
      showRC(c, 10);
    } else if (isRA(dy, minY * 13, minY * 14)) {
      showRC(c, 11);
    } else if (isRC(dy, minY * 14, minY * 15)) {
      showRC(c, 12);
    } else {
      if (isWH(dx, minX * w)) {
        onMS(dy, minY, row: r);
      }
    }
  }

  ///美式-街注 ;row 2、4 美式-角注
  void onMS(double dy, double minY, {int row = 0}) {
    if (isWH(dy, minY * 3)) {
      onHour(row, 0);
    } else if (isWH(dy, minY * 4)) {
      onHour(row, 1);
    } else if (isWH(dy, minY * 5)) {
      onHour(row, 2);
    } else if (isWH(dy, minY * 6)) {
      onHour(row, 3);
    } else if (isWH(dy, minY * 7)) {
      onHour(row, 4);
    } else if (isWH(dy, minY * 8)) {
      onHour(row, 5);
    } else if (isWH(dy, minY * 9)) {
      onHour(row, 6);
    } else if (isWH(dy, minY * 10)) {
      onHour(row, 7);
    } else if (isWH(dy, minY * 11)) {
      onHour(row, 8);
    } else if (isWH(dy, minY * 12)) {
      onHour(row, 9);
    } else if (isWH(dy, minY * 13)) {
      onHour(row, 10);
    } else {
      if ([0, 2, 4].contains(row)) {
        if (isWH(dy, minY * 2.5)) {
          onLeast(row, 0);
        } else if (isWH(dy, minY * 3.5)) {
          onLeast(row, 1);
        } else if (isWH(dy, minY * 4.5)) {
          onLeast(row, 2);
        } else if (isWH(dy, minY * 5.5)) {
          onLeast(row, 3);
        } else if (isWH(dy, minY * 6.5)) {
          onLeast(row, 4);
        } else if (isWH(dy, minY * 7.5)) {
          onLeast(row, 5);
        } else if (isWH(dy, minY * 8.5)) {
          onLeast(row, 6);
        } else if (isWH(dy, minY * 9.5)) {
          onLeast(row, 7);
        } else if (isWH(dy, minY * 10.5)) {
          onLeast(row, 8);
        } else if (isWH(dy, minY * 11.5)) {
          onLeast(row, 9);
        } else if (isWH(dy, minY * 12.5)) {
          onLeast(row, 10);
        } else if (isWH(dy, minY * 13.5)) {
          onLeast(row, 11);
        }
      }
    }
  }

  ///纵向 整点事件处理
  void onHour(int c, int r) {
    var list = <int>[];
    switch (c) {
      case 0:
        list = AmericanModel.lineBets();
      case 1:
        list = AmericanModel.r1Fs();
      case 2:
        list = AmericanModel.r1Js();
      case 3:
        list = AmericanModel.r3Fs();
      case 4:
        list = AmericanModel.r2Js();
      case 5:
        list = AmericanModel.r5Fs();
    }
    var id = list[r];
    onIdClick(id);
  }

  ///纵向 半点事件处理
  void onLeast(int c, int r) {
    var list = <int>[];
    switch (c) {
      case 0:
        list = AmericanModel.streetNotes();
      case 2:
        list = AmericanModel.r2Fs();
      case 4:
        list = AmericanModel.r4Fs();
    }
    var id = list[r];
    onIdClick(id);
  }

  ///事件放大
  bool isWH(double p, double v) {
    const s = 5;
    return p > v - s && p < v + s;
  }

  bool isSH(double p, double v1, double v2, {double s = 5}) {
    return p > v1 + s && p < v2 - s;
  }

  //第一列 横项纵向都不处理
  bool isRC(double p, double v1, double v2) {
    return p > v1 && p < v2;
  }

  //最小不处理 最大处理
  bool isRL(double p, double v1, double v2, {double s = 5}) {
    return p > v1 && p < v2 - s;
  }

  //最小处理 最大不处理
  bool isRR(double p, double v1, double v2, {double s = 5}) {
    return p > v1 + s && p < v2;
  }

  //最小、最大都处理
  bool isRA(double p, double v1, double v2, {double s = 5}) {
    return p > v1 + s && p < v2 - s;
  }

  String getString(int r, int c) {
    String str = '';
    int id = 0;
    switch (r) {
      case 1:
        str = r1[c].name;
        id = r1[c].id;
      case 2:
        str = r2[c].name.replaceAll('\n', '');
        id = r2[c].id;
      case 3:
        str = r3[c].name;
        id = r3[c].id;
      case 4:
        str = r4[c].name;
        id = r4[c].id;
      case 5:
        str = r5[c].name;
        id = r5[c].id;
    }

    onIdClick(id);
    return str;
  }

  void onIdClick(int id) {
    var md = AmericanModel.list().firstWhere((e) => e.id == id);
    selectSet.value = md.codes;
    bettingMap.update(id, (value) {
      return [...value, 1];
    }, ifAbsent: () {
      return [1];
    });
    onStartAnimation();
  }

  void showRC(int r, int c) {
    String str = '';
    int id = 0;
    switch (r) {
      case 1:
        str = r1[c].name;
        id = r1[c].id;
      case 2:
        str = r2[c].name.replaceAll('\n', '');
        id = r2[c].id;
      case 3:
        str = r3[c].name;
        id = r3[c].id;
      case 4:
        str = r4[c].name;
        id = r4[c].id;
      case 5:
        str = r5[c].name;
        id = r5[c].id;
    }

    onIdClick(id);
  }

  void showTost(String msg) {
    print('点击了：$msg');
    // onStartAnimation();
  }
}
