import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mindcare_app/utils/size_config.dart';

// ignore: must_be_immutable
class CustomPageViewIteam extends StatelessWidget {
  CustomPageViewIteam(
      {super.key,
      required this.image,
      required this.text,
      required this.subText});
  final String image;
  String? text;
  final String subText;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.height! * 0.05,
        ),
        Lottie.asset(
          image,
          height: SizeConfig.height! * 0.4,
        ),
        Text(
          text!,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              subText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
