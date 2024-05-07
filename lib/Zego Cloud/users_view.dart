import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mindcare_app/Zego%20Cloud/constants.dart';

import 'package:mindcare_app/Zego%20Cloud/videoCall_controller.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class UsersPage extends StatefulWidget {
  static String id = '/users_page';

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final VideoCallController controller = Get.put(VideoCallController());

  List<QueryDocumentSnapshot> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () async {
                users = await controller.getUserData();
                setState(() {});

                print(users);
              },
              color: Colors.blue,
              child: const Text("getData"),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (itemBuilder, index) {
            final QueryDocumentSnapshot<Object?> user = users[index];
            if (user['name'] !=
                FirebaseAuth.instance.currentUser!.displayName) {
              return ListTile(
                  title: Text('${user["name"]}'),
                  subtitle: Text('${user['email']}'),
                  trailing: ZegoSendCallInvitationButton(
                    iconSize: const Size.fromRadius(20),
                    isVideoCall: true,
                    resourceID:
                        resourceID, //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
                    invitees: [
                      ZegoUIKitUser(
                        id: user["id"],
                        name: user["name"],
                      ),
                    ],
                  ));
            }
          }),
    );
  }
}
