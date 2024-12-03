import 'package:flutter_main/models/event_model/base_event.dart';

class WebSocketEvent extends BaseEvent {
  final int protocolId;
  final dynamic value;

  WebSocketEvent(this.protocolId, {this.value});
}

class GemaSocketEvent extends WebSocketEvent {
  GemaSocketEvent({int protocolId = 0, dynamic value})
      : super(protocolId, value: value);
}
