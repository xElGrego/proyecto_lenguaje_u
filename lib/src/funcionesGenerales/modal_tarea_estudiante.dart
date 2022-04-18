
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:proyecto_lenguaje_u/src/config/config.dart';

import '../data/model/user.dart';
import '../data/provider/upload_file_provider.dart';
import '../data/provider/user_provider.dart';



class ModalTareaEstudiante extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final String idTarea;

  ModalTareaEstudiante({Key? key, required this.idTarea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    User user = Provider.of<UserProvider>(context).user;

    
    final controlador = Provider.of<UploadFileController>(context);

    @override
    void enviarTareitaStudent() {
      final form = _formKey.currentState;
      if (form!.validate()) {
        form.save();
       final Future<Map<String, dynamic>> respose = controlador.enviarTareaEstudiante(controlador.file,user.token!,idTarea);
    
         respose.then((response) {
          if (response["status"]) {
           Flushbar(
              title: "",
              message: "La tarea se subió al servidor con éxito.",
              duration: const Duration(seconds: 2),
            ).show(context);
            
          } else {
            Flushbar(
              title: "Error",
              message: "Error,hubo un problema.",
              duration: const Duration(seconds: 2),
            ).show(context);
           
          }
        });

      }
    }

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: const [Text("Subir tarea")],
      ),
      children: [
        Form(
          key: _formKey,
          child: SizedBox(
            height: defaultSize * 20,
            width: defaultSize * 40,
            child: Column(
              children: [
              SizedBox(height: defaultSize * 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result == null) return;
                      controlador.file = result.files.first;
                      log("nombre: ${controlador.file.name}");
                    },
                    child: const Text("Subir archivo"),
                  ),
                ),
                controlador.file != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: Text("${controlador.file.name}"),
                      )
                    : const Text(""),
                SizedBox(height: defaultSize * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "Aceptar",
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                      onPressed: () {
                        enviarTareitaStudent();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

