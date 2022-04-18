import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../services/url.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<File> verPdf(String token, String nombre) async {
  var file;
  var tempDir;
  String tempPath;

  try {
    final response = await http.get(
      Uri.parse(AppUrl.seeDocument + nombre),
      headers: {'Authorization': token, 'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      tempDir = await getApplicationDocumentsDirectory();
      tempPath = DateTime.now().millisecondsSinceEpoch.toString();
      file = File(path.join(tempDir.path, '$tempPath.pdf'));
      await file.writeAsBytes(response.bodyBytes);
    } else {
      
    }
  } catch (e) {
    log("Error en el catch  ${e.toString()}");
    throw Exception('Error');
  }
  return file;
}
