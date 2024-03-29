import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/appointment_card.dart';
import 'package:mindcare_app/view/Doctors/widgets/bubble_date.dart';

class AppointmentsViewAppointmentIteam extends StatelessWidget {
  const AppointmentsViewAppointmentIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.265,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BubbleDate(
            color1: Colors.white,
            color2: kPrimaryColor,
          ),
          AppointmentCard(
            width: SizeConfig.width! * 0.68,
            padding: 24,
          ),
        ],
      ),
    );
  }
}
