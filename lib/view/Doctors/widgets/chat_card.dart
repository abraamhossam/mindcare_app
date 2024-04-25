import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/room_model.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.model,
    required this.type,
  });

  final RoomModel model;
  final String type;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        if (type == "User") {
          Get.toNamed(
            ChattingView.id,
            arguments: [
              model.members,
              model.members![1],
              model.to,
              model.toType,
            ],
          );
        } else if (type == "Doctor") {
          Get.toNamed(
            ChattingView.id,
            arguments: [
              model.members,
              model.members![0],
              model.from,
              model.fromType,
            ],
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: SizeConfig.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'assets/images/user_img.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.width! * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.members![0] ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? model.to!
                          : model.from!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      model.members![0] ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? model.toType!
                          : model.fromType!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
