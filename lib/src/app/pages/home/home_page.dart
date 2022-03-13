import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/home/dashboard.dart';

import '../../../data/model/user.dart';
import '../../../data/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Usuario: ${user.correo}",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rol : ${user.authorities![0].authority}",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /* IconButton(
                    alignment: Alignment.topCenter,
                    icon: Image.asset(
                      "assets/homepage/notification.png",
                      width: 24,
                    ),
                    onPressed: () {},
                  ) */
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridDashboard()
          ],
        ),
      ),
    );
  }
}
