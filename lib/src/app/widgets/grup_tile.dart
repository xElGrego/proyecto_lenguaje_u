// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final String name;
  final String subject;
  final String time;
  final VoidCallback function;

  // ignore: use_key_in_widget_constructors
  const GroupTile({this.name = "", this.subject = "", this.time = "", required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(
            Icons.school,
          ),
          title: Text(name),
          subtitle: Text('$subject - $time'),
          trailing: FlatButton(
            child: const Text(
              'Ir al curso',
              style: TextStyle(color: Colors.white),
            ),
            color: const Color(0xFF8e96e1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: function,
          ),
          onTap: function,
        ),
        const Divider(thickness: 1.5)
      ],
    );
  }
}
