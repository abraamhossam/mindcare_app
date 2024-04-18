import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/view/Doctors/views/appointments_view.dart';
import 'package:mindcare_app/view/Doctors/views/enquiry_details_view.dart';

import 'package:mindcare_app/view/Doctors/widgets/doctor_home_view_body.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_messages_body.dart';

class DoctorHomeView extends StatelessWidget {
  DoctorHomeView({super.key});
  static String id = "/homeview";

  final List pages = [
    DoctorHomeViewBody(),
    EnquiryDetailsView(),
    AppointmentsView(),
    DoctorMessagesBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationBarController>(
        init: BottomNavigationBarController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomNavigationBar(
                  elevation: 3,
                  borderRadius: const Radius.circular(20),
                  currentIndex: controller.indexDoctor.value,
                  items: [
                    CustomNavigationBarItem(
                      icon: const Icon(
                        Iconsax.home,
                        size: 26,
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: const Icon(
                        Iconsax.book,
                        size: 26,
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: const Icon(
                        Iconsax.calendar,
                        size: 26,
                      ),
                    ),
                    CustomNavigationBarItem(
                      icon: const Icon(
                        Iconsax.message_text,
                        size: 26,
                      ),
                    ),
                  ],
                  onTap: (i) {
                    controller.indexDoctor.value = i;
                  },
                ),
              ),
              body: pages.elementAt(
                controller.indexDoctor.value,
              ),
            ),
          );
        });
  }
}
// CurvedNavigationBar(
//                 height: 50,
//                 backgroundColor: Colors.transparent,
//                 buttonBackgroundColor: kPrimaryColor,
//                 color: kPrimaryColor,
//                 animationDuration: const Duration(microseconds: 300),
//                 items: <Widget>[
//                   const Icon(
//                     Icons.home,
//                     size: 26,
//                     color: Colors.white,
//                   ),
//                   const Icon(
//                     Icons.contact_mail_outlined,
//                     size: 26,
//                     color: Colors.white,
//                   ),
//                   const Icon(
//                     Icons.date_range,
//                     size: 26,
//                     color: Colors.white,
//                   ),
//                   const Icon(
//                     Icons.notifications_none,
//                     size: 26,
//                     color: Colors.white,
//                   ),
//                 ],
//                 onTap: (index) {
//                   controller.index.value = index;
//                 },
//               ),