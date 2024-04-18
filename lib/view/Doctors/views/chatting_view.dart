import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/firebase/fire_storage.dart';
import 'package:mindcare_app/model/message_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/chat_bubble.dart';

// ignore: must_be_immutable
class ChattingView extends StatelessWidget {
  ChattingView({super.key});
  static String id = "/chattingview";

  TextEditingController? textcontroller = TextEditingController();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 26,
              color: Colors.white,
            ),
          ),
          title: Text(
            "${Get.arguments[3]}:  ${Get.arguments[2]}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("rooms")
              .doc(Get.arguments[0].toString())
              .collection('messages')
              .orderBy(
                'created_at',
                descending: true,
              )
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return FirebaseAuth.instance.currentUser!.uid ==
                                  snapshot.data!.docs[index]['fromid']
                              ? ChatBubbleSender(
                                  type: 'users',
                                  roomId: Get.arguments[0].toString(),
                                  messageIteam: MessageModel.fromjson(
                                    snapshot.data!.docs[index],
                                  ),
                                )
                              : ChatBubbleReciever(
                                  type: 'users',
                                  roomId: Get.arguments[0].toString(),
                                  messageIteam: MessageModel.fromjson(
                                    snapshot.data!.docs[index],
                                  ),
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: TextField(
                                maxLines: 5,
                                minLines: 1,
                                controller: textcontroller,
                                onSubmitted: (data) {
                                  if (textcontroller!.text.isNotEmpty) {
                                    FireAuthRooms.sendMessage(
                                      recieverid: Get.arguments[1],
                                      message: textcontroller!.text,
                                      roomId: Get.arguments[0].toString(),
                                    );
                                  }
                                  textcontroller!.clear();
                                  _scrollController.animateTo(
                                    0,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  hintText: "Message",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          var imagePicker = ImagePicker();
                                          XFile? image =
                                              await imagePicker.pickImage(
                                            source: ImageSource.gallery,
                                          );
                                          if (image != null) {
                                            FireStorage().sendImage(
                                              file: File(image.path),
                                              roomId:
                                                  Get.arguments[0].toString(),
                                              recieverId: Get.arguments[1],
                                            );
                                          }
                                          _scrollController.animateTo(
                                            0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          );
                                        },
                                        icon: const Icon(
                                          Iconsax.emoji_happy,
                                          color: Colors.black,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          var imagePicker = ImagePicker();
                                          XFile? image =
                                              await imagePicker.pickImage(
                                            source: ImageSource.camera,
                                          );
                                          if (image != null) {
                                            FireStorage().sendImage(
                                              file: File(image.path),
                                              roomId:
                                                  Get.arguments[0].toString(),
                                              recieverId: Get.arguments[1],
                                            );
                                          }
                                          _scrollController.animateTo(
                                            0,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 500),
                                          );
                                        },
                                        icon: const Icon(
                                          Iconsax.camera,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kPrimaryColor,
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (textcontroller!.text.isNotEmpty) {
                                  FireAuthRooms.sendMessage(
                                    recieverid: Get.arguments[1],
                                    message: textcontroller!.text,
                                    roomId: Get.arguments[0].toString(),
                                  );
                                }
                                textcontroller!.clear();
                                _scrollController.animateTo(
                                  0,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              icon: const Icon(
                                Iconsax.send1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("OOps there is an error"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
