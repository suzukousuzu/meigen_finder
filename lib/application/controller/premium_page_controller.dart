import 'package:meigen_finder/application/state/premium_page_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/manager/app_purchase_manager.dart';
import '../../infra/manager/preference_manager.dart';

part 'premium_page_controller.g.dart';

@riverpod
class PremiumPageController extends _$PremiumPageController {
  @override
  PremiumPageViewState build() =>
      const PremiumPageViewState(isPremium: false, premiumPriceString: '');

  void fetch() {
    _fetchIsPremiumPlan();
    _fetchPriceString();
  }

  void _fetchPriceString() {
    final inAppPurchaseManager = ref.watch(inAppPurchaseManagerProvider);
    final premiumPackage = inAppPurchaseManager.deleteAdPackage;
    final priceString = premiumPackage?.storeProduct.priceString;
    state = state.copyWith(premiumPriceString: priceString);
  }

  void _fetchIsPremiumPlan() {
    final preferenceManager = ref.read(preferenceManagerProvider);
    final isPremiumPlan =
        preferenceManager.getValue(PreferenceKey.premiumPlan, false) as bool;

    state = state.copyWith(isPremium: isPremiumPlan);
  }

  Future<void> purchasePremium() async {
    final inAppPurchaseManager = ref.watch(inAppPurchaseManagerProvider);
    await inAppPurchaseManager.makePurchase(PurchaseMode.deleteAd);
  }

  Future<void> restore() async {
    final inAppPurchaseManager = ref.read(inAppPurchaseManagerProvider);
    await inAppPurchaseManager.restorePurchase();
  }
}
