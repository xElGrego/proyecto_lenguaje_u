import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/content/conten_page.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/register/register_page.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/task/taks_page.dart';

import '../app/pages/home/home_page.dart';
import '../app/pages/login/login_page.dart';


// Route Names
const String loginPage    = 'login';
const String homePage     = 'home';
const String taskPage     = 'task';
const String registerPage = 'register';
const String contentPage  = 'content';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) =>  LoginPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case taskPage:
      return MaterialPageRoute(builder: (context) => const TaskPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
      case contentPage:
      return MaterialPageRoute(builder: (context) => const ContentPage());
    default:
      throw('This route name does not exit');
  }
}