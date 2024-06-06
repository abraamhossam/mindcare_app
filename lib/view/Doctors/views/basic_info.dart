import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/view/Doctors/widgets/appbar_widget.dart';
import 'package:mindcare_app/view/Doctors/widgets/phone_text_field.dart';
import '../../../controller/doctor_controller/doctor_input_data.dart';
import '../widgets/container_info_save_data.dart';
import '../widgets/dropdown_button.dart';
import '../widgets/image_peofile.dart';
import '../widgets/text_button_data.dart';
import '../widgets/text_filed_data.dart';
import 'doctor_home_view.dart';
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
              child: GetBuilder<DoctorInputData>(
                init: DoctorInputData(),
                builder: (controller) {
                  return ListView(
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
                      const ImageProfileDoctor(),
                      const SizedBox(
                        height: 1,
                      ),
                      TextFiledData(
                        onChanged: (data) {
                          controller.name = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return "field is required";
                          }
                        },
                        labelText: "Name",
                      ),
                      TextFiledData(
                        onChanged: (data) {
                          controller.surname = data;
                        },
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
                        onChanged: (data) {
                          controller.birth = data;
                        },
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
                      TextFiledData(
                        onChanged: (data) {
                          controller.medicalTitle = data;
                        },
                        labelText: "Medical Specialty",
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Material(
                        child: PhoneTextField(
                          onChanged: (data) {
                            controller.phone = data;
                          },
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
                        onChanged: (data) {
                          controller.officeAddress = data;
                        },
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
                                /*  if (controller.imageFile == null) {
                                  return snackbar(
                                      context, 'Please Pick Up an Image');
                                } */
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
                  );
                },
              ))),
    );
  }
}
