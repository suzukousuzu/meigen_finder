import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../components/modal_bottom_sheet/modal_bottom_sheet_container_builder.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

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
      const ModalBottomSheetPage(
        child: CategoryPage(),
      );
}

class ModalBottomSheetPage<T> extends Page<T> {
  final Widget child;

  const ModalBottomSheetPage({required this.child, super.key});

  @override
  Route<T> createRoute(BuildContext context) =>
      CupertinoModalBottomSheetRoute<T>(
        containerBuilder: modalBottomSheetContainerBuilder,
        expanded: false,
        enableDrag: false,
        isDismissible: false,
        settings: this,
        builder: (context) => child,
      );
}
