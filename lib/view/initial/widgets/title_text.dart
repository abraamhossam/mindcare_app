import 'package:flutter/material.dart';

class ListTitleWdiget extends StatelessWidget {
  const ListTitleWdiget(
      {super.key,
      required this.leading,
      required this.title,
      required this.subtitle});
  final Icon leading;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 0.0,
        child: ListTile(
          leading: leading,
          title: Text(
            // "Name",
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            // "Mary",
            subtitle,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
