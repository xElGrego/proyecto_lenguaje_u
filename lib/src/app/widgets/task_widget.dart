// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/task/pdf_view/view_pdf_page.dart';
import 'package:proyecto_lenguaje_u/src/funcionesGenerales/modal_tarea_estudiante.dart';
import '../../config/config.dart';
import '../../data/model/list_class.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/user.dart';
import '../../data/provider/user_provider.dart';

class TaskWidget extends StatelessWidget {
  final Tareas listTask;
  const TaskWidget({Key? key, required this.listTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    User user = Provider.of<UserProvider>(context).user;

    return Container(
      padding: const EdgeInsets.only(top: 5, left: 20.0, right: 20.0),
      margin: const EdgeInsets.only(right: 10.0, top: 20),
      height: defaultSize * 22.0,
      decoration: BoxDecoration(
        color: const Color(0xFF8e96e1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.picture_as_pdf,
                      size: defaultSize * 5.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    listTask.nombre!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 1.9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  listTask.estado == "CALIFICADA"
                      ? Container(
                          child: Center(
                            child: Text(
                              listTask.calificacion.toString(),
                              style: TextStyle(
                                fontSize: defaultSize * 3.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          width: 80,
                        )
                      : IconButton(
                          onPressed: () async {},
                          icon: Icon(
                            Icons.help,
                            size: defaultSize * 4.0,
                            color: Colors.white,
                          ),
                        ),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PdfViewerPage(urlArchivoTarea: listTask.urlArchivoTarea , idTarea: listTask.idTarea.toString()),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: defaultSize * 4.0,
                      color: Colors.white,
                    ),
                  ),
                  user.authorities![0] == 'ROLE_STUDENT'
                      ? IconButton(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return ModalTareaEstudiante(idTarea: listTask.idTarea.toString());
                              },
                            );
                          },
                          icon: Icon(
                            Icons.arrow_circle_right,
                            size: defaultSize * 4.0,
                            color: Colors.white,
                          ),
                        )
                      : Container()
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
