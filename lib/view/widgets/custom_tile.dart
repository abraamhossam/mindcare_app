// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile({
    required this.name,
    required this.icon,
    this.tap,
    this.trailing,
    super.key,
  });

  IconData icon;
  String name;
  Function? tap;
  Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        tap!();
      },
      leading: Icon(
        icon,
        color: const Color(0xff2296F3),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      trailing: trailing,
    );
  }
}
