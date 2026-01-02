import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils.dart';

abstract interface class VipRepository {
  const VipRepository();

  Future<void> test();
}

final class VipRepositoryImpl implements VipRepository {
  VipRepositoryImpl({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<void> test() async {
    logger(_prefs.hashCode);
  }
}
