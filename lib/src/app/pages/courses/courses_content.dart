import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/model/list_class.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/user_provider.dart';
import '../home/dashboard.dart';
import '../home/dashboard_teacher.dart';

class CoursesContent extends StatelessWidget {
  const CoursesContent({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ListaClases;
    User user = Provider.of<UserProvider>(context).user;

    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(
        title:  Text("Contenido: sala -> ${args.idSala}"  ),
        backgroundColor: const Color(0xFF8e96e1),
        ),
        body:Column(
          children: [
            const SizedBox(height: 20),
            user.authorities![0] == 'ROLE_STUDENT' ? GridDashboard(args:args) : GrdiDashboardTeacher(args:args) 
          ],
        ),
      ),
    );
  }
}
