import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:easy_date_timeline/easy_date_timeline.dart';

import 'package:mindcare_app/view/widgets/custom_doctor_card2.dart';

import 'package:mindcare_app/Langauge/language_controller.dart';
import 'package:mindcare_app/view/widgets/custom_back_icon.dart';

// ignore: must_be_immutable
class doctorProfile extends StatelessWidget {
  doctorProfile({super.key, this.doctor});
  static String id = "/doctor_profile";

  Map<String, dynamic>? doctor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LanguageController language = Get.find();
    return Scaffold(
      body: Card(
        elevation: 10,
        color: const Color.fromARGB(255, 247, 245, 245),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      back,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: language.langeCode == "en"
                        ? size.width * 0.16
                        : size.width * 0.25,
                  ),
                  Text(
                    //doctor!['name'],
                    "Make Appointment".tr,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "About Therapist".tr,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                doctor!['Specialization'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Location".tr,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                doctor!['Location'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 101, 101, 101),
                ),
              ),
            ),
            Padding(
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, bottom: 20),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  print(selectedDate);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
