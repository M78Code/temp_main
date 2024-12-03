import 'package:flutter_main/models/event_model/base_event.dart';

/// 更新事件
class UpdateEvent extends BaseEvent {
  static int TABLE_INFO_MAP_EVENT = 1;

  final int status;
  final int? value;

  UpdateEvent(this.status, {this.value});
}