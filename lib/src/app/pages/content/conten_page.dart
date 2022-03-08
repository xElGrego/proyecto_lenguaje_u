import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contenido"),
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Text("Contenido"),
          ),
        ),
      ),
    );
  }
}
