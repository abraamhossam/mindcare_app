// ignore_for_file: use_build_context_synchronously

import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/utils/shoe_toast-message.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/initial/views/sign_in_view.dart';
import 'package:mindcare_app/view/initial/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/initial/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/custom_text_navigator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool ispassword = true;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

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
                      title: "Name".tr,
                      hinttext: "Name hint".tr,
                      preIcon: FontAwesomeIcons.userTie,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
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
                            CollectionReference users =
                                FirebaseFirestore.instance.collection('users');
                            String uid = credential.user!.uid;
                            await users
                                .doc(uid)
                                .set({
                                  'full_name': namecontroller.text,
                                  'email': emailcontroller.text,
                                  'Id': uid,
                                  "password": passwordcontroller.text,
                                  'pic': ""
                                })
                                .then((value) => print("User Added"))
                                .catchError((error) =>
                                    print("Failed to add user: $error"));

                            snackbar(context, 'Success');
                            Get.offAllNamed(SignInView.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              snackbar(context, 'password is weak');
                            } else if (e.code == 'email-already-in-use') {
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
                          ontap: () => Get.toNamed(SignInView.id),
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
