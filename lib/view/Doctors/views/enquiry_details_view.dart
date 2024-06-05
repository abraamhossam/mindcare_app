import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/Doctors/widgets/enquiry_details_body.dart';
import 'package:mindcare_app/view/Doctors/widgets/reports_body.dart';

class EnquiryDetailsView extends StatelessWidget {
  const EnquiryDetailsView({super.key});
  static String id = "/enquirydetailsview";

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
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
          ],
        ),
        body: TabBarView(
          children: [
            EnquiryDetailsBody(),
            ReportsBody(),
          ],
        ),
      ),
    );
  }
}
