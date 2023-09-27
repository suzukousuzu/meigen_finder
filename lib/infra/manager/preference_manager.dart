import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferenceManagerProvider = Provider((ref) {
  return PreferenceManager();
});

enum PreferenceKey {
  todayQuotes,
  premiumPlan,
  todaysQuoteDisplayCount,
  launchCount,
  didReviewDialogWatched,
}

extension StringExtension on PreferenceKey {
  String get keyString => toString().split('.').last;
}

class PreferenceManager {
  PreferenceManager();

  Future<void> setValue(PreferenceKey key, Object value) async {
    final preferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        preferences.setString(key.keyString, value as String);
        break;
      case bool:
        preferences.setBool(key.keyString, value as bool);
        break;
      case int:
        preferences.setInt(key.keyString, value as int);
        break;
      default:
        break;
    }
  }

  Future<Object> getValue(PreferenceKey key, Object defaultValue) async {
    final preferences = await SharedPreferences.getInstance();
    switch (defaultValue.runtimeType) {
      case String:
        return preferences.getString(key.keyString) ?? defaultValue;
      case bool:
        return preferences.getBool(key.keyString) ?? defaultValue;
      case int:
        return preferences.getInt(key.keyString) ?? defaultValue;
      default:
        return defaultValue;
    }
  }
}
