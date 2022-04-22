import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/model/list_class.dart';
import '../../../data/model/lista_students.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/user_provider.dart';
import '../../../funcionesGenerales/modal_tarea_2.dart';
import '../../widgets/task_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  //AQUI VAN LAS TAREAS INDIVIDUALES
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;
    final args = ModalRoute.of(context)!.settings.arguments as ListaClases;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tareas"),
          backgroundColor: const Color(0xFF8e96e1),
          elevation: 0,
        ),
        floatingActionButton: user.authorities![0] == 'ROLE_ADMIN'
            ? FloatingActionButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return ModalTarea();
                    },
                  );
                },
                backgroundColor: const Color.fromARGB(255, 118, 108, 93),
                child: const Icon(
                  Icons.upload_file,
                  size: 40,
                  color: Colors.white,
                ),
              )
            : Container(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: args.materia!.tareas!.isEmpty
              ? const Center(
                  child:  Text("No tiene tareas", style: TextStyle(fontSize: 24),),
                )
              : ListTaskesito(listTask: args.materia!.tareas!),
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

  final List<Tareas> listTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          listTask.length,
          (index) => TaskWidget(
            listTask: listTask[index],
            nombre: listaStudiantes[index],
          ),
        ),
      ),
    );
  }
}
