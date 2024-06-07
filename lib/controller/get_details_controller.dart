import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/model/doctor_data.dart';
import 'package:mindcare_app/model/user_model.dart';

class GetDetailscontroller extends GetxController {
  Rx<UserModel> dataModel = UserModel(
    name: "",
    email: "",
    id: '',
    image: "",
    type: "",
    token: "",
  ).obs;
  Rx<DoctorsData> model = DoctorsData(
    id: "",
    name: "",
    gender: "",
    birth: "",
    medicalTitle: "",
    phone: "",
    officeAddress: "",
    profile: "",
    universty: "",
    fieldOfStude: "",
    degree: "",
    startYearEdiction: "",
    endYearEdiction: "",
    institution: "",
    position: "",
    startYearWork: "",
    endYearWork: "",
    category: "",
    specialisty: "",
    expiryBoard: "",
    expiryCurrent: "",
    urlImage: "",
    email: "",
  ).obs;
  getDetails({required String type}) async {
    if (type == "User") {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        dataModel.value = UserModel.fromjson(value);
      });
      FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.getToken().then(
        (value) {
          if (value != null) {
            dataModel.value.token = value;
            FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({
              'token': value,
            });
          }
        },
      );
    } else if (type == "Doctor") {
      await FirebaseFirestore.instance
          .collection("doctors")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then(
            (value) => dataModel.value = UserModel.fromjson(
              value.data(),
            ),
          );

      await FirebaseFirestore.instance
          .collection("doctors_data")
          .doc("et8WpSuBakcFbtu5eriNtrWvaL02")
          .get()
          .then(
        (value) {
          model.value = DoctorsData.fromjson(
            value.data(),
          );
        },
      );
      FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.getToken().then(
        (value) {
          if (value != null) {
            dataModel.value.token = value;
            FirebaseFirestore.instance
                .collection("doctors")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .update({
              'token': value,
            });
          }
        },
      );
    }
  }

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
