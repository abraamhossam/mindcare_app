import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/home_page.dart';
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
            const SignImageBody(
              text: "Welcome Back",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const CustomTextField(
                    title: "Email",
                    hinttext: "Enter Your Email",
                    preIcon: Icons.email,
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.01,
                  ),
                  CustomTextField(
                    title: "Password",
                    hinttext: "Enter Your Password",
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
                    text: "Forgot Password ?",
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
                    text: "Login",
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
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      CustomTextNavigator(
                        text: "  Sign Up",
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
