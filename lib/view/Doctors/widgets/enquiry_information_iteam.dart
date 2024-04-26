import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/custom_dot.dart';

class EnquiryInformationIteam extends StatelessWidget {
  const EnquiryInformationIteam({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitleColor,
  });
  final String title, subTitle;

  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 8,
          ),
          child: CustomDot(),
        ),
        SizedBox(
          width: SizeConfig.width! * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: kPrimaryColor.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: subTitleColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
