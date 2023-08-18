import 'package:rxdart/rxdart.dart';

class Cache<T> {
  final BehaviorSubject<T> _cache = BehaviorSubject<T>();

  T get value => _cache.value;

  bool get hasValue => _cache.hasValue;

  void add(T value) {
    _cache.add(value);
  }

  void dispose() {
    _cache.close();
  }
}
