import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data_holder.dart';

final isPremiumPlanHolderProvider = Provider((ref) {
  final isPremiumHolder = IsPremiumPlanHolder();
  ref.onDispose(isPremiumHolder.dispose);
  return isPremiumHolder;
});

class IsPremiumPlanHolder with DataHolder<bool> {}
