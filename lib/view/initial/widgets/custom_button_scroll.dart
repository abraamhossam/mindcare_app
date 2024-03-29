import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';

class CustomButtonScroll extends StatelessWidget {
  const CustomButtonScroll({super.key, required this.onpressed});
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: Size(
          SizeConfig.width! * 0.5,
          SizeConfig.width! * 0.15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      onPressed: onpressed,
      child: const Text(
        "Skip",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
