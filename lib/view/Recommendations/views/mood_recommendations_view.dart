import 'package:flutter/material.dart';
import 'package:mindcare_app/view/Recommendations/widgets/mood_recommendations_view_body.dart';

class MoodRecommendationsView extends StatelessWidget {
  const MoodRecommendationsView({super.key});
  static String id = "/MoodRecommendationsView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MoodRecommendationsViewBody(),
      ),
    );
  }
}
