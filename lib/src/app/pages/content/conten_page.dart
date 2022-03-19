import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../../data/provider/upload_file_provider.dart';
import '../../../data/subjects/libro_incierto.dart';
import 'content_detail.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista de temas"),
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
