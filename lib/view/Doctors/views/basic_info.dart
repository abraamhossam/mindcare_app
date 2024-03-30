import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/widgets/appbar_widget.dart';
import 'package:mindcare_app/view/Doctors/widgets/phone_text_field.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/dropdown_button.dart';
import '../widgets/image_peofile.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';
import 'profile_info.dart';

class BasicInfo extends StatelessWidget {
  BasicInfo({super.key});
  static String id = "/basic";
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          titel: "Basic Info",
        ),
        body: Form(
          key: formKey,
          child: ListView(
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
                validator: (data) {
                  if (data!.isEmpty) {
                    return "field is required";
                  }
                },
                labelText: "Name",
              ),
              TextFiledData(
                validator: (data) {
                  if (data!.isEmpty) {
                    return "field is required";
                  }
                },
                labelText: "Surname",
              ),
              const SizedBox(
                height: 6,
              ),
              const DropdownButtonn(
                hint: "Select",
              ),
              const SizedBox(
                height: 1,
              ),
              TextFiledData(
                validator: (data) {
                  if (data!.isEmpty) {
                    return "field is required";
                  }
                },
                labelText: "Data of Birth",
                inputType: TextInputType.datetime,
              ),
              const SizedBox(
                height: 1,
              ),
              const TextFiledData(
                labelText: "Medical Specialty",
              ),
              const SizedBox(
                height: 1,
              ),
              Material(
                child: PhoneTextField(
                  maxLength: 11,
                  controller: mobile,
                  validator: (data) {
                    if (mobile.text.length != 11) {
                      return "Please Enter valid mobile number";
                    }
                  },
                  labelText: "Phone number",
                  inputType: TextInputType.phone,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              TextFiledData(
                validator: (data) {
                  if (data!.isEmpty) {
                    return "field is required";
                  }
                },
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
                        if (formKey.currentState!.validate()) {
                          Get.toNamed(ProfileInfo.id);
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
        ),
      ),
    );
  }
}
