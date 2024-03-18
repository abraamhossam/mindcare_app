import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/doctor_bottom_navigation_bar_controller.dart';
import 'package:mindcare_app/view/Doctors/views/appointments_view.dart';
import 'package:mindcare_app/view/Doctors/views/enquiry_details_view.dart';
import 'package:mindcare_app/view/Doctors/views/notifications_view.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_home_view_body.dart';

class DoctorHomeView extends StatelessWidget {
  DoctorHomeView({super.key});
  static String id = "/homeview";
  final DoctorBottomNavigationBarController controller = Get.find();
  final List pages = [
    DoctorHomeViewBody(),
    EnquiryDetailsView(),
    AppointmentsView(),
    NotificationsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SafeArea(
          child: SafeArea(
            child: Scaffold(
              bottomNavigationBar: controller.selectIndex.value == 0 ||
                      controller.selectIndex.value == 1
                  ? CurvedNavigationBar(
                      height: 50,
                      backgroundColor: Colors.transparent,
                      buttonBackgroundColor: kPrimaryColor,
                      color: kPrimaryColor,
                      animationDuration: const Duration(microseconds: 300),
                      items: <Widget>[
                        const Icon(
                          Icons.home,
                          size: 26,
                          color: Colors.white,
                        ),
                        const Icon(
                          Icons.contact_mail_outlined,
                          size: 26,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(AppointmentsView.id);
                          },
                          icon: const Icon(
                            Icons.date_range,
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(NotificationsView.id);
                          },
                          icon: const Icon(
                            Icons.notifications_none,
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      onTap: (index) {
                        controller.selectIndex.value = index;
                      },
                    )
                  : null,
              body: pages.elementAt(
                controller.selectIndex.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
