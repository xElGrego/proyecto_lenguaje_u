import 'package:flutter/material.dart';

import '../home/dashboard.dart';

class CoursesContent extends StatelessWidget {
  const CoursesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridDashboard(),
    );
  }
}
