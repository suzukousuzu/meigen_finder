import 'package:meigen_finder/application/state/settig_page_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_page_controller.g.dart';

@riverpod
class SettingPageController extends _$SettingPageController {
  @override
  SettingPageViewState build() => SettingPageViewState(appVersion: '');
}
