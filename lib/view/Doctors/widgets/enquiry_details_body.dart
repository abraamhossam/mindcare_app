import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_home_title.dart';
import 'package:mindcare_app/view/Doctors/widgets/enquiry_details_view_bottom.dart';
import 'package:mindcare_app/view/Doctors/widgets/enquiry_details_view_doctor_card.dart';
import 'package:mindcare_app/view/Doctors/widgets/enquiry_information_iteam.dart';

class EnquiryDetailsBody extends StatelessWidget {
  const EnquiryDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        children: [
          const EnquiryDetailsViewDoctorCard(),
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DoctorHomeTitle(
                  text: "Enquiry information",
                ),
                SizedBox(
                  height: SizeConfig.height! * 0.01,
                ),
                const EnquiryInformationIteam(
                  title: "service name",
                  subTitle: "Percision Medicine",
                ),
                const EnquiryInformationIteam(
                  title: "consulation type",
                  subTitle: "Video call",
                  subTitleColor: Colors.black,
                ),
                const EnquiryInformationIteam(
                  title: "status",
                  subTitle: "Wait for call",
                  subTitleColor: Colors.black,
                ),
              ],
            ),
          ),
          Column(
            children: [
              EnquiryDetailsViewBottom(
                ontap: () {},
                text: "Start the call",
                color: Colors.white,
                backgroundColor: kPrimaryColor,
              ),
              EnquiryDetailsViewBottom(
                ontap: () {},
                text: "Reschedule",
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
              EnquiryDetailsViewBottom(
                ontap: () {},
                text: "I will be late",
                color: Colors.black,
                backgroundColor: Colors.white,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
            child: EnquiryInformationIteam(
              title: "Date created",
              subTitle: "December 1, 2021",
            ),
          ),
        ],
      ),
    );
  }
}
