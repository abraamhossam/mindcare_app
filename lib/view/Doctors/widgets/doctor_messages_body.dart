import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_view.dart';
import 'package:mindcare_app/view/Doctors/widgets/chat_card.dart';

class DoctorMessagesBody extends StatelessWidget {
  const DoctorMessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("rooms")
          .where('members',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapchot) {
        if (snapchot.hasData) {
          List<RoomModel> listIteams = snapchot.data!.docs
              .map((e) => RoomModel.fromjson(e.data()))
              .toList()
            ..sort((a, b) => b.lastMessageTime!.compareTo(a.lastMessageTime!));

          return ListView.builder(
            itemCount: listIteams.length,
            itemBuilder: (context, index) {
              return ChatCard(
                ontap: () async {
                  List members = [
                    listIteams[index].members![0],
                    FirebaseAuth.instance.currentUser!.uid
                  ];

                  Get.toNamed(
                    ChattingView.id,
                    arguments: [
                      members,
                      listIteams[index].members![0],
                      listIteams[index].from!,
                      listIteams[index].fromType!,
                    ],
                  );
                },
                name: listIteams[index].from!,
                type: listIteams[index].fromType!,
              );
            },
          );
        } else if (snapchot.hasError) {
          return const Text("OOps there is an error");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
