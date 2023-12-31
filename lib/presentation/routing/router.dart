import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meigen_finder/presentation/pages/favorite_quote/favorite_quote_page.dart';
import 'package:meigen_finder/presentation/pages/history/history_page.dart';
import 'package:meigen_finder/presentation/pages/setting/terms_of_service_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../application/controller/quote_detail_page_controller.dart';
import '../components/modal_bottom_sheet/modal_bottom_sheet_container_builder.dart';
import '../pages/home/home_page.dart';
import '../pages/quote_detail/quote_detail_page.dart';
import '../pages/setting/premium_page.dart';
import '../pages/setting/setting_page.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// 画面遷移定義プロバイダー
final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
    navigatorKey: _rootNavigatorKey,
    observers: [GoRouterObserver(analytics: FirebaseAnalytics.instance)],
  );
});

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required this.analytics});
  final FirebaseAnalytics analytics;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    analytics.setCurrentScreen(screenName: route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    analytics.setCurrentScreen(screenName: route.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    analytics.setCurrentScreen(screenName: route.settings.name);
  }
}

@TypedShellRoute<MyShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/', routes: [
      TypedGoRoute<QuoteDetailRouteFromHome>(
        path: 'quote_detail',
      ),
    ]),
    TypedGoRoute<FavoriteQuoteRoute>(path: '/favorite_quote', routes: [
      TypedGoRoute<QuoteDetailRouteFromFavorite>(
        path: 'quote_detail',
      ),
    ]),
    TypedGoRoute<HistoryPageRoute>(path: '/history', routes: [
      TypedGoRoute<QuoteDetailRouteFromHistory>(
        path: 'quote_detail',
      ),
    ]),
    TypedGoRoute<SettingRoute>(path: '/setting', routes: [
      TypedGoRoute<TermsOfServiceRoute>(path: 'terms_of_service'),
      TypedGoRoute<PremiumRoute>(path: 'premium'),
    ]),
  ],
)
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
    if (location.startsWith('/favorite_quote')) {
      return 1;
    } else if (location.startsWith('/history')) {
      return 2;
    } else if (location.startsWith('/setting')) {
      return 3;
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
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            GoRouter.of(context).go('/');
          } else if (index == 2) {
            GoRouter.of(context).go('/history');
          } else if (index == 3) {
            GoRouter.of(context).go('/setting');
          } else {
            GoRouter.of(context).go('/favorite_quote');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidHeart),
            label: 'お気に入り',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidCalendar),
            label: '履歴',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear),
            label: '設定',
          ),
        ],
      ),
    );
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: HomePage());
}

class QuoteDetailRouteFromHome extends GoRouteData {
  final QuoteDetailArgument $extra;
  QuoteDetailRouteFromHome(this.$extra);

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: QuoteDetailPage(
          quoteDetailArgument: $extra,
        ),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: CurveTween(curve: Curves.bounceInOut).animate(animation),
            child: child,
          );
          //   FadeTransition(
          //   opacity: CurveTween(curve: Curves.bounceInOut).animate(animation),
          //   child: child,
          // );
        });
  }
}

class QuoteDetailRouteFromFavorite extends GoRouteData {
  final QuoteDetailArgument $extra;
  QuoteDetailRouteFromFavorite(this.$extra);

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ModalBottomSheetPage(
      child: QuoteDetailPage(quoteDetailArgument: $extra),
    );
  }
}

class QuoteDetailRouteFromHistory extends GoRouteData {
  final QuoteDetailArgument $extra;
  QuoteDetailRouteFromHistory(this.$extra);
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ModalBottomSheetPage(
      child: QuoteDetailPage(quoteDetailArgument: $extra),
    );
  }
}

class SettingRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: SettingPage());
}

class TermsOfServiceRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const ModalBottomSheetPage(child: TermsOfServicePage());
}

class PremiumRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const ModalBottomSheetPage(child: PremiumPage());
}

class FavoriteQuoteRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: FavoriteQuotePage());
}

class HistoryPageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: HistoryPage());
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

/// Custom transition page with no transition.
class NoTransitionPage<T> extends CustomTransitionPage<T> {
  /// Constructor for a page with no transition functionality.
  const NoTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );

  static Widget _transitionsBuilder(
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      child;
}
