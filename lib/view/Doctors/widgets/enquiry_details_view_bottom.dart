import 'package:flutter/material.dart';
import 'package:mindcare_app/helper/size_config.dart';

class EnquiryDetailsViewBottom extends StatelessWidget {
  const EnquiryDetailsViewBottom(
      {super.key,
      required this.ontap,
      required this.text,
      required this.color,
      required this.backgroundColor});
  final VoidCallback ontap;
  final String text;
  final Color color, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(
            SizeConfig.width! * 0.85,
            SizeConfig.height! * 0.05,
          ),
        ),
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
