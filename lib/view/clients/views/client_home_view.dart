import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/view/clients/widgets/client_home_view_body.dart';
import 'package:mindcare_app/view/clients/widgets/client_test_view_body.dart';
import 'package:mindcare_app/view/initial/views/drop_down_view.dart';
import 'package:mindcare_app/view/mental_illness_history.dart';
import 'package:mindcare_app/view/profile_page.dart';
import 'package:mindcare_app/view/tests/views/test_home_view.dart';
import 'package:mindcare_app/view/widgets/custom_tile.dart';

class ClientHomeView extends StatelessWidget {
  ClientHomeView({super.key});
  static String id = "/ClientHomeView";
  final List pages = [
    ClientHomeViewBody(),
    ClientTestViewBody(),
    Text("ebraam hossam"),
    Text("ebraam hossam"),
  ];
  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationBarController>(
      init: BottomNavigationBarController(),
      builder: (controller) {
        return Scaffold(
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
              currentIndex: controller.indexUser.value,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.home,
                    size: 26,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.task_square,
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
                controller.indexUser.value = i;
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
                      color: Color(0xff607D8B),
                    ),
                    child: Center(
                      child: Text(
                        '${'Hello'.tr} User',
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
                    tap: () {
                      Get.toNamed(ProfilePage.id);
                    }),
                Tile(
                  name: "History".tr,
                  icon: Icons.history,
                  tap: () {
                    Get.toNamed(MentalIllnessHistoryPage.id);
                  },
                ),
                Tile(
                  name: "Mental Tests".tr,
                  icon: Icons.forum_outlined,
                  tap: () {
                    Get.toNamed(TestHomeView.id);
                  },
                ),
                Tile(
                  name: "Search for doctors".tr,
                  icon: Icons.person_search,
                  tap: () {
                    Get.toNamed('/doctor_search');
                  },
                ),
                Tile(name: "Talk with Ai Chatbot".tr, icon: Icons.chat),
                Tile(
                  name: "Logout",
                  icon: Icons.logout,
                  tap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentTextStyle: const TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            backgroundColor: const Color(0xff607D8B),
                            content: const Text(
                              "Are you sure to logout ? ",
                            ),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                child: const Text(
                                  "Ok",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Get.offAllNamed(DropDownView.id);
                                },
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
          ),
          body: pages.elementAt(
            controller.indexUser.value,
          ),
        );
      },
    );
  }
}





// ignore: must_be_immutable

/* BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home")
      ]) */