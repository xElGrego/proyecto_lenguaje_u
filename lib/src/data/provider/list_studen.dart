
import 'package:flutter/cupertino.dart';

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

  /* addStudent(String nombre, String apellidos) {
    log("dato 1 $nombre");
    log("dato 2 $apellidos");
    
    listStudents.add(ListaEstudiantes(name: nombre, course: 'Ocatvo A', lastName: apellidos));

    log("$listStudents");
    log("Lista agregada ");
  } */


}
