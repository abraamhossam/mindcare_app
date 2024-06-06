import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/Doctors/widgets/image_profile_doc.dart';
import 'package:mindcare_app/view/clients/doctor%20profile/iamge_profile2.dart';
import 'package:mindcare_app/view/clients/doctor%20profile/make_appointment2.dart';
import 'package:mindcare_app/view/initial/widgets/title_text.dart';

class ProfileDoctor extends StatefulWidget {
  QueryDocumentSnapshot? doctor;
  ProfileDoctor({super.key, this.doctor});
  static String id = "/doctorData";

  @override
  State<ProfileDoctor> createState() => _ProfileDoctor();
}

class _ProfileDoctor extends State<ProfileDoctor> {
  //late DocumentSnapshot doctordata;

  @override
  void initState() {
    super.initState();
    //getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF42B9F5),
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              ImageProfile2(doctor: widget.doctor),
              const SizedBox(
                height: 30,
              ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.person_2_outlined,
                  size: 24,
                  color: Colors.blue,
                ),
                title: "Name",
                subtitle: widget.doctor!["name"],
              ),
              // SizedBox(
              //   height: 1,
              // ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.email,
                  size: 23,
                  color: Colors.blue,
                ),
                title: "Email",
                subtitle: widget.doctor!["email"],
              ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.phone,
                  size: 23,
                  color: Colors.blue,
                ),
                title: "Phone",
                subtitle: widget.doctor!["phone"],
              ),
              const SizedBox(
                height: 60,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: MaterialButton(
                  onPressed: () {
                    Get.to(MakeAppointment2(
                      doctor: widget.doctor,
                    ));
                  },
                  color: Colors.blue,
                  child: const Text("Book"),
                ),
              ),
            ],
          )),
    );
  }
}
