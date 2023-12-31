import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/controller/loading_controller.dart';

Future<T> executeWhileLoading<T>(WidgetRef ref, Future<T> Function() future) {
  final loadingController = ref.read(loadingControllerProvider.notifier);
  return loadingController.whileLoading(future);
}
