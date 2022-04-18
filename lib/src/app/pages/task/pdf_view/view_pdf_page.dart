import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/user.dart';
import '../../../../data/provider/servicesPdf.dart';
import '../../../../data/provider/user_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class PdfViewerPage extends StatelessWidget {
  PdfViewerPage({Key? key, required this.urlArchivoTarea}) : super(key: key);
  String? urlArchivoTarea;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    log("Url en el pdf $urlArchivoTarea");

    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: FutureBuilder(
                future: verPdf(user.token!, urlArchivoTarea!),
                builder: (context, snapshot) => snapshot.hasData
                    ? SfPdfViewer.asset(
                       '/data/user/0/com.example.proyecto_lenguaje_u/cache/Volumen_25.pdf',
                      )
                    : Center(child: Image.asset('assets/ripple.gif')),
              ),
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
