// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/Doctors/views/medical_info.dart';

import '../../../controller/add_work.dart';
import '../widgets/add_new_task.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/dropdown_button_year.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';


class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView({super.key});
  static String id = "/work";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          titel: "Work Experience",
        ),
        body: GetBuilder<AddWork>(
          init: AddWork(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                const ContainerInfo(
                  indexpages: "4/5",
                  title: "Work Experience",
                  desc: "Add your past and current work info",
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " #${controller.index} WORK ",
                    style: TextStyle(
                      color: const Color(0xFF8196AC),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFiledData(labelText: "Institution"),
                SizedBox(
                  height: 2.h,
                ),
                TextFiledData(labelText: "Position"),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: DropdownButtonyear(
                        hint: "Select",
                        labelText: "Start Year",
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    const Expanded(
                      child: DropdownButtonyear(
                        hint: "Select",
                        labelText: "End Year",
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                AddNewTask(
                  onTap: () {
                    // controller.add();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const WorkExperienceView();
                    }));
                    controller.add();
                  },
                  text: "Add New Work",
                ),
                SizedBox(
                  height: 165.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButtonSaveData(
                        text: "Do it later ",
                        onPressed: () {},
                        decorationcolor: Colors.grey,
                        textcolor: Colors.black,
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
            ),
          ),
        ),
      ),
    );
  }
}
