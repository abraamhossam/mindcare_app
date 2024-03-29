import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/custom_dot.dart';

class EnquiryInformationIteam extends StatelessWidget {
  const EnquiryInformationIteam({
    super.key,
    required this.title,
    required this.subTitle,
    this.decoration,
    this.subTitleColor,
    this.padding,
  });
  final String title, subTitle;
  final BoxDecoration? decoration;
  final Color? subTitleColor;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Row(
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
              Container(
                padding: padding,
                decoration: decoration,
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: subTitleColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
