import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddNewTask extends StatelessWidget {
  AddNewTask({
    super.key,
    this.onTap,
    required this.text,
  });
  void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(
              Icons.add_circle,
              color: Colors.blue,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
