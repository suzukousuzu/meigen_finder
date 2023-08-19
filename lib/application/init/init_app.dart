import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infra/preference/shared_preference.dart';

final initAppProvider = Provider<InitApp>(
  (ref) => InitApp(
    ref.read(preferenceManagerProvider),
  ),
);

class InitApp {
  InitApp(
    this._preferenceManager,
  );

  final PreferenceManager _preferenceManager;

  Future<void> execute() async {
    _preferenceManager.init();
  }
}
