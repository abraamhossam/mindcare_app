import 'package:flutter/widgets.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_home_view_appointments_iteam.dart';

class DoctorHomeViewAppointmentsListView extends StatelessWidget {
  const DoctorHomeViewAppointmentsListView({
    super.key,
    required ScrollController Controller,
  }) : _Controller = Controller;

  final ScrollController _Controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: SizeConfig.height! * 0.35,
        child: ListView.builder(
          controller: _Controller,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const DoctorHomeViewAppointmentsIteam();
          },
        ),
      ),
    );
  }
}
