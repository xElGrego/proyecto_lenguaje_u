import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/content/content_detail.dart';

import '../../../data/subjects/libro_incierto.dart';
import '../../../data/subjects/list_unidades.dart';

class ListViewUnit extends StatelessWidget {

  final Unidades unidades;
  const ListViewUnit({Key? key, required this.unidades}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(unidades.title),
           backgroundColor: const Color(0xFF8e96e1),
        ),
        body: ListView.builder(
          itemCount: libroInciertoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(libroInciertoList[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      libroInciertoList[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
