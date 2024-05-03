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
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/chat_bubble.dart';

// ignore: must_be_immutable
class ChattingView extends StatelessWidget {
  ChattingView({
    super.key,
  });
  static String id = "/chattingview";

  TextEditingController? textcontroller = TextEditingController();

  final _scrollController = ScrollController();
  final RoomModel model = Get.arguments;
  String myUid = FirebaseAuth.instance.currentUser!.uid;

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
          title: model.members![0] == myUid
              ? Text(
                  "${model.toType}:  ${model.to}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  "${model.fromType}:  ${model.from}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("rooms")
              .doc(model.members.toString())
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
                                  roomIteam: model,
                                  messageIteam: MessageModel.fromjson(
                                    snapshot.data!.docs[index],
                                  ),
                                )
                              : ChatBubbleReciever(
                                  roomIteam: model,
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
                                onSubmitted: (data) async {
                                  if (textcontroller!.text.isNotEmpty) {
                                    if (model.members![0] == myUid) {
                                      FireAuthRooms.sendMessage(
                                        recieverid: model.members![1],
                                        message: textcontroller!.text,
                                        roomId: model.members!,
                                      );
                                    } else {
                                      FireAuthRooms.sendMessage(
                                        recieverid: model.members![0],
                                        message: textcontroller!.text,
                                        roomId: model.members!,
                                      );
                                    }
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
                                            if (model.members![0] == myUid) {
                                              FireStorage().sendImage(
                                                file: File(image.path),
                                                roomId: model.members!,
                                                recieverId: model.members![1]
                                                    .toString(),
                                              );
                                            } else {
                                              FireStorage().sendImage(
                                                file: File(image.path),
                                                roomId: model.members!,
                                                recieverId: model.members![0]
                                                    .toString(),
                                              );
                                            }
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
                                            if (model.members![0] == myUid) {
                                              FireStorage().sendImage(
                                                file: File(image.path),
                                                roomId: model.members!,
                                                recieverId: model.members![1]
                                                    .toString(),
                                              );
                                            } else {
                                              FireStorage().sendImage(
                                                file: File(image.path),
                                                roomId: model.members!,
                                                recieverId: model.members![0]
                                                    .toString(),
                                              );
                                            }
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
                              onPressed: () async {
                                if (textcontroller!.text.isNotEmpty) {
                                  if (model.members![0] == myUid) {
                                    FireAuthRooms.sendMessage(
                                      recieverid: model.members![1],
                                      message: textcontroller!.text,
                                      roomId: model.members!,
                                    );
                                  } else {
                                    FireAuthRooms.sendMessage(
                                      recieverid: model.members![0],
                                      message: textcontroller!.text,
                                      roomId: model.members!,
                                    );
                                  }
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
