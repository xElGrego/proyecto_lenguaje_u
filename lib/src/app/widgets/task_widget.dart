import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/config.dart';
import '../../data/model/list_task.dart';
import '../pages/task/pdf_view/view_pdf_page.dart';

class TaskWidget extends StatelessWidget {
  final ListTask listTask;

  const TaskWidget({Key? key, required this.listTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    /* log("Tamaño dispositivo $defaultSize"); */
    log("Calificado: ${listTask.estado}");

    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
      margin: const EdgeInsets.only(right: 10.0, top: 20),
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF8e96e1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.picture_as_pdf,
                    size: defaultSize * 4.0,
                    color: Colors.white,
                  ),
                ),
              ),
              listTask.estado == "NO_CALIFICADA"
                  ? Container(
                      child: Icon(
                        Icons.help,
                        color: Colors.black,
                        size: defaultSize * 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 80,
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          listTask.calificacion.toString(),
                          style: TextStyle(
                            fontSize: defaultSize * 2.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 80,
                    )
            ],
          ),
          SizedBox(height: defaultSize * 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listTask.nombre,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: defaultSize * 2.0,
                ),
              ),
              Text(
                '',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Stack(
            children: [
                listTask.estado != "NO_CALIFICADA" ? Container(
                height: 6.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (listTask.calificacion > 3 && listTask.calificacion <= 6
                      ? Colors.amber[400]
                      : listTask.calificacion >= 7
                          ? Colors.green
                          : Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ) : Container()
            ],
          ),
        ],
      ),
    );
  }
}
