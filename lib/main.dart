import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/login/login_page.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/register_controller.dart';

import 'src/data/provider/login_controller.dart';
import 'src/config/routes.dart' as route;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(),),
        ChangeNotifierProvider(create: (_) => RegisterController(),),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: route.controller,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SafeArea(
          child: LoginPage(),
        ),
      ),
    );
  }
}
