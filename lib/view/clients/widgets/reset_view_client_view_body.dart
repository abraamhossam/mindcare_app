import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/clients/views/sign_in_client_view.dart';
import 'package:mindcare_app/view/initial/widgets/custom_text_field.dart';
import 'package:mindcare_app/view/initial/widgets/sign_image_body.dart';
import 'package:mindcare_app/view/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetClientViewBody extends StatefulWidget {
  const ResetClientViewBody({
    super.key,
  });

  @override
  State<ResetClientViewBody> createState() => _ResetClientViewBodyState();
}

class _ResetClientViewBodyState extends State<ResetClientViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();

  // String? email;

  bool isLoading = false;

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
                text: "reset title".tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.height! * 0.01,
                    ),
                    CustomTextField(
                      mycontroller: emailcontroller,
                      // onChanged: (data) {
                      //   email = data;
                      // },
                      title: "Email".tr,
                      hinttext: "Enter Your Email",
                      preIcon: Icons.email,
                    ),
                    SizedBox(
                      height: SizeConfig.height! * 0.02,
                    ),
                    CustomButton(
                      text: "reset button".tr,
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: emailcontroller.text.trim());
                            snackbar(context,
                                "Successfully sent reset password link to $emailcontroller");
                            //
                            Get.offAllNamed(SignInClientView.id);
                          } catch (e) {
                            snackbar(context, "Error ");
                          }
                          isLoading = false;
                          setState(() {});
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
      ),
    );
  }
}
