import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/test_controller/test_controller.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_view.dart';
import 'package:mindcare_app/view/tests/views/aniexty_test_vew.dart';
import 'package:mindcare_app/view/tests/views/dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/post_traumatic_stress_test_view.dart';
import 'package:mindcare_app/view/widgets/custom_button%20copy.dart';
import 'package:mindcare_app/view/widgets/custom_card.dart';

class ClientHomeViewBody extends StatelessWidget {
  ClientHomeViewBody({super.key});
  final TestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.back();
    return ListView(
      children: [
        Row(
          children: [
            CustomCard(
              size: size,
              backColor: kPrimaryColor,
              imageName: const AssetImage("assets/images/meditation/7.png"),
              title: "Meditation Sessions".tr,
              subTitle: "Stay relaxed".tr,
              textColor: Colors.white,
            ),
            CustomCard(
              size: size,
              backColor: Colors.white,
              imageName: const AssetImage("assets/images/meditation/6.png"),
              title: "Meditation Sessions".tr,
              subTitle: "Stay relaxed".tr,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Common Tests".tr,
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xff737373),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Button(
                title: "chat",
                onPressed: () async {
                  QuerySnapshot reciever = await FirebaseFirestore.instance
                      .collection('doctors')
                      .where('name', isEqualTo: "doctor1")
                      .get();
                  String recieverId = reciever.docs.first.id;

                  List members = [
                    FirebaseAuth.instance.currentUser!.uid,
                    recieverId,
                  ];

                  Get.toNamed(ChattingView.id, arguments: [
                    members,
                    recieverId,
                    "doctor1",
                    "Doctor",
                  ]);
                },
              ),
              Button(
                title: "Depression",
                onPressed: () {
                  controller.back();
                  Get.toNamed(DepressionTestView.id);
                },
              ),
              Button(
                title: "Anxiety",
                onPressed: () {
                  controller.back();
                  Get.toNamed(AniextyTestView.id);
                },
              ),
              Button(
                title: "Stress",
                onPressed: () {
                  controller.back();
                  Get.toNamed(PostTraumaticStressTestView.id);
                },
              ),
              Button(
                title: "Dass",
                onPressed: () {
                  controller.back();
                  Get.toNamed(DASSTestView.id);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Our Doctors".tr,
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xff737373),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            CustomCard(
              size: size,
              backColor: kPrimaryColor,
              imageName: const NetworkImage(
                "https://cdn-dr-images.vezeeta.com/Assets/Images/SelfServiceDoctors/ENT82187a/Profile/150/doctor-ghada-khalil--dietitian-and-nutrition_20230418093508805.jpg",
              ),
              title: "Ghada Khalel",
              subTitle: "01062234831",
              textColor: Colors.white,
            ),
            CustomCard(
              size: size,
              backColor: kPrimaryColor,
              imageName: MemoryImage(base64Decode(
                  "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")),
              title: "Shereen El dardery",
              subTitle: "01005193763",
              textColor: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            CustomCard(
              size: size,
              backColor: kPrimaryColor,
              imageName: MemoryImage(
                base64Decode(
                  "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",
                ),
              ),
              title: "Mohamed Roshdy",
              subTitle: "01065750519",
              textColor: Colors.white,
            ),
            CustomCard(
              size: size,
              backColor: kPrimaryColor,
              imageName: MemoryImage(base64Decode(
                  "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")),
              title: "Remon Qanas",
              subTitle: "01284267723",
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
