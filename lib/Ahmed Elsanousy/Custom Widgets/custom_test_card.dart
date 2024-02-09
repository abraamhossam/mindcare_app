import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Lottie.asset(
                  'lib/Ahmed Elsanousy/assests/animation/$name.json',
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
