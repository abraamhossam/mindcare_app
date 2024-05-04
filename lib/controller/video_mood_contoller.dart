import 'package:get/get.dart';

class VideoMoodController extends GetxController {
  RxInt index = 0.obs;
  next() {
    index += 1;
  }

  back() {
    index -= 1;
  }
}
