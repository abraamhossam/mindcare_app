import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, right: 10, bottom: 8),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70),
        ),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 35),
        elevation: 3,
        minWidth: 150,
        color: const Color(0xffECECEC),
        child: Text(
          title.tr,
          style: const TextStyle(
            fontSize: 23,
            color: Color(0xff737373),
          ),
        ),
      ),
    );
  }
}
