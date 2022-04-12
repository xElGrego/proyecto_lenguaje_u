import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/provider/auth_provider.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  String correo = '', nombre = '', apellidos = '';
  final _formKey = GlobalKey<FormState>();

  AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthProvider>(context);

    void doRegister() {
      final form = _formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose =
            controller.registerStudent(correo, nombre, apellidos);
        respose.then((response) {
          log("response login $response");

          if (response["status"]) {
            Flushbar(
              title: "Éxito",
              message: "Guardado exitosamente.",
              duration: const Duration(seconds: 2),
            ).show(context);
          } else {
            Flushbar(
              title: "Error",
              message: "Error al añadir al estudiante",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        });
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      physics: const BouncingScrollPhysics(),
      primary: true,
      child: Form(
        /*   key: controller.addClientKey, */
        key: _formKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onSaved: (value) => nombre = value as String,
                validator: (value) => value!.isEmpty ? "Ingresa tu nombre" : null,
                decoration: const InputDecoration(
                  icon: SizedBox(
                    width: 100,
                    child: Text(
                      "Nombre",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              TextFormField(
                onSaved: (value) => apellidos = value as String,
                validator: (value) => value!.isEmpty ? "Ingresa tu apellido" : null,
                decoration: const InputDecoration(
                  icon: SizedBox(
                    width: 100,
                    child: Text(
                      "Apellidos",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              TextFormField(
                onSaved: (value) => correo = value as String,
                validator: (value) => value!.isEmpty ? "Ingresa tu correo" : null,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  icon: SizedBox(
                    width: 100,
                    child: Text(
                      "Correo",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      animationDuration: const Duration(seconds: 1),
                      elevation: 0,
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancelar "),
                  ),
                  ElevatedButton(
                    onPressed: doRegister,
                    child: const Text("Aceptar"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF8e96e1),
                      animationDuration: const Duration(seconds: 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
