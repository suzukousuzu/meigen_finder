import 'package:meigen_finder/application/state/settig_page_view_state.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/manager/app_purchase_manager.dart';

part 'setting_page_controller.g.dart';

@riverpod
class SettingPageController extends _$SettingPageController {
  @override
  SettingPageViewState build() => const SettingPageViewState(appVersion: '');

  String? get donationPriceString => ref
      .read(inAppPurchaseManagerProvider)
      .donationPackage
      ?.storeProduct
      .priceString;

  Future<void> fetchAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    state = state.copyWith(appVersion: packageInfo.version);
  }

  Future<void> donate() async {
    final inAppPurchaseManager = ref.read(inAppPurchaseManagerProvider);
    await inAppPurchaseManager.makePurchase(PurchaseMode.donation);
  }
}
