import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  CollectionReference result = FirebaseFirestore.instance.collection('Result');

  Future<void> addResult() async {
    return await result
        .add({
          'User_id': FirebaseAuth.instance.currentUser!.uid,
          'Result': ((points / index) * 100).toInt(),
          'time':
              (" ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"),
        })
        .then((value) => print("Result Added"))
        .catchError((error) => print("Failed to add  Result: $error"));
  }
}
