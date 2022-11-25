import 'dart:ffi';

import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({
    super.key,
    required this.icon,
    required this.name,
    required this.func,
  });
  final IconData icon;
  final String name;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(name),
          trailing: IconButton(
            onPressed: func,
            icon: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
