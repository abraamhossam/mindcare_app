import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/chat_card.dart';

class ClientMessagesBody extends StatelessWidget {
  const ClientMessagesBody({super.key});

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
            ..sort(
              (a, b) => b.lastMessageTime!.compareTo(
                a.lastMessageTime!,
              ),
            );

          return listIteams.isEmpty
              ? const Center(child: Text("No messages yet"))
              : ListView.builder(
                  itemCount: listIteams.length,
                  itemBuilder: (context, index) {
                    return ChatCard(
                      model: listIteams[index],
                    );
                  },
                );
        } else if (snapchot.hasError) {
          return const Center(child: Text("OOps there is an error"));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
