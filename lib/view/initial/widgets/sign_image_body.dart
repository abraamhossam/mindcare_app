// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';

class SignImageBody extends StatelessWidget {
  SignImageBody({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        ClipPath(
          clipper: ContinerClipper(),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: SizeConfig.height! * 0.45,
            width: SizeConfig.width!,
          ),
        ),
        ClipPath(
          clipper: ContinerClipper(),
          child: Container(
            color: kPrimaryColor,
            height: SizeConfig.height! * 0.43,
            width: SizeConfig.width!,
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height! * 0.02,
                ),
                CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.user,
                      size: 80,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ContinerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.92);
    var fristStart = Offset(size.width * 0.2, size.height * 0.95);
    var fristEnd = Offset(size.width * 0.4, size.height * 0.9);
    path.quadraticBezierTo(
        fristStart.dx, fristStart.dy, fristEnd.dx, fristEnd.dy);
    var secondStart = Offset(size.width * 0.75, size.height * 0.8);
    var secondEnd = Offset(size.width, size.height * 0.9);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
