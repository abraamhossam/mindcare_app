import 'package:flutter/material.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/appointments_view_appointment_list_view.dart';

class AppointmentsViewBody extends StatelessWidget {
  const AppointmentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const AppointmentsViewAppointmentListView();
  }
}
