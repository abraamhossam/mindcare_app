import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';
import 'package:mindcare_app/controller/moods_controller.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/mood_recommedations_model.dart';
import 'package:mindcare_app/view/Recommendations/views/video_recommendations_view.dart';
import 'package:mindcare_app/view/Recommendations/widgets/mood_describe_iteam.dart';
import 'package:mindcare_app/view/Recommendations/widgets/mood_iteam.dart';

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
    "Sadness is an emotional state associated with feelings of sorrow, disappointment, and grief. It is often a response to loss, failure, or other negative experiences.",
    "Fear is an emotional response to perceived danger or threat. It is characterized by anxiety, apprehension, and a desire to escape or avoid the source of danger.",
    "Guilt is a complex emotional experience that occurs when a person believes or realizes they have compromised their own standards of conduct or violated a moral standard, leading to feelings of remorse and regret.",
    "Anger is a strong emotional response to perceived provocation, hurt, or threat. It can manifest as frustration, irritation, or rage, and is often accompanied by physiological arousal.",
    "Overthinking is the process of continuously analyzing or dwelling on a particular thought or situation to the point where it becomes counterproductive and often causes anxiety or stress. It involves excessive rumination on potential outcomes, past actions.",
  ];
  final GetDetailscontroller dataController = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
              text: "Mind",
              style: TextStyle(
                fontSize: 30,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Care",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ]),
        ),
      ),
      body: GetBuilder<MoodsController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.height! * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Text(
                  "Hi, ${dataController.dataModel.value.name}",
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
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.height! * 0.02,
              ),
              SizedBox(
                height: SizeConfig.height! * 0.16,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    if (controller.pos == index) {
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
                    fontSize: 24,
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
                          text: listDescription[controller.pos],
                        );
                      }),
                ),
              ),
              SizedBox(
                height: SizeConfig.height! * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                        SizeConfig.width! * 0.9, SizeConfig.height! * 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    Get.toNamed(
                      VideoRecommendationsView.id,
                      arguments: controller.pos,
                    );
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
        },
      ),
    );
  }
}
