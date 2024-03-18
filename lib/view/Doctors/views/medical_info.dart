import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/views/doctor_home_view.dart';
import 'package:mindcare_app/view/Doctors/widgets/text_button_data.dart';
import '../widgets/container_info_save_data.dart';

class MedicalInfo extends StatelessWidget {
  const MedicalInfo({super.key});
  static String id = "/medical";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            ),
          ),
          title: const Center(
            child: Text(
              "Medical Info",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 3,
              ),
              ContainerInfo(
                indexpages: 5 / 5,
                title: "Medical Info",
                desc: "Enter Medical Information",
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Credentials",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButtonSaveData(
                      text: "Do it later ",
                      onPressed: () {},
                      decorationcolor: Colors.white,
                      textcolor: kPrimaryColor,
                    ),
                  ),
                  Expanded(
                    child: TextButtonSaveData(
                      text: "Go next ",
                      onPressed: () {
                        Get.toNamed(DoctorHomeView.id);
                      },
                      decorationcolor: Colors.blue,
                      textcolor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
