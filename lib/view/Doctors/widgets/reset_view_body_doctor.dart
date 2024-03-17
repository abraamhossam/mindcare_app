// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/utils/shoe_toast-message.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/Doctors/views/sign_in_view_doctors.dart';
import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/widgets/sign_image_body.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetViewBodyDoctor extends StatefulWidget {
  const ResetViewBodyDoctor({super.key});

  @override
  State<ResetViewBodyDoctor> createState() => _ResetViewBodyDoctorState();
}

class _ResetViewBodyDoctorState extends State<ResetViewBodyDoctor> {
  final GlobalKey<FormState> formKey = GlobalKey();

  // String? email;

  TextEditingController emailcontroller = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignImageBody(
                text: "reset title".tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextField(
                      mycontroller: emailcontroller,
                      // onChanged: (data) {
                      //   email = data;
                      // },
                      title: "Email".tr,
                      hinttext: "Enter Your Email",
                      preIcon: Icons.email,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.02,
                    ),
                    CustomButton(
                      text: "reset button".tr,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: emailcontroller.text.trim());

                            // snackbar(
                            //     "Successfully sent reset password link to $email");
                            snackbar(context,
                                "Successfully sent reset password link to $emailcontroller");
                            //
                            Get.offAllNamed(SignInViewDoctors.id);
                          } catch (e) {
                            // snackbar("Error ");
                            snackbar(context, "Error ");
                          }
                          isLoading = false;
                          setState(() {});
                        } else {
                          print("hossam");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
