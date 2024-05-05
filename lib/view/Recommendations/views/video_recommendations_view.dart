import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/anger.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/fear.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/guilt.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/overthinking.dart';
import 'package:mindcare_app/view/Recommendations/mood_recommendation_videos/sadness.dart';

import 'package:video_player/video_player.dart';

class VideoRecommendationsView extends StatefulWidget {
  static String id = "/VideoRecommendationsView";

  const VideoRecommendationsView({super.key});

  @override
  State<VideoRecommendationsView> createState() =>
      _VideoRecommendationsViewState();
}

class _VideoRecommendationsViewState extends State<VideoRecommendationsView> {
  static List moods = [sadness, fear, guilt, anger, overthinking];
  List<String> mood = moods[Get.arguments];
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
      body: ListView.builder(
        itemCount: mood.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: VideoListItem(videoUrl: mood[index])),
          );
        },
      ),
    );
  }
}

class VideoListItem extends StatefulWidget {
  final String videoUrl;

  const VideoListItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoListItemState createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                SizedBox(
                  height: SizeConfig.height! * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.replay_10,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _controller.seekTo(
                          Duration(
                            seconds: _controller.value.position.inSeconds - 10,
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: _controller.value.isPlaying
                          ? const Icon(
                              Icons.pause,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                      onPressed: () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.forward_10,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _controller.seekTo(
                          Duration(
                            seconds: _controller.value.position.inSeconds + 10,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          } else {
            return SizedBox(
              width: SizeConfig.width,
              height: 200,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }
        },
      ),
      onTap: () {
        if (_controller.value.isPlaying) {
          _controller.pause();
        } else {
          _controller.play();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// class VideoController extends GetxController {
//   late VideoPlayerController videoPlayerController;
//   final String url;

//   VideoController({required this.url}) {
//     videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
//     initialize();
//   }

//   Future<void> initialize() async {
//     await videoPlayerController.initialize();
//     update(); // Notify listeners
//   }

//   @override
//   void onClose() {
//     videoPlayerController.dispose();
//     super.onClose();
//   }
// }

// class VideoPlayerScreen extends StatelessWidget {
//   final VideoController controller;

//   const VideoPlayerScreen({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return GetBuilder<VideoController>(
//       init: controller,
//       builder: (controller) {
//         return controller.videoPlayerController.value.isInitialized
//             ? Container(
//                 color: kPrimaryColor,
//                 height: 280,
//                 width: SizeConfig.width,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       AspectRatio(
//                         aspectRatio:
//                             controller.videoPlayerController.value.aspectRatio,
//                         child: VideoPlayer(controller.videoPlayerController),
//                       ),
//                       const Spacer(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           IconButton(
//                             icon: const Icon(
//                               Icons.replay_10,
//                               color: Colors.white,
//                             ),
//                             onPressed: () {
//                               controller.videoPlayerController.seekTo(
//                                 Duration(
//                                   seconds: controller.videoPlayerController
//                                           .value.position.inSeconds -
//                                       10,
//                                 ),
//                               );
//                             },
//                           ),
//                           IconButton(
//                             icon:
//                                 controller.videoPlayerController.value.isPlaying
//                                     ? const Icon(
//                                         Icons.pause,
//                                         color: Colors.white,
//                                       )
//                                     : const Icon(
//                                         Icons.play_arrow,
//                                         color: Colors.white,
//                                       ),
//                             onPressed: () {
//                               controller.videoPlayerController.value.isPlaying
//                                   ? controller.videoPlayerController.pause()
//                                   : controller.videoPlayerController.play();
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(
//                               Icons.forward_10,
//                               color: Colors.white,
//                             ),
//                             onPressed: () {
//                               controller.videoPlayerController.seekTo(
//                                 Duration(
//                                   seconds: controller.videoPlayerController
//                                           .value.position.inSeconds +
//                                       10,
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             : SizedBox(
//                 width: SizeConfig.width,
//                 height: 280,
//                 child: const Center(
//                   child: CircularProgressIndicator(
//                     color: kPrimaryColor,
//                   ),
//                 ),
//               );
//       },
//     );
//   }
// }
