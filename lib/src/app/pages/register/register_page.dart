// ignore_for_file: deprecated_member_use

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/auth_provider.dart';
import '../../widgets/background.dart';

class RegisterPage extends StatelessWidget {
  String nombre = '', apellido = '', password = '', correo = '';
  final _formKey = GlobalKey<FormState>();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Provider.of<AuthProvider>(context);

    void doRegister() {
      final form = _formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> respose =
            controller.registerDocent(correo, nombre, apellido, password);

        respose.then((response) {
          if (response["status"]) {
            Flushbar(
              title: "Aprobado",
              message: "Éxito,se ha creado el usuario correctamente",
              duration: const Duration(seconds: 2),
            ).show(context);
          } else {
            Flushbar(
              title: "Error",
              message: "Error, no se creó al usuario",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Background(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "Registro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 36,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Nombre"),
                    autofocus: false,
                    onSaved: (value) => nombre = value as String,
                    validator: (value) => value!.isEmpty ? "Ingresa tu nombre" : null,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Apellido"),
                    autofocus: false,
                    onSaved: (value) => apellido = value as String,
                    validator: (value) => value!.isEmpty ? "Ingresa tu apellido" : null,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Correo"),
                    autofocus: false,
                    onSaved: (value) => correo = value as String,
                    validator: (value) => value!.isEmpty ? "Ingresa tu correo" : null,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Contraseña"),
                    autofocus: false,
                    onSaved: (value) => password = value as String,
                    validator: (value) => value!.isEmpty ? "Ingresa tu contraseña" : null,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: doRegister,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 136, 34),
                            Color.fromARGB(255, 255, 177, 41),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Crear cuenta",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, 'login')},
                    child: const Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF2661FA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
