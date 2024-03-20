import 'package:get/get.dart';

class TestController extends GetxController {
  int index = 0;
  int points = 0;
  int data = 0;
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
    data += point;
    update();
  }
}
