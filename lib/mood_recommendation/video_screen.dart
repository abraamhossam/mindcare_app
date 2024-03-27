import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/mood_recommendation/mood_recommendation_videos/anger.dart';

import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 332,
          child: ListView.builder(
            itemCount: anger.length,
            itemBuilder: (context, index) {
              final controller = VideoController(url: anger[index]);
              return VideoPlayerScreen(controller: controller);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
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

  const VideoPlayerScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      init: controller,
      builder: (controller) {
        return controller.videoPlayerController.value.isInitialized
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: Colors.black,
                  height: 280,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: controller
                              .videoPlayerController.value.aspectRatio,
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
                              icon: controller
                                      .videoPlayerController.value.isPlaying
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
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
