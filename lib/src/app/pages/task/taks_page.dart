import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/task/pdf_view/view_pdf_page.dart';

import '../../widgets/task_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tareas"),
          backgroundColor: const Color(0xFF8e96e1),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 15),
            children: [
              GestureDetector(
                onTap: () {
                  log("Tocado 1");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerPage(),
                    ),
                  );
                },
                child: const TaskWidget(
                  note: 10,
                  title: 'Actividad 1',
                  color: Color.fromARGB(255, 19, 133, 42),
                  fecha: '03/02/2021',
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  log("Tocado 1");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerPage(),
                    ),
                  );
                },
                child: const TaskWidget(
                  note: 10,
                  title: 'Actividad 1',
                  color: Color.fromARGB(255, 19, 133, 42),
                  fecha: '03/02/2021',
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  log("Tocado 1");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PdfViewerPage(),
                    ),
                  );
                },
                child: const TaskWidget(
                  note: 10,
                  title: 'Actividad 1',
                  color: Color.fromARGB(255, 19, 133, 42),
                  fecha: '03/02/2021',
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
