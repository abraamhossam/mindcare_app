import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/clients/views/client_home_view.dart';

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
              Get.toNamed(ClientHomeView.id);
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
