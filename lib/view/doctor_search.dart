// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mindcare_app/view/Doctors/list_of_doctors.dart';
import 'package:mindcare_app/view/make_appointment.dart';
import 'package:mindcare_app/view/widgets/custom_back_icon.dart';
import 'package:mindcare_app/view/widgets/custom_doctor_card.dart';

class doctorSearch extends StatelessWidget {
  doctorSearch({super.key});
  static String id = "/doctor_search";

  Color color = const Color(0xff2296F3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/home');
          },
          icon: Icon(
            back,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Our Doctors".tr,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 30),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: color,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Search'.tr,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return CustomDoctorCard(
                  doctor: doctors[index],
                  tap: () {
                    Get.to(MakeAppointment(
                      doctor: doctors[index],
                    ));
                  },

                  /* name: doctors[index]['name'],
                  phone: doctors[index]['phone'],
                  score: doctors[index]['score'],
                  img: doctors[index]['img'], */
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
