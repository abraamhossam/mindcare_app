import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../widgets/container_info_save_data.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});
static String id = "/verificatio";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              const ContainerInfo(
                indexpages: "",
                title: "Verification in  progress...",
                desc: "You will get information when it will be done ",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Image.asset(
                // KConstants.imagenotification,
                // KConstants.imagesocial,
                KConstants.imagesocialn,
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 28,
              ),
              Text(
                "Empty Queue",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 52,
              ),
              Text(
                "Your list of scheduled visits is empty ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
