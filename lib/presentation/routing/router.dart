import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../application/controller/quote_detail_page_controller.dart';
import '../components/modal_bottom_sheet/modal_bottom_sheet_container_builder.dart';
import '../pages/category/category_page.dart';
import '../pages/home/home_page.dart';
import '../pages/home/quote_detail_page.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

/// 画面遷移定義プロバイダー
final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
  );
});

@TypedShellRoute<MyShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/', routes: [
      TypedGoRoute<QuoteDetailRoute>(
        path: 'quote_detail',
      ),
    ]),
    TypedGoRoute<CategoryRoute>(
      path: '/category',
    ),
  ],
)
// @TypedGoRoute<HomeRoute>(path: '/', routes: <TypedGoRoute<GoRouteData>>[
//   TypedGoRoute<CategoryRoute>(
//     path: 'category',
//   ),
//   TypedGoRoute<QuoteDetailRoute>(
//     path: 'quote_detail',
//   ),
// ])
class MyShellRouteData extends ShellRouteData {
  const MyShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MyShellRouteScreen(child: navigator);
  }
}

class MyShellRouteScreen extends StatelessWidget {
  const MyShellRouteScreen({required this.child, super.key});

  final Widget child;

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/category')) {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = getCurrentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 0) {
            GoRouter.of(context).go('/');
          } else {
            GoRouter.of(context).go('/category');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidCalendar),
            label: 'カテゴリー',
          ),
        ],
      ),
    );
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class QuoteDetailRoute extends GoRouteData {
  final QuoteDetailArgument $extra;
  QuoteDetailRoute(this.$extra);
  @override
  Widget build(BuildContext context, GoRouterState state) => QuoteDetailPage(
        quoteDetailArgument: $extra,
      );
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
