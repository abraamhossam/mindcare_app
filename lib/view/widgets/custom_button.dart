import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.ontap,
    required this.text,
  });
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(SizeConfig.width! * 0.9, 50),
        backgroundColor: kPrimaryColor,
      ),
      onPressed: ontap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
