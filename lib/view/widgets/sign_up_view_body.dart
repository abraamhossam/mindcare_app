import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/sign_in_view.dart';

import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/widgets/custom_text_navigator.dart';

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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignImageBody(
              text: "signUp title".tr,
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
                    text: "signUp button".tr,
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
                        "signUp bottom1".tr,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      CustomTextNavigator(
                        text: "signUp bottom2".tr,
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
    );
  }
}
