import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Custom%20Widgets/custom_test_card.dart';

class mentalTests extends StatelessWidget {
  const mentalTests({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/home');
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Mental Tests",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: [
        CustomTestCard(
          size: size,
          name: 'Depression',
        ),
        CustomTestCard(
          size: size,
          name: 'Stress',
        ),
        CustomTestCard(
          size: size,
          name: 'Anxiety',
        ),

        CustomTestCard(
          size: size,
          name: 'Anger',
        ),

        //Lottie.asset('assets/animation/Depression.json'),
      ]),
    );
  }
}