import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/assets.dart';
import 'package:mindcare_app/helper/size_config.dart';

import 'package:mindcare_app/view/Doctors/widgets/bubble_date_doctor.dart';
import 'package:mindcare_app/view/Doctors/widgets/custom_profile_image.dart';

class DoctorHomeViewAppointmentsIteam extends StatelessWidget {
  const DoctorHomeViewAppointmentsIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BubbleDateDoctor(
            hour: '2.00 AM',
            month: 'Apr',
            day: '2',
          ),
          SizedBox(
            height: SizeConfig.height! * 0.01,
          ),
          Container(
            height: SizeConfig.height! * 0.24,
            width: SizeConfig.width! * 0.55,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Session",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Waiting for reply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CustomProfileImage(
                      image: Assets.testImage,
                      width: SizeConfig.width! * 0.1,
                      height: SizeConfig.height! * 0.05,
                    ),
                    SizedBox(
                      width: SizeConfig.width! * 0.02,
                    ),
                    const Text(
                      "Kane Brown",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
