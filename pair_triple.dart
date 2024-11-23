import 'package:flutter_main/models/event_model/base_event.dart';

class Pair<F, S> extends BaseEvent {
  final F first;
  final S second;

  Pair(this.first, this.second);

  @override
  String toString() => 'Pair($first, $second)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pair &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second;

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

class Triple<F, S, T> extends BaseEvent {
  final F first;
  final S second;
  final T third;

  Triple(this.first, this.second, this.third);

  @override
  String toString() => 'Triple($first, $second, $third)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Triple &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          second == other.second &&
          third == other.third;

  @override
  int get hashCode => first.hashCode ^ second.hashCode ^ third.hashCode;
}
