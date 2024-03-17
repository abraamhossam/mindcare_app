import 'package:get/get.dart';

class MentalIllnessTestController extends GetxController {
  int index = 0;
  int points = 0;
  void nextQuestion() {
    index++;
    update();
  }

  void back() {
    points = 0;
    index = 0;
    update();
  }

  void pointsScore({required int point}) {
    points += point;
    update();
  }
}
