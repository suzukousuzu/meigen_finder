import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data_holder.dart';

final dateTimeHolderProvider = Provider((ref) {
  final dateTimeHolder = DateTimeHolder();
  ref.onDispose(dateTimeHolder.dispose);
  return dateTimeHolder;
});

class DateTimeHolder with DataHolder<DateTime> {}
