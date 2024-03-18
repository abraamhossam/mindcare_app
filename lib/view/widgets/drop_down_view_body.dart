import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/utils/size_config.dart';
import 'package:mindcare_app/view/Doctors/views/sign_in_view_doctors.dart';
import 'package:mindcare_app/view/sign_in_view.dart';

class DropDownViewBody extends StatefulWidget {
  const DropDownViewBody({super.key});

  @override
  State<DropDownViewBody> createState() => _DropDownViewBodyState();
}

class _DropDownViewBodyState extends State<DropDownViewBody> {
  String? selected;
  List<String> listData = ["tharepist", "client", "admin"];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.height! * 0.02,
            ),
            customDropDownButton(),
          ],
        ),
      ),
    );
  }

  Container customDropDownButton() {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 24,
        top: 6,
        bottom: 6,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(8),
        underline: const Divider(
          color: Colors.transparent,
        ),
        isExpanded: true,
        iconSize: 40,
        iconEnabledColor: Colors.white,
        dropdownColor: kPrimaryColor,
        hint: const Text(
          "Sign Up As",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        items: listData
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (data) {
          setState(() {
            selected = data!;
            if (selected.toString() == "tharepist") {
              Get.toNamed(SignInViewDoctors.id);
            } else if (selected.toString() == "client") {
              Get.toNamed(SignInView.id);
            }

            // Get.toNamed(SignInView.id);
          });
        },
        value: selected,
      ),
    );
  }
}
