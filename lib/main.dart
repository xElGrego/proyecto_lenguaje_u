import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/home/home_page.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/login/login_page.dart';
import 'package:proyecto_lenguaje_u/src/config/shared_preferences.dart';
import 'package:proyecto_lenguaje_u/src/data/model/user.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/auth_provider.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/register_controller.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/user_provider.dart';

import 'src/data/provider/login_controller.dart';
import 'src/config/routes.dart' as route;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterController()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: route.controller,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<User>(
            future: getUserData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    log("hasError");
                    return Scaffold(
                      body: Center(
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    );
                  } else if (snapshot.data?.correo == null) {
                    log("No token");
                    return LoginPage();
                  } else {
                    log("DashBoard");
                    return const HomePage();
                  }
              }
            }),
      ),
    );
  }
}
