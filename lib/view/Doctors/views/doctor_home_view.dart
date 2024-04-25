import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/view/Doctors/views/appointments_view.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_admin_view.dart';
import 'package:mindcare_app/view/Doctors/views/enquiry_details_view.dart';

import 'package:mindcare_app/view/Doctors/widgets/doctor_home_view_body.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindcare_app/view/Doctors/widgets/doctor_messages_body.dart';
import 'package:mindcare_app/view/widgets/custom_tile.dart';

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
              appBar: AppBar(
                centerTitle: true,
                title: const Text.rich(
                  TextSpan(
                      text: "Mind",
                      style: TextStyle(
                        fontSize: 30,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Care",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ]),
                ),
              ),
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
              drawer: Drawer(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 230,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Text(
                            '${'Hello'.tr} Doctor',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tile(
                      name: "Profile".tr,
                      icon: Icons.person,
                      tap: () {},
                    ),
                    Tile(
                      name: "Admin",
                      icon: Icons.admin_panel_settings,
                      tap: () {
                        List members = [
                          FirebaseAuth.instance.currentUser!.uid,
                          'fhQxkjWDs5QyZk2CqjTnk8XNZyv1',
                        ];

                        Get.toNamed(
                          ChattingAdminView.id,
                          arguments: [
                            members.toString(),
                            'fhQxkjWDs5QyZk2CqjTnk8XNZyv1',
                            "admin",
                            "Admin",
                            "Doctor"
                          ],
                        );
                      },
                    ),
                  ],
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
