import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/profile/profile_page.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/task_general/tas_general_page.dart';

import '../../app/pages/courses/courses_page.dart';

class BottonNavigationProvider extends ChangeNotifier {
 
  int _currentTab = 0;

  final List<Widget> _screens =  [ const ProfilePage(), const CoursesPage(), const TaskGeneralPage()];
  
  set currentTab(int tab) { _currentTab = tab;notifyListeners();}

  int get currentTab => _currentTab;
  
  


  get currentScreen => _screens[_currentTab];
}
