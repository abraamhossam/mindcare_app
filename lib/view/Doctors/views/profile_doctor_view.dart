import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';
import 'package:mindcare_app/view/Doctors/widgets/image_profile_doc.dart';
import 'package:mindcare_app/view/initial/widgets/title_text.dart';

class ProfileDoctorView extends StatelessWidget {
  ProfileDoctorView({super.key});
  static String id = "/ProfilDoctorepage";
  final GetDetailscontroller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              const ImageProfile(),
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
                subtitle: controller.model.value.name ?? "",
              ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.email,
                  size: 23,
                  color: Colors.blue,
                ),
                title: "Email",
                subtitle: controller.model.value.email ?? "",
              ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.phone,
                  size: 23,
                  color: Colors.blue,
                ),
                title: "Phone",
                subtitle: controller.model.value.phone ?? "",
              ),
            ],
          )),
    );
  }
}
