import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/upload_file_provider.dart';
import '../../../data/subjects/libro_incierto.dart';

class DetailPage extends StatelessWidget {
  final LibroIncierto detalleDescrubrimiento;
  // ignore: use_key_in_widget_constructors
  const DetailPage(this.detalleDescrubrimiento);

  @override
  Widget build(BuildContext context) {
    final controlador = Provider.of<UploadFileController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(detalleDescrubrimiento.title),
          backgroundColor: const Color(0xFF8e96e1),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _fondo(),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
              child: Scaffold(
                backgroundColor: const Color(0x00dbf3f2).withOpacity(.4),
                body: ListView(
                  children: <Widget>[
                    imagen(detalleDescrubrimiento.image, Colors.black,
                        detalleDescrubrimiento.concepto),
                    const SizedBox(height: 20.0),
                    description(detalleDescrubrimiento.concepto),
                    const SizedBox(height: 15.0),
                    Column(
                      children: const [
                        
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _fondo() {
    final background = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
        Positioned(
          left: -110.0,
          top: -70.0,
          child: Image.asset(
            detalleDescrubrimiento.image,
            width: 350.0,
          ),
        )
      ],
    );
    return background;
  }
}

Widget description(String description) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Conoce m??s ...",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          description,
          style: const TextStyle(color: Colors.blueGrey),
        )
      ],
    ),
  );
}

Widget imagen(String imagePath, Color color, String uniqueId) {
  return SizedBox(
    height: 290.0,
    width: double.infinity,
    child: Center(
      child: Column(
        children: <Widget>[
          Hero(
            tag: "hero$uniqueId",
            child: Image.asset(
              imagePath,
              height: 270.0,
            ),
          ),
        ],
      ),
    ),
  );
}
