import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart';

mixin DataHolder<T extends Object> {
  final _behaviorSubject = BehaviorSubject<T?>();

  Stream<T?> get stream => _behaviorSubject.stream;

  bool _isSameAsCurrentValue(T value) {
    final currentValue = _behaviorSubject.valueOrNull;
    if (value is List && currentValue is List) {
      return listEquals(value, currentValue);
    }
    return value == currentValue;
  }

  void update(T value) {
    if (!_isSameAsCurrentValue(value)) {
      _behaviorSubject.add(value);
    }
  }

  void clear() {
    _behaviorSubject.add(null);
  }

  void dispose() {
    _behaviorSubject.close();
  }
}
