import 'package:awesome_icons/awesome_icons.dart';
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
import 'sign_in_view_doctors.dart';

class SignUpViewBodyDoctors extends StatefulWidget {
  const SignUpViewBodyDoctors({super.key});

  @override
  State<SignUpViewBodyDoctors> createState() => _SignUpViewBodyDoctorsState();
}

class _SignUpViewBodyDoctorsState extends State<SignUpViewBodyDoctors> {
  bool ispassword = true;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  // String? email;
  // String? password;
  // String? name;
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
                text: "Welcome To Your Private Area".tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CustomTextField(
                      mycontroller: namecontroller,
                      // onChanged: (data) {
                      //   name = data;
                      // },
                      title: "Name".tr,
                      hinttext: "Name hint".tr,
                      preIcon: FontAwesomeIcons.userTie,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextField(
                      mycontroller: emailcontroller,
                      // onChanged: (data) {
                      //   email = data;
                      // },
                      title: "Email".tr,
                      hinttext: "Email hint".tr,
                      preIcon: Icons.email,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextField(
                      mycontroller: passwordcontroller,
                      // onChanged: (data) {
                      //   password = data;
                      // },
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
                      height: SizeConfig.height! * 0.02,
                    ),
                    CustomButton(
                      text: "Sign Up".tr,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: emailcontroller.text.trim(),
                              password: passwordcontroller.text.trim(),
                            );

                            snackbar(context, 'Success');
                            Get.offAllNamed(SignInViewDoctors.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              snackbar(context, 'password is weak');
                            } else if (e.code == 'email-already-in-use') {
                              // snackbar('The account already exists');
                              snackbar(context, 'The account already exists');
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
                          "Already Have An Account?".tr,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        CustomTextNavigator(
                          text: "  ${"Log In".tr}".tr,
                          ontap: () => Get.toNamed(SignInViewDoctors.id),
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
