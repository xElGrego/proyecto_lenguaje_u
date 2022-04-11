import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/data/model/list_class.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/listClass_provider.dart';

import '../../../data/model/user.dart';
import '../../../data/provider/user_provider.dart';
import '../../widgets/grup_tile.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF8e96e1),
              Color.fromRGBO(173, 187, 238, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Cursos",
                      style: GoogleFonts.antic(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: getListClass(user.token!),
                  builder: (context, snapshot) => snapshot.hasData
                      ? GroupTile(listaClases: snapshot.data as ListaClases)
                      : Center(
                          child: Image.asset('assets/ripple.gif'),
                        ),
                ),

                /* child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GroupTile(
                      name: "Lenguaje",
                      subject: "Año lectivo",
                      time: "2022",
                      function: () {
                        Navigator.pushNamed(context, 'coursesContent');
                      },
                    );
                  },
                ), */
              ),
            ),
          ],
        ),
      ),
    );
  }
}
