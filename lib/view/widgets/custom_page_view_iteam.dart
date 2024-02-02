import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mindcare_app/utils/size_config.dart';

class CustomPageViewIteam extends StatelessWidget {
  const CustomPageViewIteam(
      {super.key,
      required this.image,
      required this.text,
      required this.subText});
  final String image;
  final String text;
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
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
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
