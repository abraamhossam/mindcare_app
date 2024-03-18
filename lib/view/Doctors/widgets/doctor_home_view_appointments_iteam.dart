import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/appointment_card.dart';
import 'package:mindcare_app/view/Doctors/widgets/bubble_date.dart';

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
          const BubbleDate(
            color1: kPrimaryColor,
            color2: Colors.white,
          ),
          SizedBox(
            height: SizeConfig.height! * 0.01,
          ),
          AppointmentCard(
            width: SizeConfig.width! * 0.55,
            height: SizeConfig.height! * 0.24,
          ),
        ],
      ),
    );
  }
}
