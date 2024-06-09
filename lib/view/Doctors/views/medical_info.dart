import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/views/doctor_home_view.dart';
import 'package:mindcare_app/view/Doctors/views/sign_in_doctor_view.dart';
import 'package:mindcare_app/view/Doctors/widgets/text_button_data.dart';
import '../../../controller/doctor_controller/doctor_input_data.dart';
import '../../../model/doctor_data.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/text_filed_data.dart';

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
            child: GetBuilder<DoctorInputData>(
              init: DoctorInputData(),
              builder: (controller) {
                return ListView(
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
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Credentials",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.category = data;
                      },
                      labelText: "Category",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.specialisty = data;
                      },
                      labelText: "Specialisty",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Documents",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "#1 BOARD CERTIFICATION",
                        style: TextStyle(
                            color: const Color(0xFF8196AC),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.expiryBoard = data;
                      },
                      labelText: "Expiry data",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "#1 CURRENT STATE LICENSE NUMBER ",
                        style: TextStyle(
                            color: const Color(0xFF8196AC),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.expiryCurrent = data;
                      },
                      labelText: "Expiry data",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButtonSaveData(
                            text: "Do it later ",
                            onPressed: () {
                              Get.offAllNamed(DoctorHomeView.id);
                            },
                            decorationcolor: Colors.white,
                            textcolor: kPrimaryColor,
                          ),
                        ),
                        Expanded(
                          child: TextButtonSaveData(
                            text: "Go next",
                            onPressed: () {
                              controller.creatdoctordata(
                                DoctorsData(
                                  type: "doctor",
                                  id: FirebaseAuth.instance.currentUser!.uid,
                                  email: controller.email,
                                  name: controller.name,
                                  gender:
                                      controller.selectitemsgender.toString(),
                                  birth: controller.birth,
                                  medicalTitle: controller.medicalTitle,
                                  phone: controller.phone,
                                  officeAddress: controller.officeAddress,
                                  profile: controller.profile,
                                  universty: controller.universty,
                                  fieldOfStude: controller.fieldOfStude,
                                  degree: controller.degree,
                                  startYearEdiction: controller.selectitemyear,
                                  endYearEdiction: controller.selectitemyear,
                                  institution: controller.institution,
                                  position: controller.position,
                                  startYearWork: controller.selectitemyear,
                                  endYearWork: controller.selectitemyear,
                                  category: controller.category,
                                  specialisty: controller.specialisty,
                                  expiryBoard: controller.expiryBoard,
                                  expiryCurrent: controller.expiryCurrent,
                                  urlImage: controller.imageUrl == null
                                      ? "https://st3.depositphotos.com/1767687/17621/v/450/depositphotos_176214104-stock-illustration-default-avatar-profile-icon.jpg"
                                      : controller.imageUrl!,
                                ),
                              );
                              Get.offAllNamed(SignInDoctorView.id);
                            },
                            decorationcolor: Colors.blue,
                            textcolor: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
