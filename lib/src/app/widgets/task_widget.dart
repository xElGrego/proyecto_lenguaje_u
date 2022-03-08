import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskWidget extends StatelessWidget {
  final int note;
  final String title;
  final Color color;
  final String fecha;

  const TaskWidget(
      {Key? key, required this.note, required this.title, required this.color, required this.fecha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      margin: const EdgeInsets.only(right: 10.0),
      height: 170,
      width: 270,
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
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                onPressed: () {
                  log("Navegando");
                },
              )
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Puntaje: $note',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                'fecha: $fecha',
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
          Stack(
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
          ),
        ],
      ),
    );
  }
}


/* Text((managerStatus == "pending")
    ? "Requested"
        : (adminStatus == "confirm")
    ? "Amount credited"
        : "Admin Pending") */