import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/user.dart';
import '../../../../data/provider/sendNote.dart';
import '../../../../data/provider/servicesPdf.dart';
import '../../../../data/provider/user_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class PdfViewerPage extends StatelessWidget {
  PdfViewerPage({Key? key, required this.urlArchivoTarea, required this.idTarea}) : super(key: key);
  String? urlArchivoTarea;
  String idTarea;
  String nota = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    log("Url en el pdf $urlArchivoTarea");

    void sendTarea() {
      final form = _formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose = calificarTarea(user.token!, idTarea, nota);

        respose.then((response) {
          if (response["status"]) {
            Flushbar(
              title: "",
              message: "La tarea se ha calificado con éxito",
              duration: const Duration(seconds: 2),
            ).show(context);
          } else {
            Flushbar(
              title: "Error",
              message: "Error, no se ha calificado la tarea",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            flex: 3,
            child: Center(
              child: FutureBuilder(
                future: verPdf(user.token!, urlArchivoTarea!),
                builder: (context, snapshot) => snapshot.hasData
                    ? SfPdfViewer.file(
                        snapshot.data as File,
                      )
                    : Center(
                        child: Image.asset('assets/ripple.gif'),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 45),
          user.authorities![0] == 'ROLE_ADMIN'
              ? Expanded(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              onSaved: (value) => nota = value as String,
                              validator: (value) =>
                                  value!.isEmpty ? "Por favor ingrese una nota" : null,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Escribir el puntaje',
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: sendTarea,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
