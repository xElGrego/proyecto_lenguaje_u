import 'package:flutter/material.dart';

import '../home/dashboard.dart';

class CoursesContent extends StatelessWidget {
  const CoursesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(
        title: const Text("Contenido"),
        backgroundColor: const Color(0xFF8e96e1),
        ),
        body:Column(
          children: [
            const SizedBox(height: 20),
            GridDashboard()
          ],
        ),
      ),
    );
  }
}
