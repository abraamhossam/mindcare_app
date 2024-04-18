import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/clients/widgets/reset_view_client_view_body.dart';

class ResetClientView extends StatelessWidget {
  const ResetClientView({super.key});
  static String id = "/resetviewclientview";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: const ResetClientViewBody(),
      ),
    );
  }
}
