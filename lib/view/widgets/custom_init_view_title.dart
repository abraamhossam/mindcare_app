import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';

import 'pay_view.dart';

class CustomInitViewTitle extends StatelessWidget {
  const CustomInitViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(
          flex: 2,
        ),
        const Text(
          "Mind",
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Care",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: MaterialButton(
            onPressed: () {
              // to pay page
              Get.toNamed(PayView.id);
            },
            minWidth: 10,
            color: Colors.white,
            child: const Text("ع"),
          ),
        ),
      ],
    );
  }
}
