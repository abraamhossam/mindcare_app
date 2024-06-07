import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';
import 'package:mindcare_app/view/initial/widgets/title_text.dart';
import '../../widgets/image_profile.dart';

class ProfileUserView extends StatelessWidget {
  ProfileUserView({super.key});
  static String id = "/Profilepage";
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
                subtitle: controller.dataModel.value.name ?? "",
              ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.email,
                  size: 23,
                  color: Colors.blue,
                ),
                title: "Email",
                subtitle: controller.dataModel.value.email ?? "",
              ),
            ],
          )),
    );
  }
}
