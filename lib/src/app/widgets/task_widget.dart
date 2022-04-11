import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_lenguaje_u/src/data/model/list_task.dart';

class TaskWidget extends StatelessWidget {
 
  final ListTask listTask;

  const TaskWidget({Key? key, required this.listTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    log("List task $listTask");

    return Container(
      padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      margin: const EdgeInsets.only(right: 10.0,top: 20),
      height: 170,
      width: 320,
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
                child: const Center(
                  child: Icon(
                    Icons.picture_as_pdf,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
             
            ],
          ),
          const SizedBox(height: 15),
  
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listTask.nombre,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
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
          const SizedBox(height: 10),
         /*  Stack(
            children: [
              Container(
                height: 6.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: (note > 3 && note <= 6
                      ? Colors.amber[400]
                      : note >= 7
                          ? Colors.green
                          : Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
