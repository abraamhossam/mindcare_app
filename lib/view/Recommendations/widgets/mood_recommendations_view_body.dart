import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/recommendations_controller/moods_controller.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/mood_recommedations_model.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/anger.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/fear.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/guilt.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/overthinking.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/sadness.dart';
import 'package:mindcare_app/view/Recommendations/views/video_recommendations_view.dart';
import 'package:mindcare_app/view/Recommendations/widgets/mood_describe_iteam.dart';
import 'package:mindcare_app/view/Recommendations/widgets/mood_iteam.dart';
import 'package:mindcare_app/view/initial/widgets/app_title.dart';

// ignore: must_be_immutable
class MoodRecommendationsViewBody extends StatelessWidget {
  MoodRecommendationsViewBody({super.key});
  final List<MoodRecommendationsModel> listData = [
    MoodRecommendationsModel(
        moodImage: "assets/images/moods/sandness.png", moodName: "Sandness"),
    MoodRecommendationsModel(
        moodImage: "assets/images/moods/fear.png", moodName: "Fear"),
    MoodRecommendationsModel(
        moodImage: "assets/images/moods/guilt.png", moodName: "Guilt"),
    MoodRecommendationsModel(
        moodImage: "assets/images/moods/anger.png", moodName: "Anger"),
    MoodRecommendationsModel(
        moodImage: "assets/images/moods/overthinking.png",
        moodName: "Overthinking"),
  ];
  List<String> listDescription = [
    "Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little",
    "Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little",
    "Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little",
    "Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little",
    "Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little Today i'm happy,i'm a little nervous about exams,but i try to prepare a little",
  ];
  final MoodsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTitle(),
        SizedBox(
          height: SizeConfig.height! * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            "Hi, Chris",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            "How are you feeling today?",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: SizedBox(
            height: SizeConfig.height! * 0.16,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                if (controller.pos.value == index) {
                  return MoodIteam(
                    color: Colors.white,
                    backGroundColor: kPrimaryColor,
                    onTap: () {
                      controller.next(index: index);
                    },
                    model: listData[index],
                  );
                } else {
                  return MoodIteam(
                    backGroundColor: Colors.white,
                    color: kPrimaryColor,
                    borderColor: kPrimaryColor,
                    onTap: () {
                      controller.next(index: index);
                    },
                    model: listData[index],
                  );
                }
              },
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.04,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            "Describe your state of mind",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SizedBox(
            height: SizeConfig.height! * 0.36,
            width: SizeConfig.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return MoodDescribeIteam(
                    text: listDescription[controller.pos.value],
                  );
                }),
          ),
        ),
        SizedBox(
          height: SizeConfig.height! * 0.04,
        ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize:
                  Size(SizeConfig.width! * 0.9, SizeConfig.height! * 0.06),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () {
              if (controller.pos.value == 0) {
                Get.toNamed(
                  VideoRecommendationsView.id,
                  arguments: sadness,
                );
              }
              if (controller.pos.value == 1) {
                Get.toNamed(
                  VideoRecommendationsView.id,
                  arguments: fear,
                );
              }
              if (controller.pos.value == 2) {
                Get.toNamed(
                  VideoRecommendationsView.id,
                  arguments: guilt,
                );
              }
              if (controller.pos.value == 3) {
                Get.toNamed(
                  VideoRecommendationsView.id,
                  arguments: anger,
                );
              }
              if (controller.pos.value == 4) {
                Get.toNamed(
                  VideoRecommendationsView.id,
                  arguments: overthinking,
                );
              }
            },
            child: const Text(
              "Go to my Videos",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
