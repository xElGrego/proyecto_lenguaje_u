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

  Future<Map<String, dynamic>> registerDocent(
      String email, String nombres, String apellidos, String password) async {
    final Map<String, dynamic> apiBodyData = {
      'correo': email,
      'password': password,
      'nombre': nombres,
      'apellidos': apellidos,
      'roles': ['ROLE_ADMIN'],
    };

    return await post(
      Uri.parse(AppUrl.register),
      body: json.encode(apiBodyData),
      headers: {
        'Content-Type': 'application/json',
        'cache-control': 'no-cache',
        'postman-token': 'b49ad29c-fb26-5847-a904-52045453ee06'
      },
    ).then(onValue).catchError(onError);
  }

  Future<Map<String, dynamic>> registerStudent(
      String email, String nombres, String apellidos, String token) async {
    final Map<String, dynamic> apiBodyData = {
      'nombre': nombres,
      'apellidos': apellidos,
      'roles': ['ROLE_STUDENT'],
      'password': '123456789',
      'correo': email,
    };

    return await post(
      Uri.parse(AppUrl.registerStudent),
      body: json.encode(apiBodyData),
      headers: {
        'Content-Type': 'application/json',
        'cache-control': 'no-cache',
        'postman-token': '6e59e86a-e02e-cfcd-c8d2-aa294faa884e',
        'Authorization': token,
      },
    ).then(onValue).catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 201) {
      result = {'status': true, 'message': 'Creado con éxito'};
    } else {
    
      result = {'status': false, 'message': 'Error al crear usuario'};
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
        'cache-control': 'no-cache',
        'Content-Type': 'application/json',
        'postman-token': 'b49ad29c-fb26-5847-a904-52045453ee06'
            ''
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
    
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
