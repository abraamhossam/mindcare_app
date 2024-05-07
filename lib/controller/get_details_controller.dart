import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/model/user_model.dart';

class GetDetailscontroller extends GetxController {
  //String myId = FirebaseAuth.instance.currentUser!.uid;
  Rx<UserModel> dataModel =
      UserModel(name: "", email: "", id: "", image: "", type: "", token: "")
          .obs;

  /*  getDetails({required String type}) async {
    if (type == "User") {
      await FirebaseFirestore.instance.collection("users").doc(myId).get().then(
            (value) => dataModel.value = UserModel.fromjson(
              value.data(),
            ),
          );

      FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.getToken().then(
        (value) {
          if (value != null) {
            dataModel.value.token = value;
            FirebaseFirestore.instance.collection("users").doc(myId).update({
              'token': value,
            });
          }
        },
      );
    } else if (type == "Doctor") {
      await FirebaseFirestore.instance
          .collection("doctors")
          .doc(myId)
          .get()
          .then(
            (value) => dataModel.value = UserModel.fromjson(
              value.data(),
            ),
          );
      FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.getToken().then(
        (value) {
          if (value != null) {
            dataModel.value.token = value;
            FirebaseFirestore.instance.collection("doctors").doc(myId).update({
              'token': value,
            });
          }
        },
      );
    }
  } */

  checkChat({required String collectionName}) async {
    QuerySnapshot user = await FirebaseFirestore.instance
        .collection(collectionName)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    List members = [
      user.docs.first.id,
      'fhQxkjWDs5QyZk2CqjTnk8XNZyv1',
    ];
    DocumentSnapshot<Map<String, dynamic>> collection = await FirebaseFirestore
        .instance
        .collection("adminRooms")
        .doc(members.toString())
        .get();
    if (collection.exists == false) {
      FireAuthRooms.creatRoomwithAdmin(
        collectionName: collectionName,
        recieverId: 'fhQxkjWDs5QyZk2CqjTnk8XNZyv1',
      );
    }
  }
}
