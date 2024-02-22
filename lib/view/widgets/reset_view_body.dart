import 'package:flutter/material.dart';
import 'package:mindcare_app/utils/size_config.dart';

import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:mindcare_app/view/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_text_field.dart';

class ResetViewBody extends StatelessWidget {
  ResetViewBody({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignImageBody(
              text: "Reset Your Password",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.height! * 0.01,
                  ),
                  const CustomTextField(
                    title: "Email",
                    hinttext: "Enter Your Email",
                    preIcon: Icons.email,
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.02,
                  ),
                  CustomButton(
                    text: "Reset Password",
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        print("ebraam");
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
    );
  }
}
