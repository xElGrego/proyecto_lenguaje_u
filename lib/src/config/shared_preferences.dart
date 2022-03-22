import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/user.dart';


class UserPreferences {
  Future<bool> saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('correo', user.correo!);
    prefs.setString('token', user.token!);
    prefs.setString('authorities', user.authorities![0]);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString("correo");
    String? token = prefs.getString("token");
    List<String>? authorities = [];
    authorities.add(prefs.getString("authorities")!);

    return User(correo: email, token: token, authorities:authorities );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('correo');
    prefs.remove('token');
    prefs.remove('authorities');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}