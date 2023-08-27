import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/controller/loading_controller.dart';

Future<T> executeWhileLoading<T>(Future<T> Function() future) {
  final container = ProviderContainer();
  final loadingController = container.read(loadingControllerProvider.notifier);
  return loadingController.whileLoading(future);
}
