import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';
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
    LanguageController language = Get.find();
    return Align(
      alignment: language.langeCode == "en"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: GestureDetector(
        onTap: ontap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
