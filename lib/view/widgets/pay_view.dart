import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/widgets/choose.dart';

class PayView extends StatelessWidget {
  const PayView({super.key});
static String id = "/PayView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              const ChooseMethodeToPayment(),
              backgroundColor: Colors.white,
            );
          },
          child: const Text("Pay 10 EGP"),
        ),
      ),
    );
  }
}
