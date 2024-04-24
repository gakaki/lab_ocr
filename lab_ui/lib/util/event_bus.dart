import 'dart:async';

import 'package:event_bus/event_bus.dart';

class GlobalEventBus {
  EventBus? eventBus;

  factory GlobalEventBus() => _getInstance();

  static GlobalEventBus _getInstance() {
    _instance ??= GlobalEventBus._internal();
    return _instance!;
  }

  GlobalEventBus._internal() {
    // 创建对象
    eventBus = EventBus();
  }

  static GlobalEventBus? _instance;

  void fire(dynamic event) {
    eventBus!.fire(event);
  }

  StreamSubscription<T> listen<T>(void Function(T event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return eventBus!.on<T>().listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}
