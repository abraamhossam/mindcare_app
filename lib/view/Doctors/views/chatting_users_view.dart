import 'dart:io';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindcare_app/Zego%20Cloud/constants.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/firebase/fire_storage.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/message_model.dart';
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/chat_bubble.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// ignore: must_be_immutable
class ChattingUsersView extends StatelessWidget {
  ChattingUsersView({
    super.key,
  });
  static String id = "/chattingview";

  TextEditingController? textcontroller = TextEditingController();
  TextEditingController? textcontroller2 = TextEditingController();

  final _scrollController = ScrollController();
  final RoomModel model = Get.arguments;

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
          title: model.members![0] == FirebaseAuth.instance.currentUser!.uid
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
          actions: [
            model.members![0] == FirebaseAuth.instance.currentUser!.uid
                ? ZegoSendCallInvitationButton(
                    iconSize: const Size.fromRadius(20),
                    isVideoCall: false,
                    resourceID:
                        resourceID, //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
                    invitees: [
                      ZegoUIKitUser(
                        id: model.members![1],
                        name: model.to!,
                      ),
                    ],
                  )
                : ZegoSendCallInvitationButton(
                    iconSize: const Size.fromRadius(20),
                    isVideoCall: false,
                    resourceID:
                        resourceID, //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
                    invitees: [
                      ZegoUIKitUser(
                        id: model.members![0],
                        name: model.from!,
                      ),
                    ],
                  ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.phoneAlt,
                color: Colors.white,
                size: 20,
              ),
            ),
            model.members![1] == FirebaseAuth.instance.currentUser!.uid
                ? IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentTextStyle: const TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            backgroundColor: const Color(0xff607D8B),
                            content: SizedBox(
                              height: SizeConfig.height! * 0.2,
                              child: Column(
                                children: [
                                  const Text(
                                    "make a report on this user",
                                  ),
                                  SizedBox(
                                    height: SizeConfig.height! * 0.02,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      maxLines: 2,
                                      minLines: 1,
                                      controller: textcontroller2,
                                      cursorColor: Colors.white,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                ),
                                child: const Text(
                                  "Block",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (textcontroller2!.text.isNotEmpty) {
                                    if (model.report!.isNotEmpty) {
                                      snackbar(context,
                                          "You have already made a report about this user");
                                      Get.back();
                                    }
                                    if (model.report!.isEmpty) {
                                      FirebaseFirestore.instance
                                          .collection("rooms")
                                          .doc(model.id.toString())
                                          .update({
                                        'report':
                                            textcontroller2!.text.toString(),
                                        'block': 'yes',
                                      });
                                      Get.back();
                                    }
                                  }
                                  textcontroller2!.clear();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                ),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.ellipsisV,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                : const Text(""),
          ],
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
                                            if (model.members![0] ==
                                                FirebaseAuth.instance
                                                    .currentUser!.uid) {
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
                                            if (model.members![0] ==
                                                FirebaseAuth.instance
                                                    .currentUser!.uid) {
                                              FireStorage().sendImage(
                                                file: File(image.path),
                                                roomId: model.members!,
                                                recieverId: model.members![1]
                                                    .toString(),
                                              );
                                              FireAuthRooms.sendNotification(
                                                recieveId: model.members![1],
                                                msg: "Image",
                                                collectionName: "doctors",
                                              );
                                            } else {
                                              FireStorage().sendImage(
                                                file: File(image.path),
                                                roomId: model.members!,
                                                recieverId: model.members![0]
                                                    .toString(),
                                              );
                                              FireAuthRooms.sendNotification(
                                                recieveId: model.members![0],
                                                msg: "Image",
                                                collectionName: "users",
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
                                  if (model.block == 'no') {
                                    if (model.members![0] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                      FireAuthRooms.sendMessage(
                                        recieverid: model.members![1],
                                        message: textcontroller!.text,
                                        roomId: model.members!,
                                      );
                                      FireAuthRooms.sendNotification(
                                        recieveId: model.members![1],
                                        msg: textcontroller!.text,
                                        collectionName: "doctors",
                                      );
                                    } else if (model.members![1] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                      FireAuthRooms.sendMessage(
                                        recieverid: model.members![0],
                                        message: textcontroller!.text,
                                        roomId: model.members!,
                                      );
                                      FireAuthRooms.sendNotification(
                                        recieveId: model.members![0],
                                        msg: textcontroller!.text,
                                        collectionName: "users",
                                      );
                                    }
                                  } else {
                                    snackbar(context, "Can not send message");
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
