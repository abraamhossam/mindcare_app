import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/reset_view.dart';
import 'package:mindcare_app/view/sign_up_view.dart';

import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/widgets/custom_text_navigator.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({
    super.key,
  });

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
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
              text: "Welcome Back".tr,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
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
                    height: SizeConfig.height! * 0.01,
                  ),
                  CustomTextNavigator(
                    text: "Forgot Password?".tr,
                    ontap: () {
                      Get.toNamed(
                        ResetView.id,
                      );
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.02,
                  ),
                  CustomButton(
                    text: "Log In".tr,
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        Get.offNamed("/home");
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
                        "Don't have an account? ".tr,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      CustomTextNavigator(
                        text: "signIn bottom2".tr,
                        ontap: () => Get.toNamed(SignUpView.id),
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
