import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';

class BubbleDateDoctor extends StatelessWidget {
  const BubbleDateDoctor({
    super.key,
    required this.hour,
    required this.day,
    required this.month,
  });
  final String hour, day, month;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          right: 32,
          top: 8,
          bottom: 8,
          left: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hour,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.width! * 0.01,
                ),
                Text(
                  day,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
