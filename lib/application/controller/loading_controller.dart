import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_controller.g.dart';

@riverpod
class LoadingController extends _$LoadingController {
  @override
  bool build() => false;
  Future<T> whileLoading<T>(Future<T> Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toComplete);
  }

  void toLoading() => state = true;

  void toComplete() => state = false;
}
