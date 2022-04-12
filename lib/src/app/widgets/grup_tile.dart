// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/courses/courses_content.dart';
import 'package:proyecto_lenguaje_u/src/data/model/list_class.dart';

class GroupTile extends StatelessWidget {

  const GroupTile({Key? key, required this.listaClases}) : super(key: key);

  final ListaClases listaClases;

  @override
  Widget build(BuildContext context) {
 
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.school),
          title: Text(listaClases.nombre!),
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
