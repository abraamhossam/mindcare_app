import 'package:flutter/material.dart';

void snackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 6.0,
      margin: const EdgeInsets.all(26),
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      // width: 50,
      content: Center(child: Text(message)),
    ),
  );
}
