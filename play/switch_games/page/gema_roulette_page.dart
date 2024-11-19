import 'package:flutter/material.dart';

import '../base/game_base_page.dart';

class GemaRoulettePage extends GameBasePage {
  String type = '轮盘';

  @override
  String? get tag => type;

  @override
  Widget buildFloatingActionTop() {
    return const SizedBox(
      width: 34,
      height: 34,
    );
  }

  @override
  Widget buildFloatingActionBottom() {
    return const SizedBox(
      width: 34,
      height: 34,
    );
  }
}
