import 'package:flutter/material.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/mood_recommedations_model.dart';

class MoodIteam extends StatelessWidget {
  const MoodIteam({
    super.key,
    required this.model,
    required this.onTap,
    this.color,
    this.backGroundColor,
    this.borderColor,
  });
  final MoodRecommendationsModel model;
  final VoidCallback onTap;
  final Color? color, backGroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.height! * 0.16,
        width: SizeConfig.width! * 0.35,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        margin: const EdgeInsets.only(
          left: 16,
        ),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 2,
            color: borderColor ?? Colors.white,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              model.moodImage,
              height: 55,
              width: 55,
            ),
            SizedBox(
              height: SizeConfig.height! * 0.01,
            ),
            Text(
              model.moodName,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
