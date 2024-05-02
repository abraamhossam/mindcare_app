import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';
import 'package:mindcare_app/model/booking_model.dart';
import 'package:mindcare_app/model/message_model.dart';
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_admin_view.dart';
import 'package:mindcare_app/view/clients/widgets/client_appointments_view_body.dart';
import 'package:mindcare_app/view/clients/widgets/client_home_view_body.dart';
import 'package:mindcare_app/view/clients/widgets/client_messages_body.dart';
import 'package:mindcare_app/view/clients/widgets/client_test_body.dart';
import 'package:mindcare_app/view/doctor_search.dart';
import 'package:mindcare_app/view/initial/views/drop_down_view.dart';
import 'package:mindcare_app/view/mental_illness_history.dart';
import 'package:mindcare_app/view/profile_page.dart';
import 'package:mindcare_app/view/tests/views/test_home_view.dart';
import 'package:mindcare_app/view/widgets/custom_tile.dart';

class ClientHomeView extends StatefulWidget {
  const ClientHomeView({super.key});
  static String id = "/ClientHomeView";

  @override
  State<ClientHomeView> createState() => _ClientHomeViewState();
}

class _ClientHomeViewState extends State<ClientHomeView> {
  final List pages = [
    ClientHomeViewBody(),
    ClientTestBody(),
    ClientAppointmentsBody(),
    ClientMessagesBody(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void initState() {
    GetDetailscontroller().getDetails(type: 'User');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationBarController>(
      init: BottomNavigationBarController(),
      builder: (controller) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () async {
                _openDrawer();
                QuerySnapshot<Map<String, dynamic>> collections =
                    await FirebaseFirestore.instance
                        .collection("adminRooms")
                        .where(
                          'members',
                          arrayContains: FirebaseAuth.instance.currentUser!.uid,
                        )
                        .get();

                collections.docs.forEach((element) {
                  FirebaseFirestore.instance
                      .collection('adminRooms')
                      .doc(element.id)
                      .update({
                    'read': "",
                  });
                });
              },
              icon: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("adminRooms")
                    .where(
                      'members',
                      arrayContains: FirebaseAuth.instance.currentUser!.uid,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  final unReadList = snapshot.data?.docs
                      .map((e) => RoomModel.fromjson(e.data()))
                      .where((element) => element.read == "1");

                  return (unReadList == null)
                      ? const Icon(
                          Icons.menu,
                          size: 26,
                        )
                      : unReadList.isEmpty
                          ? const Icon(
                              Icons.menu,
                              size: 26,
                            )
                          : const Badge(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              label: Text(
                                "",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              child: Icon(
                                Icons.menu,
                                size: 26,
                              ),
                            );
                },
              ),
            ),
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
                  icon: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("bookings")
                        .where(
                          'members',
                          arrayContains: FirebaseAuth.instance.currentUser!.uid,
                        )
                        .snapshots(),
                    builder: (context, snapshot) {
                      final unReadList = snapshot.data?.docs
                          .map((e) => BookingModel.fromjson(e.data()))
                          .where((element) => element.doctorReply == "1");

                      return (unReadList == null)
                          ? const Icon(
                              Iconsax.calendar,
                              size: 26,
                            )
                          : unReadList.isEmpty
                              ? const Icon(
                                  Iconsax.calendar,
                                  size: 26,
                                )
                              : const Badge(
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  label: Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Icon(
                                    Iconsax.calendar,
                                    size: 26,
                                  ),
                                );
                    },
                  ),
                ),
                CustomNavigationBarItem(
                  icon: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("rooms")
                        .where(
                          'members',
                          arrayContains: FirebaseAuth.instance.currentUser!.uid,
                        )
                        .snapshots(),
                    builder: (context, snapshot) {
                      final unReadList = snapshot.data?.docs
                          .map((e) => RoomModel.fromjson(e.data()))
                          .where((element) => element.read == "2");

                      return (unReadList == null)
                          ? const Icon(
                              Iconsax.message_text,
                              size: 26,
                            )
                          : unReadList.isEmpty
                              ? const Icon(
                                  Iconsax.message_text,
                                  size: 26,
                                )
                              : Badge(
                                  backgroundColor: Colors.green,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  label: Text(
                                    unReadList.length.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: const Icon(
                                    Iconsax.message_text,
                                    size: 26,
                                  ),
                                );
                    },
                  ),
                ),
              ],
              onTap: (i) async {
                controller.indexUser.value = i;
                if (controller.indexUser.value == 2) {
                  QuerySnapshot<Map<String, dynamic>> collections =
                      await FirebaseFirestore.instance
                          .collection("bookings")
                          .where(
                            'members',
                            arrayContains:
                                FirebaseAuth.instance.currentUser!.uid,
                          )
                          .get();
                  collections.docs.forEach(
                    (element) {
                      FirebaseFirestore.instance
                          .collection('bookings')
                          .doc(element.id)
                          .update({
                        'doctor_reply': "2",
                      });
                    },
                  );
                }
                if (controller.indexUser.value == 3) {
                  QuerySnapshot<Map<String, dynamic>> collections =
                      await FirebaseFirestore.instance
                          .collection("rooms")
                          .where(
                            'members',
                            arrayContains:
                                FirebaseAuth.instance.currentUser!.uid,
                          )
                          .get();

                  collections.docs.forEach((element) {
                    FirebaseFirestore.instance
                        .collection('rooms')
                        .doc(element.id)
                        .update({
                      'read': "",
                    });
                  });
                }
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
                    Get.toNamed(DoctorSearch.id);
                  },
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
                        'admin',
                        "Admin",
                        "User",
                      ],
                    );
                  },
                  trailing: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("adminRooms")
                        .doc([
                          FirebaseAuth.instance.currentUser!.uid,
                          'fhQxkjWDs5QyZk2CqjTnk8XNZyv1',
                        ].toString())
                        .collection("messages")
                        .snapshots(),
                    builder: ((context, snapshot) {
                      final unReadList = snapshot.data?.docs
                          .map((e) => MessageModel.fromjson(e.data()))
                          .where((element) => element.read == "")
                          .where((element) =>
                              element.fromId !=
                              FirebaseAuth.instance.currentUser!.uid);

                      return (unReadList == null)
                          ? const Text("")
                          : unReadList.isEmpty
                              ? const Text("")
                              : Badge(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  label: Text(
                                    unReadList.length.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  largeSize: 30,
                                );
                    }),
                  ),
                ),
                Tile(
                  name: "Talk with Ai Chatbot".tr,
                  icon: Icons.chat,
                ),
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
