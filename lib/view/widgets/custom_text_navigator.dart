import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';

class CustomTextNavigator extends StatelessWidget {
  const CustomTextNavigator({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: ontap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
