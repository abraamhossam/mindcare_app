import 'package:flutter/material.dart';
import 'package:mindcare_app/utils/size_config.dart';

class BubbleDate extends StatelessWidget {
  const BubbleDate({
    super.key,
    required this.color1,
    required this.color2,
  });
  final Color color1, color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height! * 0.08,
      decoration: BoxDecoration(
        color: color1,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "8:30 AM",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              "Dec 5",
              style: TextStyle(
                color: color2,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
