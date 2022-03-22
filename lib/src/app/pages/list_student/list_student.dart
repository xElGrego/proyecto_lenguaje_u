import 'dart:developer';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/subjects/list_students.dart';
import '../../widgets/add_student.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista de estudiantes"),
          backgroundColor: const Color(0xFF8e96e1),
          actions: [
            /* IconButton(
              icon: const Icon(Icons.person_add_alt),
              onPressed: () {
                const CupertinoAlertDialog(
                  content: AddStudent(),
                  title: Text("Añadir estudiante"),
                );
              },
            ), */
            IconButton(
              icon: const Icon(Icons.person_add_alt),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Añadir Estudiante'),
                      content:  AddStudent(),
                 
      
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: listStudents.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              /* trailing: const Icon(Icons.arrow_forward_ios), */
              title: Text(listStudents[index].name),
              leading: const Icon(Icons.photo_camera_front_outlined),
              onTap: () {
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      listStudents[index],
                    ),
                  ),
                ); */
              },
            );
          },
        ),
      ),
    );
  }
}
