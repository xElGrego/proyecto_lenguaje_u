// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/shared_preferences.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/user_provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            letterSpacing: 2,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white30,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    User user = Provider.of<UserProvider>(context).user;

    String token = user.token!;
  
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    


    /* log("$heigth"); */
    /* log("Authorities: ${user.authorities![0]}"); */
   /*  log(user.authorities![0]); */

    // ignore: avoid_print
    print(user.authorities![0]);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: heigth / 2,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(hintText: "Correo: ${user.correo}"),
                    textfield(hintText: "Nombre: ${decodedToken["fullname"]}"),
                    user.authorities![0] == 'ROLE_STUDENT' ?  textfield(hintText: "Rol: Estudiante") :  textfield(hintText: "Rol: Docente") 
                    /* textfield(hintText: "Apellidos: Galarza"), */
                  ],
                ),
              ),
            ],
          ),
          CustomPaint(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Positioned(
            top: 10,
            left: 0,
            child: IconButton(
              onPressed: () {
                UserPreferences().removeUser();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: const Icon(
                Icons.logout,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Perfil",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.person_pin,
                  size: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF8e96e1);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 190, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
