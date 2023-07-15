import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/home/home_page.dart';

part 'router.g.dart';

/// 画面遷移定義プロバイダー
final routerProvider = Provider((ref) {
  return GoRouter(
    routes: $appRoutes,
  );
});

@TypedGoRoute<HomeRoute>(path: '/', routes: <TypedGoRoute<GoRouteData>>[
  // TypedGoRoute<LotteryDialogRoute>(
  //   path: 'lotteryDialog',
  // ),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => HomePage();
}
