import 'package:flutter/material.dart';

import '../../widgets/task_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tareas"),
          backgroundColor: const Color(0xFF8e96e1),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 15),
            children: const [
              TaskWidget(
                note: 10,
                title: 'Tarea 1',
                color: Color.fromARGB(255, 19, 133, 42),
              ),
              SizedBox(height: 15,),
              TaskWidget(
                note: 6,
                title: 'Tarea 2',
                color: Color(0xffFFA800),
              ),
              SizedBox(height: 15,),
              TaskWidget(
                note: 3,
                title: 'Tarea 3',
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
