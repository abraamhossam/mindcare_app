import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_home_title.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_home_view_appbar.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_home_view_appointments_list_view.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_virtual_consultation_body.dart';

class DoctorHomeViewBody extends StatelessWidget {
  DoctorHomeViewBody({super.key});
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.height! * 0.02,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DoctorHomeViewAppbar(),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DoctorHomeTitle(
                text: "Next appointments",
              ),
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: IconButton(
                  onPressed: () {
                    _controller.animateTo(
                      _controller.position.maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.01,
        ),
        DoctorHomeViewAppointmentsListView(Controller: _controller),
        SizedBox(
          height: SizeConfig.height! * 0.02,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DoctorHomeTitle(
            text: "Patient's digital access",
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.01,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DoctorVirtualConsultationBody(),
        ),
      ],
    );
  }
}
