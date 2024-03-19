import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppBarWidget({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.2,
      title: Center(
        child: Text(
          titel,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
