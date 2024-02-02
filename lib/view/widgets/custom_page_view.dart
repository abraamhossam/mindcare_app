import 'package:flutter/material.dart';
import 'package:mindcare_app/view/widgets/custom_page_view_iteam.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        CustomPageViewIteam(
          image: "assets/images/1 (2).json",
          text: "We help you help yourselves",
          subText:
              "Our dangnosis tool suggests test techniques to deal with mental distness",
        ),
        CustomPageViewIteam(
          image: "assets/images/1 (3).json",
          text: "Find the right therapist for you",
          subText:
              "Discover the perfect therapist to guide your mental health journey with our tailored selection",
        ),
        CustomPageViewIteam(
          image: "assets/images/cartoon.json",
          text: "Let us lend a hand",
          subText: "",
        ),
      ],
    );
  }
}
