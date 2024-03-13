import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
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
                    title: "Name".tr,
                    hinttext: "Name hint".tr,
                    preIcon: FontAwesomeIcons.userTie,
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.01,
                  ),
                  CustomTextField(
                    title: "Email".tr,
                    hinttext: "Email hint".tr,
                    preIcon: Icons.email,
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.01,
                  ),
                  CustomTextField(
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
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        print("ebraam");
                      } else {
                        print("hossam");
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
    );
  }
}
