import 'package:meigen_finder/application/state/premium_page_view_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/manager/app_purchase_manager.dart';

part 'premium_page_controller.g.dart';

@riverpod
class PremiumPageController extends _$PremiumPageController {
  @override
  PremiumPageViewState build() =>
      const PremiumPageViewState(isPremium: false, premiumPriceString: '');

  void fetchPriceString() {
    final inAppPurchaseManager = ref.read(inAppPurchaseManagerProvider);
    final premiumPackage = inAppPurchaseManager.deleteAdPackage;
    final priceString = premiumPackage?.storeProduct.priceString;
    state = state.copyWith(premiumPriceString: priceString);
  }

  Future<void> purchasePremium() async {
    final inAppPurchaseManager = ref.read(inAppPurchaseManagerProvider);
    await inAppPurchaseManager.makePurchase(PurchaseMode.deleteAd);
  }

  Future<void> restore() async {
    final inAppPurchaseManager = ref.read(inAppPurchaseManagerProvider);
    await inAppPurchaseManager.restorePurchase();
  }
}
