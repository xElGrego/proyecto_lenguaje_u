
import 'package:flutter/cupertino.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/listClass_provider.dart';

import '../model/list_class.dart';
import '../subjects/list_students.dart';

class ListStudentController extends ChangeNotifier {

  List<ListaEstudiantes> listStudents = [
    ListaEstudiantes(
      name: 'Juan',
      course: 'Octavo A1',
      lastName: 'Arteaga',
    ),
    ListaEstudiantes(
      name: 'Christian',
      course: 'Octavo A1',
      lastName: 'Vera',
    ),
    ListaEstudiantes(
      name: 'Erick',
      course: 'Octavo A1',
      lastName: 'Aguilar',
    ),
  ];


}
