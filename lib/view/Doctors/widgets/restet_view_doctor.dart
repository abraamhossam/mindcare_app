import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'reset_view_body_doctor.dart';

class ResterViewDoctor extends StatelessWidget {
  const ResterViewDoctor({super.key});
  static String id = "/resetviewdoctor";
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
        body: const ResetViewBodyDoctor(),
      ),
    );
  }
}
