import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/video_mood_contoller.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/text_button_data.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/anger.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/fear.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/guilt.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/overthinking.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/sadness.dart';

import 'package:video_player/video_player.dart';

class VideoRecommendationsView extends StatefulWidget {
  static String id = "/VideoRecommendationsView";

  VideoRecommendationsView({super.key});

  @override
  State<VideoRecommendationsView> createState() =>
      _VideoRecommendationsViewState();
}

class _VideoRecommendationsViewState extends State<VideoRecommendationsView> {
  final List listMood = [sadness, fear, guilt, anger, overthinking];

  final List listNumMood = [9, 6, 6, 7, 5];

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
        body: GetX<VideoMoodController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${controller.index.value}"),
              Center(
                child: SizedBox(
                  width: SizeConfig.width!,
                  height: SizeConfig.height! * 0.38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: anger.length,
                    itemBuilder: (context, index) {
                      final vidcontroller = VideoController(url: anger[index]);
                      return VideoPlayerScreen(controller: vidcontroller);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.height! * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButtonSaveData(
                      text: "Back",
                      onPressed: () {
                        if (controller.index.value == 0) {
                          snackbar(context, "The Frist Video");
                        } else {
                          controller.back();
                        }
                      },
                      decorationcolor: Colors.white,
                      textcolor: kPrimaryColor,
                    ),
                  ),
                  Expanded(
                    child: TextButtonSaveData(
                      text: "Next",
                      onPressed: () {
                        if (listNumMood[Get.arguments] - 1 ==
                            controller.index) {
                          controller.index.value = 0;
                        } else {
                          controller.next();
                          setState(() {});
                        }
                        print(controller.index.value);
                      },
                      decorationcolor: Colors.blue,
                      textcolor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          );
        }));
  }
}

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  final String url;

  VideoController({required this.url}) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    initialize();
  }

  Future<void> initialize() async {
    await videoPlayerController.initialize();
    update(); // Notify listeners
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final VideoController controller;

  const VideoPlayerScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<VideoController>(
      init: controller,
      builder: (controller) {
        return controller.videoPlayerController.value.isInitialized
            ? Container(
                color: kPrimaryColor,
                height: 280,
                width: SizeConfig.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.replay_10,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controller.videoPlayerController.seekTo(
                                Duration(
                                  seconds: controller.videoPlayerController
                                          .value.position.inSeconds -
                                      10,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon:
                                controller.videoPlayerController.value.isPlaying
                                    ? const Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                            onPressed: () {
                              controller.videoPlayerController.value.isPlaying
                                  ? controller.videoPlayerController.pause()
                                  : controller.videoPlayerController.play();
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.forward_10,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controller.videoPlayerController.seekTo(
                                Duration(
                                  seconds: controller.videoPlayerController
                                          .value.position.inSeconds +
                                      10,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: kPrimaryColor,
              ));
      },
    );
  }
}
