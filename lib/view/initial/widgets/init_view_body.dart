import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/initial/views/drop_down_view.dart';
import 'package:mindcare_app/view/initial/widgets/custom_button_scroll.dart';
import 'package:mindcare_app/view/initial/widgets/custom_dots_indicator.dart';
import 'package:mindcare_app/view/initial/widgets/custom_page_view.dart';

class InitViewBody extends StatefulWidget {
  const InitViewBody({super.key});

  @override
  State<InitViewBody> createState() => _InitViewBodyState();
}

class _InitViewBodyState extends State<InitViewBody> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(
        () {
          setState(() {});
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
          bottom: SizeConfig.height! * 0.2,
          left: 0,
          right: 0,
          child: CustomDotsIndicator(
            dotsIndex:
                pageController.hasClients ? pageController.page!.toInt() : 0,
          ),
        ),
        Positioned(
          bottom: SizeConfig.height! * 0.05,
          left: SizeConfig.width! * 0.2,
          right: SizeConfig.width! * 0.2,
          child: CustomButtonScroll(
            onpressed: () {
              if (pageController.page == 0) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              } else if (pageController.page == 1) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              } else if (pageController.page == 2) {
                Get.offAll(
                  () => const DropDownView(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 100),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
