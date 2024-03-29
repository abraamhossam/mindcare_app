import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/initial/views/init_view.dart';
import 'package:mindcare_app/view/initial/widgets/animation_text.dart';
import 'package:mindcare_app/view/initial/widgets/splash_title.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animatationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  void initSlidingAnimation() {
    animatationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animatationController);
    animatationController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(InitView.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animatationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SplashTitle(),
        AnimationText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
