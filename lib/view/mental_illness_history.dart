import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_controller/test_controller.dart';
import 'widgets/mental_illness_history_body.dart';

class MentalIllnessHistoryPage extends StatefulWidget {
  const MentalIllnessHistoryPage({super.key});
  static String id = "/mentalillnesshistorypage";

  @override
  State<MentalIllnessHistoryPage> createState() => _MentalIllnessHistoryPageState();
}

class _MentalIllnessHistoryPageState extends State<MentalIllnessHistoryPage> {
  final TestController controller = Get.find();

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
        ),
        body: const ListTileWidget(),
      ),
    );
  }
}
