import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomTestCard extends StatelessWidget {
  const CustomTestCard({
    super.key,
    required this.size,
    required this.name,
  });

  final Size size;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 5,
        right: 5,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 3,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text(
                  name.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                child: Lottie.asset(
                  'assets/animation/$name.json',
                  height: size.height * 0.15,
                  width: size.width * 0.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
