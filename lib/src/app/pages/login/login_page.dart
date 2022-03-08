import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/home/home_page.dart';

import '../../widgets/background.dart';
import '../register/register_page.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {

  
  String username = '', password = '';
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void doLogin() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      Navigator.pushReplacementNamed(context, 'home');
    }
    else{
       Flushbar(
        title: "Error",
        message: "Debes ingresar correo y contraseña",
        duration: const Duration(seconds: 2),
      ).show(context);
    }
  }


    Size size = MediaQuery.of(context).size;
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
                      "Bienvenido",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Color(0xFF2661FA), fontSize: 36),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Correo"),
                     autofocus: false,
                    onSaved: (value) => username = value as String,
                    validator: (value) => value!.isEmpty ? "Ingresa tu correo" : null,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Contraseña"),
                    obscureText: true,
                    validator: (value) => value!.isEmpty ? "La contraseña es obligatoria" : null,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: const Text(
                    "¿Olvidaste la contraseña?",
                    style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: doLogin,
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
                            Color.fromARGB(255, 255, 177, 41)
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Iniciar",
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
                    onTap: () => {
                      Navigator.pushNamed(
                        context,
                        'register'
                      ),
                    },
                    child: const Text(
                      "¿No tienes una cuenta? Créala",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF2661FA),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
