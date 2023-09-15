import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferenceManagerProvider = Provider((ref) {
  return PreferenceManager();
});

enum PreferenceKey {
  todayQuotes,
  premiumPlan,
}

extension StringExtension on PreferenceKey {
  String get keyString => toString().split('.').last;
}

class PreferenceManager {
  PreferenceManager();

  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setValue(PreferenceKey key, Object value) {
    switch (value.runtimeType) {
      case String:
        _preferences?.setString(key.keyString, value as String);
        break;
      case bool:
        _preferences?.setBool(key.keyString, value as bool);
        break;
      case int:
        _preferences?.setInt(key.keyString, value as int);
        break;
      default:
        break;
    }
  }

  Object getValue(PreferenceKey key, Object defaultValue) {
    switch (defaultValue.runtimeType) {
      case String:
        return _preferences?.getString(key.keyString) ?? defaultValue;
      case bool:
        return _preferences?.getBool(key.keyString) ?? defaultValue;
      case int:
        return _preferences?.getInt(key.keyString) ?? defaultValue;
      default:
        return defaultValue;
    }
  }
}
