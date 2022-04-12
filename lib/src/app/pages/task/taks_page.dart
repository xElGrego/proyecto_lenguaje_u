import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_lenguaje_u/src/data/model/list_task.dart';

import '../../../data/model/user.dart';
import '../../../data/provider/list_task.dart';
import '../../../data/provider/user_provider.dart';
import '../../widgets/task_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tareas"),
          backgroundColor: const Color(0xFF8e96e1),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: getTask(user.token!),
            builder: (context, snapshot) => snapshot.hasData
                ? ListTaskesito(listTask: snapshot.data as List<ListTask>)
                : Center(child: Image.asset('assets/ripple.gif')),
          ),
        ),
      ),
    );
  }
}

class ListTaskesito extends StatelessWidget {
  const ListTaskesito({
    Key? key,
    required this.listTask,
  }) : super(key: key);

  final List<ListTask> listTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          listTask.length,
          (index) => TaskWidget(
            listTask: listTask[index],
          ),
        ),
      ),
    );
  }
}
