import 'package:meigen_finder/application/state/settig_page_view_state.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_page_controller.g.dart';

@riverpod
class SettingPageController extends _$SettingPageController {
  @override
  SettingPageViewState build() => const SettingPageViewState(appVersion: '');

  Future<void> fetchAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    state = state.copyWith(appVersion: packageInfo.version);
  }
}
