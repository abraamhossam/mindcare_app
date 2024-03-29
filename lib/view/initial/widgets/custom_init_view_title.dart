import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';
import 'package:mindcare_app/constants.dart';

class CustomInitViewTitle extends StatelessWidget {
  const CustomInitViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LanguageController language = Get.find();
    return AppBar(
      centerTitle: true,
      title: const Text.rich(
        TextSpan(
            text: "Mind",
            style: TextStyle(
              fontSize: 30,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Care",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ]),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: MaterialButton(
            onPressed: () {
              // to pay page
              language.changeLang();
            },
            minWidth: 10,
            color: Colors.white,
            child: Text(language.langeCode == "en" ? "ع" : "en"),
          ),
        ),
      ],
    );

    /* Row(
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
              language.changeLang();
            },
            minWidth: 10,
            color: Colors.white,
            child: const Text("ع"),
          ),
        ),
      ],
    ); */
  }
}
