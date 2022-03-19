import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UploadFileController extends ChangeNotifier {
  var _file;

  bool _showButton = false;

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


  void sendPdf(){
    log("Enviando pdf y reseteando los valores");
    file = null;
    _showButton = false;
    notifyListeners();
  }

  /* void uploadSelectedFile() async {

    final request = http.post(Uri.parse("Your API URL"));

    request.fields["id"] = "abc";
    request.files.add(http.MultipartFile(
        "Your parameter name on server side", objFile.readStream, objFile.size,
        filename: objFile.name));

    var resp = await request.send();

    String result = await resp.stream.bytesToString();

    print(result);
  } */
}
