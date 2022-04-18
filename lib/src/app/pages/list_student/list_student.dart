import 'dart:developer';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/model/list_class.dart';
import '../../../data/provider/list_studen.dart';
import '../../../data/subjects/list_students.dart';
import '../../widgets/add_student.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ListaClases;

    log("Argumentos list studen: ${args.personas}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista de estudiantes"),
          backgroundColor: const Color(0xFF8e96e1),
          actions: [
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
          itemCount: args.personas!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text( args.personas![index].nombre! +" "+ args.personas![index].apellidos!) ,
              leading: const Icon(Icons.photo_camera_front_outlined),
              onTap: () {
              },
            );
          },
        ),
      ),
    );
  }
}
