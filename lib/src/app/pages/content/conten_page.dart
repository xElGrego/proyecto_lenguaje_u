import 'package:flutter/material.dart';
import 'package:proyecto_lenguaje_u/src/app/pages/content/listViewUnit.dart';
import '../../../config/config.dart';
import '../../../data/subjects/list_unidades.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Unidades"),
          backgroundColor: const Color(0xFF8e96e1),
        ),
        body: ListView.builder(
          itemCount: unidadesList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListViewUnit(
                      unidades: unidadesList[index],
                    ),
                  ),
                );
              },
              child: unidadWidget(unidadesList[index].title),
            );
          },
        ),
      ),
    );
  }

  Padding unidadWidget(String title) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
        height: defaultSize * 9.5,
        child: AspectRatio(
          aspectRatio: defaultSize,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF8e96e1),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: defaultSize * 2),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: defaultSize * 1.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
