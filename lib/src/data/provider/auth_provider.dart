import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../config/shared_preferences.dart';
import '../model/user.dart';
import '../services/url.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  logged,
  registered,
  authenticating,
  registering,
  loggeOut,
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.notLoggedIn;
  Status _registering = Status.registering;

  Status get loggedInStatus => _loggedInStatus;
  Status get registering => _registering;

  @protected
  set loggedInStatus(Status value) => _loggedInStatus = value;
  @protected
  set registering(Status value) => _registering = value;

  Future<Map<String, dynamic>> register(String email, String password) async {
    final Map<String, dynamic> apiBodyData = {'email': email, 'password': password};

    return await post(Uri.parse(AppUrl.register),
        body: json.encode(apiBodyData),
        headers: {'Content-Type': 'application/json'}).then(onValue).catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue(Response response) async {
    // ignore: prefer_typing_uninitialized_variables
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    // ignore: avoid_print
    print(responseData);

    if (response.statusCode == 200) {
      // ignore: unused_local_variable
      var userData = responseData['data'];

      User authUser = User.fromJson(responseData);

      result = {'status': true, 'message': 'Creado con éxito', 'data': authUser};
    } else {
      result = {'status': false, 'message': 'Successfully registered', 'data': responseData};
    }
    return result;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> result;

    final Map<String, dynamic> loginData = {'correo': email, 'password': password};

    log("Objeto enviado a la api $loginData");

    _loggedInStatus = Status.authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
        /*  'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz', */
        'cache-control': 'no-cache',
        'postman-token': '6e59e86a-e02e-cfcd-c8d2-aa294faa884e'
      },
    );

    if (response.statusCode == 200) {
      log("correcto");
      final Map<String, dynamic> responseData = json.decode(response.body);

      // ignore: avoid_print
      print(responseData);

      User authUser = User.fromJson(responseData);

      // ignore: avoid_print
      print(authUser);
      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.logged;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      log("incorrecto");
      _loggedInStatus = Status.notLoggedIn;
      /*  
      result = {'status': false, 'message': json.decode(response.body)['error']}; */
      notifyListeners();
      result = {'status': false, 'message': 'Errorsito'};
    }
    return result;
  }

  static onError(error) {
    log('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
