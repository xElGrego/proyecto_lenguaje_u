import 'package:flutter/material.dart';

import '../../widgets/task_widget.dart';

class TaskGeneralPage extends StatelessWidget {
  const TaskGeneralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tareas Globales"),
          backgroundColor: const Color(0xFF8e96e1),
          elevation: 0,
          automaticallyImplyLeading: false,
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 15),
            children: const [
              TaskWidget(
                note: 10,
                title: 'Actividad 1',
                color: Color.fromARGB(255, 19, 133, 42),
                fecha: '03/02/2021',
              ),
              SizedBox(height: 15,),
              TaskWidget(
                note: 6,
                title: 'Actividad 2',
                color: Color(0xffFFA800),
                fecha: '01/02/2020',

              ),
              SizedBox(height: 15,),
              TaskWidget(
                note: 3,
                title: 'Actividad 3',
                color: Colors.red,
                fecha: '05/02/2021',

              ),
            ],
          ),
        ),
      ),
    );
  }
}
