import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../services/url.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<File> verPdf(String token, String nombre) async {
  var file;
  var tempDir;
  String tempPath;

  try {
    http.get(
      Uri.parse(AppUrl.seeDocument + nombre),
      headers: {'Authorization': token, 'Content-Type': 'application/json'},
    ).then(
      (res) async => {
        if (res.statusCode == 200)
          {
            log("Respuesta correcta"),
            tempDir = await getTemporaryDirectory(),
            log("TempDir: $tempDir"),
            tempPath = tempDir.path,
            file = File('$tempPath/$nombre'),
            file = await file.writeAsBytes(res.bodyBytes),
            log("File $file"),
          }
        else
          {
            log("Error"),
           
          }
      },
    );
  } catch (e) {
    log("Error en el catch  ${e.toString()}");
    throw Exception('Error');
  }
  log("Antes del return");
  return file;
}
