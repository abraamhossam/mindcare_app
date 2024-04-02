// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/views/medical_info.dart';
import '../../../controller/doctor_controller/doctor_input_data.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/dropdown_button_year.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';
import 'doctor_home_view.dart';

class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView({super.key});
  static String id = "/work";

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
              "Work Experience",
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
                    SizedBox(
                      height: 3.h,
                    ),
                    ContainerInfo(
                      indexpages: 4 / 5,
                      title: "Work Experience",
                      desc: "Add your past and current work info",
                      height: MediaQuery.of(context).size.height * 0.14,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        " #1 WORK ",
                        style: TextStyle(
                          color: const Color(0xFF8196AC),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFiledData(
                      onChanged: (data) {
                        controller.institution = data;
                      },
                      labelText: "Institution",
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
                        controller.position = data;
                      },
                      labelText: "Position",
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "field is required";
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Start year",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                DropdownButtonyear(
                                  hint: "Select",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "End year",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                DropdownButtonyear(
                                  hint: "Select",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
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
                            text: "Go next ",
                            onPressed: () {
                              Get.toNamed(MedicalInfo.id);
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
