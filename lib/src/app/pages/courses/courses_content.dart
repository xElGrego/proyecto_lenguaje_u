import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/user.dart';
import '../../../data/provider/user_provider.dart';
import '../home/dashboard.dart';
import '../home/dashboard_teacher.dart';

class CoursesContent extends StatelessWidget {
  const CoursesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;
    
    return  SafeArea(
      child:  Scaffold(
        appBar: AppBar(
        title: const Text("Contenido"),
        backgroundColor: const Color(0xFF8e96e1),
        ),
        body:Column(
          children: [
            const SizedBox(height: 20),
            user.authorities![0] == 'ROLE_STUDENT' ? GridDashboard() : GrdiDashboardTeacher() 

          ],
        ),
      ),
    );
  }
}
