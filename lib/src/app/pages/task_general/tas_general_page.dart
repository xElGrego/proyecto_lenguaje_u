import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/task/taks_page.dart';

import '../../../data/model/list_class.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/list_task.dart';
import '../../../data/provider/user_provider.dart';
import '../../widgets/task_widget.dart';

class TaskGeneralPage extends StatelessWidget {
  const TaskGeneralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<UserProvider>(context).user;


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
          child:   FutureBuilder(
            future: getTask(user.token!),
            builder: (context, snapshot) => snapshot.hasData
                ? ListTaskesito(listTask: snapshot.data as List<Tareas>)
                : Center(child: Image.asset('assets/ripple.gif')),
          ),
        ),
      ),
    );
  }
}
