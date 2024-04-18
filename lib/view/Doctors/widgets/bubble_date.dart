import 'package:flutter/material.dart';
import 'package:mindcare_app/helper/size_config.dart';

class BubbleDate extends StatelessWidget {
  const BubbleDate({
    super.key,
    required this.color1,
    required this.color2,
    required this.hour,
    required this.month,
    required this.day,
  });
  final Color color1, color2;
  final String hour;
  final String month;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height! * 0.08,
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(32),
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
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(
                  color: color2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: SizeConfig.width! * 0.01,
              ),
              Text(
                day,
                style: TextStyle(
                  color: color2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
