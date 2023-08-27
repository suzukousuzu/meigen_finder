import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meigen_finder/application/controller/loading_controller.dart';

import 'loading.dart';

class LoadingContainer extends ConsumerWidget {
  const LoadingContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loadingControllerProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        child ?? const SizedBox(),
        loading ? const Loading() : const SizedBox(),
      ],
    );
  }
}
