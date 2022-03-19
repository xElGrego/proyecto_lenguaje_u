
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/data/provider/botton_navigation_provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlador = Provider.of<BottonNavigationProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          fixedColor:  const Color(0xFF8e96e1),
          currentIndex: controlador.currentTab,
          onTap: (int index) {
            controlador.currentTab = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Cursos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Tareas',
            ),
          ],
        ),
        body: controlador.currentScreen,
      ),
    );
  }
}
