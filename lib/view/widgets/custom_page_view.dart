import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/widgets/custom_page_view_iteam.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomPageViewIteam(
          image: "assets/images/1 (2).json",
          text: "initial page1 text".tr,
          subText: "initial page1 subText".tr,
        ),
        CustomPageViewIteam(
          image: "assets/images/1 (3).json",
          text: "initial page2 text".tr,
          subText: "initial page2 subText".tr,
        ),
        CustomPageViewIteam(
          image: "assets/images/cartoon.json",
          text: "initial page3 text".tr,
          subText: "",
        ),
      ],
    );
  }
}
