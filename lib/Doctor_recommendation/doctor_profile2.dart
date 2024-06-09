import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/widgets/custom_back_icon.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, this.doctor});
  static String id = "/doctor_profile";

  final Map<String, dynamic>? doctor;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    doctor!["Doctors_Names"],
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.height! * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: kPrimaryColor,
              )),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.width! * 0.3,
                    height: SizeConfig.width! * 0.3,
                    child: Image.memory(
                      base64Decode(
                        doctor!["Picture"],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.width! * 0.04,
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${doctor!["Doctors_Names"]}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${doctor!["Phone"]}",
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${doctor!["Rating"]}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepOrangeAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, right: 20, bottom: 20),
            //   child: EasyDateTimeLine(
            //     activeColor: kPrimaryColor,
            //     initialDate: DateTime.now(),
            //     onDateChange: (selectedDate) {
            //       print(selectedDate);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
