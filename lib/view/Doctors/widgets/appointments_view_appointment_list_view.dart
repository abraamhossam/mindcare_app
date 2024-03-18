import 'package:flutter/widgets.dart';
import 'package:mindcare_app/view/Doctors/widgets/appointments_view_appointment_iteam.dart';

class AppointmentsViewAppointmentListView extends StatelessWidget {
  const AppointmentsViewAppointmentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              bottom: 16,
            ),
            child: AppointmentsViewAppointmentIteam(),
          );
        },
      ),
    );
  }
}
