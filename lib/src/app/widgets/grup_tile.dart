// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/courses/courses_content.dart';
import 'package:proyecto_lenguaje_u/src/data/model/list_class.dart';

class GroupTile extends StatelessWidget {
  /* final String name;
  final String subject;
  final String time;
  final VoidCallback function; */

  // ignore: use_key_in_widget_constructors
  /* const GroupTile({this.name = "", this.subject = "", this.time = "", required this.function}); */

  const GroupTile({Key? key, required this.listaClases}) : super(key: key);

  final ListaClases listaClases;

  @override
  Widget build(BuildContext context) {
    log("Lista clases Group title ${listaClases.nombre}");
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.school),
          title: Text(listaClases.nombre),
          trailing: FlatButton(
            child: const Text(
              'Ir al curso',
              style: TextStyle(color: Colors.white),
            ),
            color: const Color(0xFF8e96e1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              /* Navigator.pushNamed(context, 'coursesContent', arguments:listaClases.nombre); */
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoursesContent(),
                  settings: RouteSettings(
                    arguments: listaClases,
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(thickness: 1.5)
      ],
    );
  }
}
