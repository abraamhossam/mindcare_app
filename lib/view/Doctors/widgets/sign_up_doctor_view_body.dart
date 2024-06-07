import 'package:awesome_icons/awesome_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/doctor_input_data.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/views/basic_info.dart';
import 'package:mindcare_app/view/Doctors/views/sign_in_doctor_view.dart';
import 'package:mindcare_app/view/initial/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/initial/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/custom_text_navigator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpDoctorViewBody extends StatefulWidget {
  const SignUpDoctorViewBody({super.key});

  @override
  State<SignUpDoctorViewBody> createState() => _SignUpDoctorViewBodyState();
}

class _SignUpDoctorViewBodyState extends State<SignUpDoctorViewBody> {
  bool ispassword = true;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  DoctorInputData doctorController = Get.find();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      inAsyncCall: isloading,
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
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: emailcontroller.text.trim(),
                              password: passwordcontroller.text.trim(),
                            );

                            // ignore: use_build_context_synchronously
                            snackbar(context, 'Success');
                            FireAuthRooms.createDoctor(
                                name: namecontroller.text.trim(),
                                email: emailcontroller.text.trim());
                            doctorController.name = namecontroller.text.trim();
                            doctorController.email =
                                emailcontroller.text.trim();
                            //Get.toNamed(SignInDoctorView.id);
                            Get.toNamed(BasicInfo.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              // ignore: use_build_context_synchronously
                              snackbar(context, 'password is weak');
                            } else if (e.code == 'email-already-in-use') {
                              // ignore: use_build_context_synchronously
                              snackbar(context, 'The account already exists');
                            }
                          } catch (e) {
                            // ignore: use_build_context_synchronously
                            snackbar(context,
                                "There is an error in the data entered");
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
                            fontSize: 18,
                          ),
                        ),
                        CustomTextNavigator(
                          text: "  ${"Log In".tr}".tr,
                          ontap: () => Get.toNamed(SignInDoctorView.id),
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
