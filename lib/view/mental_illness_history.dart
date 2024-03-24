import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'widgets/mental_illness_history_body.dart';

class MentalIllnessHistoryPage extends StatelessWidget {
  const MentalIllnessHistoryPage({super.key});
  static String id = "/mentalillnesshistorypage";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Mental illness History',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.toNamed(HomePage.id);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: const ListTileWidget(),
      ),
    );
  }
}
