import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/widgets/appbar_widget.dart';

import '../../../controller/doctor_controller/doctor_input_data.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/dropdown_button_year.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';
import 'doctor_home_view.dart';
import 'work_experience.dart';

class EdicationDataView extends StatelessWidget {
  EdicationDataView({super.key});
  static String id = "/edication";
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppBarWidget(
        titel: "Education",
      ),
      body: GetBuilder<DoctorInputData>(builder: (controller) {
        return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  ContainerInfo(
                    indexpages: 3 / 5,
                    title: "Education",
                    desc: "Add your education info",
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " #1 UNIVERSITY ",
                      style: TextStyle(
                        color: const Color.fromRGBO(129, 150, 172, 1),
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFiledData(
                    onChanged: (data) {
                      controller.universty = data;
                    },
                    labelText: "University",
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
                      controller.fieldOfStude = data;
                    },
                    labelText: "Field of study",
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
                      controller.degree = data;
                    },
                    labelText: "Degree",
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
                    height: 4.h,
                    // height: MediaQuery.of(context).size.height / 199,
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
                            if (formKey.currentState!.validate()) {
                              Get.toNamed(WorkExperienceView.id);
                            }
                          },
                          decorationcolor: Colors.blue,
                          textcolor: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
      }),
    ));
  }
}
