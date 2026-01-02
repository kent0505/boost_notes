import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';

abstract interface class SettingsRepository {
  const SettingsRepository();

  String getTranslate();
  Future<void> setTranslate({required String translate});
}

final class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  String getTranslate() {
    return _prefs.getString(Keys.translate) ?? 'English';
  }

  @override
  Future<void> setTranslate({required String translate}) async {
    await _prefs.setString(Keys.translate, translate);
  }
}
