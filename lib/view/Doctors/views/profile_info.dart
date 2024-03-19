import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';
import 'edication_data.dart';


class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});
  static String id = "/profile";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(titel: "Profile"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 3.h,
              ),
              const ContainerInfo(
                indexpages: "2/5",
                title: "Profile",
                desc: 'Write About Yourself',
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  "Try to write about yourself in a few The more you write,the bigger chance you have to be chosen by patients Remember to say natural,reliable,and self-confident",
                  style: TextStyle(
                    color: const Color(0xFF8B9DB2),
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFiledData(
                labelText: "Profile Description",
              ),
              SizedBox(
                height: 275.h,
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
                        Get.toNamed(EdicationDataView.id);
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
