import 'dart:async';
import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/data/model/list_task.dart';

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ListTask;

    log("Argumentos del pdf ${args.nombre} ");
    return Scaffold(
      appBar: AppBar(
        title: Text(args.nombre),
      ),
      body: Column(
        children: [
           Expanded(
            child: Center(
              child: Container()
            ),
            flex: 3,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Escribir el puntaje',
                        filled: true,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            Flushbar(
                              title: "Docente",
                              message: "Nota enviada correctamente",
                              duration: const Duration(seconds: 2),
                            ).show(context);

                            Timer(
                              const Duration(seconds: 1),
                              () => Navigator.of(context).pop(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
