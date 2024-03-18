import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 4,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(32),
      ),
    );
  }
}
