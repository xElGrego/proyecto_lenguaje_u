import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/url.dart';

class UploadFileController extends ChangeNotifier {
  var _file;

  bool _showButton = false;

  String _nombre = '';
  String _descripcion = '';

  get nombre => _nombre;
  set nombre(value) {
    _nombre = value;
  }

  get descripcion => _descripcion;
  set descripcion(value) {
    _descripcion = value;
  }

  get showButton => _showButton;
  set showButton(value) {
    _showButton = value;
  }

  get file => _file;
  set file(value) {
    _file = value;
    log("Relogeando");
    showButton = true;
    notifyListeners();
  }

  void initState() {
    log("init desde upload file controller");
  }

  @override
  void dispose() {
    log("dispose desde upload file controller");
    file = null;
    _showButton = false;
    notifyListeners();
    super.dispose();
  }

   Future<Map<String, dynamic>>  enviarTarea(PlatformFile file, nombre, descripcion, autorizathion) async {
    Map<String, dynamic> result;

    Map<String, String> headers = {
      'cache-control': 'no-cache',
      "Content-Type": "multipart/form-data",
      'Authorization': autorizathion
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(AppUrl.uploadTask),
    );
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path!,
      ),
    );
    request.fields["nombre"] = nombre;
    request.fields["descripcion"] = descripcion;
    var res = await request.send();

    if (res.statusCode == 200) {
      result = {'status': true, 'message': 'Successful'};
    } else {
      result = {'status': false, 'message': 'Error'};
    }

    log("Res $res");
    _showButton = false;
    notifyListeners();
    return result;
  }


   Future<Map<String, dynamic>>  enviarTareaEstudiante(PlatformFile file, autorizathion,String idTarea) async {
    Map<String, dynamic> result;

    Map<String, String> headers = {
      'cache-control': 'no-cache',
      "Content-Type": "multipart/form-data",
      'Authorization': autorizathion
    };

    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(AppUrl.uploadTaskStuden+idTarea),
    );
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path!,
      ),
    );

    var res = await request.send();

    if (res.statusCode == 200) {
      result = {'status': true, 'message': 'Successful'};
    } else {
      result = {'status': false, 'message': 'Error'};
    }

    _showButton = false;
    notifyListeners();
    return result;
  }


}
