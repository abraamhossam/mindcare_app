import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindcare_app/model/doctor_data.dart';

class DoctorInputData extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  String? id;
  String email = '';
  String name = '';
  String gender = '';
  String birth = '';
  String medicalTitle = '';
  String phone = '';
  String officeAddress = '';
  String profile = '';
  String universty = '';
  String fieldOfStude = '';
  String degree = '';
  dynamic startYearEdiction;
  dynamic endYearEdiction;
  String institution = '';
  String position = '';
  dynamic startYearWork;
  dynamic endYearWork;
  String category = '';
  String specialisty = '';
  String expiryBoard = '';
  String expiryCurrent = '';
  String? imageUrl;
  List<String> itemsgender = ["male", "female"];
  List<String> itemsyears = [
    for (dynamic i = 1950; i <= DateTime.now().year; i++) "$i"
  ];

  String? selectitemsgender;
  dynamic selectitemyear;

  void onChangedDropDown(value) {
    value = selectitemsgender;
    update();
  }

  void onChangedselectitemyear(value) {
    value = selectitemyear;
    update();
  }

  static DoctorInputData get instance => Get.find();
  final db = FirebaseFirestore.instance;
  creatdoctordata(DoctorsData doctor) async {
    await db
        .collection('doctors_data')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(doctor.toJson())
        // ignore: avoid_print
        .then((value) => print("Added doctor************"))
        .catchError(
            // ignore: avoid_print
            (error) => print("*********** Failed to add  Result: $error"));
  }

  File? imageFile;

  Future getImageDoctor() async {
    ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      imageFile = File(imageGallery.path);
      var ref = FirebaseStorage.instance
          .ref()
          .child('images')
          .child("${user!.uid}.jpg");
      await ref.putFile(imageFile!);
      imageUrl = await ref.getDownloadURL();

      update();
    }
  }
}
