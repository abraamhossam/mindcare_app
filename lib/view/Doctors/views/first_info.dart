import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/widgets/appbar_widget.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/dropdown_button.dart';
import '../widgets/image_peofile.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';
import 'profile_info.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});
  static String id = "/basic";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          titel: "Basic Info",
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 2,
            ),
            ContainerInfo(
              indexpages: 1 / 5,
              title: "Basic Info",
              desc: "Introduce Yourself More ",
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            const SizedBox(
              height: 12,
            ),
            const ImageProfile(),
            const SizedBox(
              height: 1,
            ),
            TextFiledData(
              labelText: "Name",
            ),
            TextFiledData(
              labelText: "Surname",
            ),
            const SizedBox(
              height: 1,
            ),
            const DropdownButtonn(
              hint: "Select",
              labelText: "Gender",
            ),
            const SizedBox(
              height: 1,
            ),
            TextFiledData(
              labelText: "Data of Birth",
            ),
            const SizedBox(
              height: 1,
            ),
            TextFiledData(
              labelText: "Medical Titel",
            ),
            const SizedBox(
              height: 1,
            ),
            TextFiledData(
              labelText: "Office Address",
            ),
            const SizedBox(
              height: 1,
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
                      Get.toNamed(ProfileInfo.id);
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
    );
  }
}
