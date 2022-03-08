import 'package:flutter/cupertino.dart';

class RegisterController extends ChangeNotifier{
  List<String> items = ["Docente" , "Estudiante"];

  String _item = 'Estudiante';

  String get item => _item;
  @protected
  set item(String value) => _item = value;

  
  

  changeItem(String value){
    item = value;
    notifyListeners();
  }
}