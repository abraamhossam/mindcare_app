import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/bottom_navigator_bar_controller.dart';

import 'package:mindcare_app/view/Doctors/widgets/enquiry_details_body.dart';

class EnquiryDetailsView extends StatelessWidget {
  EnquiryDetailsView({super.key});
  static String id = "/enquirydetailsview";
  final BottomNavigationBarController controller = Get.put(
    BottomNavigationBarController(),
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                controller.indexDoctor.value = 0;
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: kPrimaryColor,
              ),
            ),
            centerTitle: true,
            title: const Text(
              "Enquiry Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            bottom: const TabBar(
              indicatorWeight: 4,
              indicatorColor: kPrimaryColor,
              labelPadding: EdgeInsets.zero,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  child: Text(
                    "Overall",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Reports",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Files",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              EnquiryDetailsBody(),
              Center(
                child: Text("ebraam"),
              ),
              Center(
                child: Text("ebraam"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
