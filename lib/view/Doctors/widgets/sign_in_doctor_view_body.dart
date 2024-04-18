// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/views/doctor_home_view.dart';
import 'package:mindcare_app/view/Doctors/views/reset_doctor_view.dart';
import 'package:mindcare_app/view/Doctors/views/sign_up_doctor_view.dart';
import 'package:mindcare_app/view/initial/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/initial/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/custom_text_navigator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInDoctorViewBody extends StatefulWidget {
  const SignInDoctorViewBody({super.key});

  @override
  State<SignInDoctorViewBody> createState() => _SignInDoctorViewBodyState();
}

class _SignInDoctorViewBodyState extends State<SignInDoctorViewBody> {
  bool ispassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignImageBody(
                text: "Welcome Back".tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CustomTextField(
                      mycontroller: emailcontroller,
                      title: "Email".tr,
                      hinttext: "Email hint".tr,
                      preIcon: Icons.email,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextField(
                      mycontroller: passwordcontroller,
                      title: "Password".tr,
                      hinttext: "Password hint".tr,
                      preIcon: Icons.lock,
                      ispassword: ispassword,
                      ontapSufIcon: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                      sufIcon:
                          ispassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextNavigator(
                      text: "Forgot Password?".tr,
                      ontap: () {
                        Get.toNamed(
                          ResetDoctorView.id,
                        );
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.02,
                    ),
                    CustomButton(
                      text: "Log In".tr,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          QuerySnapshot reciever =
                              await FirebaseFirestore.instance
                                  .collection('doctors')
                                  .where(
                                    'email',
                                    isEqualTo: emailcontroller.text.trim(),
                                  )
                                  .get();

                          try {
                            if (reciever.docs.first['type'] == 'Doctor') {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailcontroller.text.trim(),
                                      password: passwordcontroller.text.trim());

                              snackbar(context, 'Success');
                              Get.offAllNamed(DoctorHomeView.id);
                            } else {
                              snackbar(context,
                                  'The email or Password is incorrect');
                            }
                          } catch (e) {
                            snackbar(
                                context, 'The email or Password is incorrect');
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ".tr,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        CustomTextNavigator(
                          text: "signIn bottom2".tr,
                          ontap: () => Get.toNamed(SignUpDoctorView.id),
                        ),
                      ],
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
