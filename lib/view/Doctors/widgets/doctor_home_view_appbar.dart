import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/assets.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/custom_profile_image.dart';

class DoctorHomeViewAppbar extends StatelessWidget {
  const DoctorHomeViewAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomProfileImage(
          image: Assets.testImage,
          width: SizeConfig.width! * 0.14,
          height: SizeConfig.height! * 0.07,
        ),
        SizedBox(
          width: SizeConfig.width! * 0.05,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Jessica",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 32,
          ),
        ),
      ],
    );
  }
}
