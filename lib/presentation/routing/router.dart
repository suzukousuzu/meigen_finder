import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';

part 'router.g.dart';

/// 画面遷移定義プロバイダー
final routerProvider = Provider((ref) {
  return GoRouter(
    routes: $appRoutes,
  );
});

@TypedGoRoute<HomeRoute>(path: '/', routes: <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<CategoryRoute>(
    path: 'category',
  ),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class CategoryRoute extends GoRouteData {
  const CategoryRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      ModalBottomSheetPage(
        builder: (_) => const CategoryPage(),
      );
}

class ModalBottomSheetPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;

  const ModalBottomSheetPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        isScrollControlled: false,
        settings: this,
        builder: builder,
        anchorPoint: anchorPoint,
        isDismissible: barrierDismissible,
        modalBarrierColor: barrierColor,
        barrierLabel: barrierLabel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      );
}
