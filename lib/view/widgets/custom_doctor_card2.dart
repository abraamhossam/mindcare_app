// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Doctor_recommendation/doctor_profile2.dart';

class CustomDoctorCard extends StatelessWidget {
  CustomDoctorCard({
    super.key,
    required this.doctor,
    required this.tap,
  });

  final Map<String, dynamic> doctor;
  final Function tap;

  Color buttonColor = const Color(0xff2296F3);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.09),
        child: InkWell(
          onTap: () {
            Get.off(DoctorProfile(doctor: doctor));
          },
          child: Card(
            elevation: 3,
            child: Row(
              children: [
                ClipRRect(
                  child: Image(
                      height: size.width * 0.24,
                      width: size.width * 0.24,
                      image: MemoryImage(base64Decode(doctor['Picture']))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        doctor['Doctors_Names'],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 15),
                      child: Text(
                        doctor['Phone'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 101, 101, 101)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            doctor['Rating'].toString(),
                          ),
                          Icon(
                            Icons.star,
                            size: size.width * 0.04,
                            color: const Color.fromARGB(255, 231, 215, 66),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 15, top: 15, bottom: 15),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      tap();
                    },
                    color: buttonColor,
                    child: Text(
                      'Book'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
