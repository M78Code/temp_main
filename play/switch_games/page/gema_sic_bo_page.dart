import 'package:flutter/cupertino.dart';

import '../base/game_base_page.dart';

class GemaSicBoPage extends GameBasePage {
  String type = '骰宝';

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
