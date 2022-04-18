import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/config.dart';
import '../../../data/model/list_class.dart';
import '../content/conten_page.dart';
import '../content/videos/videos_page.dart';
import '../task/taks_page.dart';

// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  GridDashboard({Key? key, required this.args}) : super(key: key);
  ListaClases? args;

  Items item1 = Items(
      title: "Contenido",
      subtitle: "Contenido del docente",
      ruta: "content",
      img: "assets/homepage/todo.png",
      widget: const ContentPage());
  Items item2 = Items(
    title: "Tareas",
    subtitle: "Revisa tus tareas",
    ruta: "task",
    img: "assets/homepage/todo.png",
    widget: const TaskPage(),
  );

  Items item3 = Items(
    title: "Videos",
    subtitle: "Revisa tus videos",
    ruta: "videos",
    img: "assets/homepage/todo.png",
    widget: const VideosPage(),
  );

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    List<Items> myList = [item2, item1, item3];
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => data.widget,
                  settings: RouteSettings(
                    arguments: args,
                  ),
                ),
              );
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
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: defaultSize * 1.8,
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
  Widget widget;
  Items({
    required this.title,
    required this.subtitle,
    required this.ruta,
    required this.img,
    required this.widget,
  });
}
