import 'package:plany_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();
  SharedPreferences _sharedPreferences;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future save(UserModel user) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', user.result.user.id);
    await _sharedPreferences.setString('email', user.result.user.email);
    // await _sharedPreferences.setString('name', user.result!.user!.name);
    await _sharedPreferences.setString('token', user.result.user.token);
  }

  int get id => _sharedPreferences.getInt('id') ?? 0;
  String get email => _sharedPreferences.getString('email') ?? "";
  String get name => _sharedPreferences.getString('name') ?? "";
  String get domain => _sharedPreferences.getString('domain') ?? "";
  String get token => _sharedPreferences.getString('token') ?? "";

  bool get isLoggedIn => _sharedPreferences.getBool('logged_in') ?? false;

  Future<bool> setDomain({String domain}) async {
    return await _sharedPreferences.setString('domain', domain);
  }

  Future<bool> deleteAccount() async {
    return await _sharedPreferences.clear();
  }
}
