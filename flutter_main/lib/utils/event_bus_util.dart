import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter_main/models/event_model/base_event.dart';

class EventBusUtil {
  static EventBus? _eventBus;

  /// 获取单例
  static EventBus getInstance() {
    _eventBus ??= EventBus();
    return _eventBus!;
  }

  /// 返回某事件的订阅者
  static StreamSubscription<T> listen<T extends BaseEvent>(
      Function(T event) onData) {
    _eventBus ??= EventBus();
    //内部流属于广播模式，可以有多个订阅者
    return _eventBus!.on<T>().listen(onData);
  }

  /// 返回某事件的订阅者
  static StreamSubscription<T> listenModel<T>(
      Function(T event) onData) {
    _eventBus ??= EventBus();
    //内部流属于广播模式，可以有多个订阅者
    return _eventBus!.on<T>().listen(onData);
  }

  /// 发送事件
  static void fireModel<T>(T e) {
    _eventBus ??= EventBus();
    _eventBus!.fire(e);
  }

  /// 发送事件
  static void fire<T extends BaseEvent>(T e) {
    _eventBus ??= EventBus();
    _eventBus!.fire(e);
  }
}

class EventBusRoadUtil {
  // 私有构造函数，防止外部实例化
  EventBusRoadUtil._internal();

  // 单例模式的实例
  static final EventBusRoadUtil _instance = EventBusRoadUtil._internal();

  // 返回单例实例
  factory EventBusRoadUtil() => _instance;

  // 全局唯一的 EventBus 实例
  static EventBus eventBus = EventBus();
}
