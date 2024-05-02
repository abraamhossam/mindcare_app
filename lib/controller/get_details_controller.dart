import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/model/user_model.dart';

class GetDetailscontroller extends GetxController {
  String myId = FirebaseAuth.instance.currentUser!.uid;
  UserModel? dataModel;
  getDetails({required String type}) async {
    if (type == "User") {
      await FirebaseFirestore.instance.collection("users").doc(myId).get().then(
            (value) => dataModel = UserModel.fromjson(
              value.data(),
            ),
          );

      FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.getToken().then(
        (value) {
          if (value != null) {
            dataModel!.token = value;
            FirebaseFirestore.instance.collection("users").doc(myId).update({
              'token': value,
            });
          }
        },
      );

      update();
    } else if (type == "Doctor") {
      await FirebaseFirestore.instance
          .collection("doctors")
          .doc(myId)
          .get()
          .then(
            (value) => dataModel = UserModel.fromjson(
              value.data(),
            ),
          );
      FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.getToken().then(
        (value) {
          if (value != null) {
            dataModel!.token = value;
            FirebaseFirestore.instance.collection("doctors").doc(myId).update({
              'token': value,
            });
          }
        },
      );

      update();
    }
  }
}
