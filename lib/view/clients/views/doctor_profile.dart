import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_users_view.dart';
import 'package:mindcare_app/view/clients/views/client_home_view.dart';
import 'package:mindcare_app/view/clients/views/make_appointment.dart';

// ignore: must_be_immutable
class DoctorProfile extends StatelessWidget {
  DoctorProfile({
    super.key,
    this.doctor,
  });
  static String id = "/doctor_profile";

  QueryDocumentSnapshot? doctor;
  final BottomNavigationBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Doctor Pofile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              doctor!['urlImage'],
                            ),
                          )),
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: SizeConfig.width! * 0.1,
                      height: SizeConfig.width! * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "D.${doctor!['name']}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          doctor!['phone'],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              "ِAbout Doctor".tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              "${doctor!['profile']} \n\nField of Study : ${doctor!['fieldOfStude']} \nUniversity : ${doctor!['universty']}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 101, 101, 101),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              "Speciality".tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              doctor!['specialisty'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 101, 101, 101),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              "Address".tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              doctor!['officeAddress'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 101, 101, 101),
              ),
            ),
          ),
          /* Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              "Price".tr,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              doctor!['Price'].toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 101, 101, 101),
              ),
            ),
          ), */
          SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(SizeConfig.width! * 0.8, SizeConfig.height! * 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {
                Get.to(
                  MakeAppointment(
                    doctorData: doctor,
                  ),
                );
              },
              child: const Text(
                "Book Session",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize:
                    Size(SizeConfig.width! * 0.8, SizeConfig.height! * 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () async {
                QuerySnapshot reciever = await FirebaseFirestore.instance
                    .collection('doctors')
                    .where('name', isEqualTo: doctor!['name'].toString())
                    .get();
                String recieverId = reciever.docs.first.id;

                List members = [
                  FirebaseAuth.instance.currentUser!.uid,
                  recieverId,
                ];

                DocumentSnapshot<Map<String, dynamic>> collection =
                    await FirebaseFirestore.instance
                        .collection("rooms")
                        .doc(members.toString())
                        .get();

                if (collection.exists == false) {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentTextStyle: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        backgroundColor: const Color(0xff607D8B),
                        content: const Text(
                          "Are you sure to create chat with therapist ?",
                        ),
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                            ),
                            child: const Text(
                              "Ok",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              FireAuthRooms.creatRoom(
                                recieverName: doctor!['name'].toString(),
                                recieverId: reciever.docs.first.id,
                              );
                              controller.indexUser.value = 3;
                              Get.offNamed(ClientHomeView.id);
                              FireAuthRooms.sendMessage(
                                recieverid: reciever.docs.first.id,
                                message: "hello doctor",
                                roomId: members,
                              );
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                            ),
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
                    },
                  );
                } else {
                  Get.toNamed(
                    ChattingUsersView.id,
                    arguments: RoomModel.fromjson(collection.data()),
                  );
                }
              },
              child: const Text(
                "Create Chat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
