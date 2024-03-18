import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/doctor_controller/doctor_bottom_navigation_bar_controller.dart';
import 'package:mindcare_app/view/Doctors/widgets/enquiry_details_body.dart';

class EnquiryDetailsView extends StatelessWidget {
  EnquiryDetailsView({super.key});
  static String id = "/enquirydetailsview";
  final DoctorBottomNavigationBarController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                controller.navigate(0);
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
            actions: [
              IconButton(
                onPressed: () {
                  controller.navigate(0);
                },
                icon: const Icon(
                  Icons.more_horiz,
                  size: 36,
                  color: kPrimaryColor,
                ),
              ),
            ],
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
                  "Messages",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
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
                Tab(
                  child: Text(
                    "Activity",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              EnquiryDetailsBody(),
              Container(
                child: Center(
                  child: Text("ebraam"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("ebraam"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("ebraam"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("ebraam"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
