// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $myShellRouteData,
    ];

RouteBase get $myShellRouteData => ShellRouteData.$route(
      navigatorKey: MyShellRouteData.$navigatorKey,
      factory: $MyShellRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/',
          factory: $HomeRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'quote_detail',
              factory: $QuoteDetailRouteFromHomeExtension._fromState,
              parentNavigatorKey: QuoteDetailRouteFromHome.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/favorite_quote',
          factory: $FavoriteQuoteRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'quote_detail',
              factory: $QuoteDetailRouteFromFavoriteExtension._fromState,
              parentNavigatorKey:
                  QuoteDetailRouteFromFavorite.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/history',
          factory: $HistoryPageRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'quote_detail',
              factory: $QuoteDetailRouteFromHistoryExtension._fromState,
              parentNavigatorKey:
                  QuoteDetailRouteFromHistory.$parentNavigatorKey,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/setting',
          factory: $SettingRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'terms_of_service',
              factory: $TermsOfServiceRouteExtension._fromState,
              parentNavigatorKey: TermsOfServiceRoute.$parentNavigatorKey,
            ),
            GoRouteData.$route(
              path: 'premium',
              factory: $PremiumRouteExtension._fromState,
              parentNavigatorKey: PremiumRoute.$parentNavigatorKey,
            ),
          ],
        ),
      ],
    );

extension $MyShellRouteDataExtension on MyShellRouteData {
  static MyShellRouteData _fromState(GoRouterState state) =>
      const MyShellRouteData();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $QuoteDetailRouteFromHomeExtension on QuoteDetailRouteFromHome {
  static QuoteDetailRouteFromHome _fromState(GoRouterState state) =>
      QuoteDetailRouteFromHome(
        state.extra as QuoteDetailArgument,
      );

  String get location => GoRouteData.$location(
        '/quote_detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $FavoriteQuoteRouteExtension on FavoriteQuoteRoute {
  static FavoriteQuoteRoute _fromState(GoRouterState state) =>
      FavoriteQuoteRoute();

  String get location => GoRouteData.$location(
        '/favorite_quote',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $QuoteDetailRouteFromFavoriteExtension
    on QuoteDetailRouteFromFavorite {
  static QuoteDetailRouteFromFavorite _fromState(GoRouterState state) =>
      QuoteDetailRouteFromFavorite(
        state.extra as QuoteDetailArgument,
      );

  String get location => GoRouteData.$location(
        '/favorite_quote/quote_detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $HistoryPageRouteExtension on HistoryPageRoute {
  static HistoryPageRoute _fromState(GoRouterState state) => HistoryPageRoute();

  String get location => GoRouteData.$location(
        '/history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $QuoteDetailRouteFromHistoryExtension on QuoteDetailRouteFromHistory {
  static QuoteDetailRouteFromHistory _fromState(GoRouterState state) =>
      QuoteDetailRouteFromHistory(
        state.extra as QuoteDetailArgument,
      );

  String get location => GoRouteData.$location(
        '/history/quote_detail',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $SettingRouteExtension on SettingRoute {
  static SettingRoute _fromState(GoRouterState state) => SettingRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TermsOfServiceRouteExtension on TermsOfServiceRoute {
  static TermsOfServiceRoute _fromState(GoRouterState state) =>
      TermsOfServiceRoute();

  String get location => GoRouteData.$location(
        '/setting/terms_of_service',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PremiumRouteExtension on PremiumRoute {
  static PremiumRoute _fromState(GoRouterState state) => PremiumRoute();

  String get location => GoRouteData.$location(
        '/setting/premium',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
