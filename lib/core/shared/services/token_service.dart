import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class TokenService {
  final SharedPreferences _prefs;

  TokenService(this._prefs);

  static const String _didKey = 'device_id';
  static const String _roleKey = 'user_role';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  String? _accessToken;
  String? _refreshToken;

  Future<void> saveDid(String did, {String? role}) async {
    await _prefs.setString(_didKey, did);
    if (role != null) {
      await _prefs.setString(_roleKey, role);
    }
  }

  Future<void> saveAccessToken(String token, {String? refreshToken}) async {
    _accessToken = token;
    await _prefs.setString(_accessTokenKey, token);
    if (refreshToken != null) {
      _refreshToken = refreshToken;
      await _prefs.setString(_refreshTokenKey, refreshToken);
    }
  }

  String? getAccessToken() {
    return _accessToken ?? _prefs.getString(_accessTokenKey);
  }

  String? getRefreshToken() {
    return _refreshToken ?? _prefs.getString(_refreshTokenKey);
  }

  String? getDid() {
    return _prefs.getString(_didKey);
  }

  String? getRole() {
    return _prefs.getString(_roleKey);
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
    await _prefs.remove(_didKey);
    await _prefs.remove(_roleKey);
  }
}
