import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  const ListMenu(
      {super.key,
      required this.icon,
      required this.name,
      required this.func,
      this.size = 23});
  final IconData icon;
  final String name;
  final VoidCallback func;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      onTap: func,
      leading: Icon(
        icon,
        color: Colors.black,
        size: size,
      ),
      title: Text(name, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.black,
        size: 40,
      ),
    );
  }
}
