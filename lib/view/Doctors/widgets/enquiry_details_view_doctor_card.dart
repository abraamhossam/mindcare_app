import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/utils/assets.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/custom_profile_image.dart';

class EnquiryDetailsViewDoctorCard extends StatelessWidget {
  const EnquiryDetailsViewDoctorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height! * 0.1,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.width! * 0.06,
          ),
          CustomProfileImage(
            image: Assets.testImage,
            width: SizeConfig.width! * 0.12,
            height: SizeConfig.height! * 0.06,
          ),
          SizedBox(
            width: SizeConfig.width! * 0.04,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jessica Simpson",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Requster",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
