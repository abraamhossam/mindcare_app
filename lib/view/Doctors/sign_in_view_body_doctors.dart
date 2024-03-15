import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../utils/shoe_toast-message.dart';
import '../../utils/size_config.dart';
import '../../view/widgets/custom_button.dart';
import '../../view/widgets/custom_text_field.dart';
import '../../view/widgets/custom_text_navigator.dart';
import '../../view/widgets/sign_image_body.dart';
import 'rester_view_doctor.dart';
import 'sign_up_view_doctor.dart';

class SignInViewBodyDoctors extends StatefulWidget {
  const SignInViewBodyDoctors({super.key});

  @override
  State<SignInViewBodyDoctors> createState() => _SignInViewBodyDoctorsState();
}

class _SignInViewBodyDoctorsState extends State<SignInViewBodyDoctors> {
  bool ispassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  String? emailAdrees;
  String? passwordd;
  bool isloading = false;
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
                text: "Welcome Back".tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CustomTextField(
                      onChanged: (data) {
                        emailAdrees = data;
                      },
                      title: "Email".tr,
                      hinttext: "Email hint".tr,
                      preIcon: Icons.email,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextField(
                      onChanged: (data) {
                        passwordd = data;
                      },
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
                          ResterViewDoctor.id,
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
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailAdrees!, password: passwordd!);
                            snackbar(context, 'Success');
                            Get.offNamed("/home");
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              snackbar(context, 'No user found for that email');
                            } else if (e.code == 'wrong-password') {
                              snackbar(context,
                                  'Wrong password provided for that user');
                            }
                          } catch (e) {
                            snackbar(context, 'Error in Connection');
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
                            fontSize: 17,
                          ),
                        ),
                        CustomTextNavigator(
                          text: "signIn bottom2".tr,
                          ontap: () => Get.toNamed(SignUpViewDoctors.id),
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
