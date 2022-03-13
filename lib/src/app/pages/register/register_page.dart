import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/login/login_page.dart';
import '../../../data/provider/register_controller.dart';
import '../../widgets/background.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Background(
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
                child: const TextField(
                  decoration: InputDecoration(labelText: "Nombre"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const TextField(
                  decoration: InputDecoration(labelText: "Teléfono"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const TextField(
                  decoration: InputDecoration(labelText: "Usuario"),
                ),
              ),
              /* Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: DropdownButton<String>(
                  value: controller.item.toString(),
                  items: controller.items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: controller.item,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value){
                    log(value!);
                  },
                ),
              ), */
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const TextField(
                  decoration: InputDecoration(labelText: "Contraseña"),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {},
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
                      "Ingresar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, 'login')},
                  child: const Text(
                    "¿Ya tienes una cuenta?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
