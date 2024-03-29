import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestResultCustom extends StatelessWidget {
  const TestResultCustom({
    super.key,
    required this.points,
    required this.totalPoints,
  });
  final int points, totalPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularPercentIndicator(
            animation: true,
            radius: 120,
            lineWidth: 20,
            percent: (points / totalPoints),
            progressColor: kPrimaryColor,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text(
              "${((points / totalPoints) * 100).toInt()}%",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.06,
        ),
        Text(
          "${points + 1} Points",
          style: const TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
