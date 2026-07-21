import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class TokenService {
  final SharedPreferences _prefs;

  TokenService(this._prefs);

  static const String _didKey = 'device_id';
  static const String _roleKey = 'user_role';
  
  String? _accessToken;

  Future<void> saveDid(String did, {String? role}) async {
    await _prefs.setString(_didKey, did);
    if (role != null) {
      await _prefs.setString(_roleKey, role);
    }
  }

  void saveAccessToken(String token) {
    _accessToken = token;
  }

  String? getAccessToken() {
    return _accessToken;
  }

  String? getDid() {
    return _prefs.getString(_didKey);
  }

  String? getRole() {
    return _prefs.getString(_roleKey);
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    await _prefs.remove(_didKey);
    await _prefs.remove(_roleKey);
  }
}
