import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GrdiDashboardTeacher extends StatelessWidget {
  
  Items item1 = Items(
    title: "Contenido",
    subtitle: "Contenido del docente",
    ruta: "content",
    img: "assets/homepage/todo.png",
  );
  Items item2 = Items(
    title: "Tareas",
    subtitle: "Revisa tus tareas",
    ruta: "task",
    img: "assets/homepage/todo.png",
  );

  Items item3 = Items(
    title: "Videos",
    subtitle: "Revisa tus videos",
    ruta: "videos",
    img: "assets/homepage/todo.png",
  );

   Items item4 = Items(
    title: "Estudiantes",
    subtitle: "Ver listado de estudiantes",
    ruta: "listStudent",
    img: "assets/homepage/todo.png",
  );


  GrdiDashboardTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [ item2, item1, item3, item4];
    var color = 0xFF8e96e1;
    return Flexible(
      child: GridView.count(
         physics: const BouncingScrollPhysics(),
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: (() {
              Navigator.pushNamed(context, data.ruta);
            }),
            child: Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        color: Colors.white60,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String ruta;
  String img;
  Items({
    required this.title,
    required this.subtitle,
    required this.ruta,
    required this.img,
  });
}
