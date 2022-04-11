import 'dart:async';
import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  /* final pdfController = PdfController(
    document: PdfDocument.openFile('assets/pdfs/documento_1.pdf'),
    
  ); */

  final pdfController = PdfController(document: PdfDocument.openFile('https://cpjuanvazquez.educarex.es/pueris3a5/Alafamilia/Family/Cuadricula.pdf'));


  @override
  void dispose() {
    pdfController.dispose();
    log("Dipose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisar pdfs'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: PdfView(controller: pdfController),
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
