import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';

class TestTypeIteam extends StatelessWidget {
  const TestTypeIteam({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 4,
          color: kPrimaryColor,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
