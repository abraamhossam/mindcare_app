import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/model/message_model.dart';
import 'package:mindcare_app/model/room_model.dart';

class ChatBubbleSender extends StatefulWidget {
  const ChatBubbleSender({
    super.key,
    required this.messageIteam,
    required this.roomIteam,
  });

  final MessageModel messageIteam;
  final RoomModel roomIteam;

  @override
  State<ChatBubbleSender> createState() => _ChatBubbleSenderState();
}

class _ChatBubbleSenderState extends State<ChatBubbleSender> {
  @override
  void initState() {
    if (widget.messageIteam.toId == FirebaseAuth.instance.currentUser!.uid) {
      FireAuthRooms.readMessage(
        roomId: widget.roomIteam.members.toString(),
        msgId: widget.messageIteam.id,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.messageIteam.type == 'text'
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            child: BubbleSpecialOne(
              isSender: false,
              seen: widget.messageIteam.read == "" ? false : true,
              delivered: true,
              color: const Color(0xFFE8E8EE),
              text: widget.messageIteam.message,
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          )
        : BubbleNormalImage(
            isSender: false,
            seen: widget.messageIteam.read == "" ? false : true,
            id: widget.messageIteam.message,
            image: CachedNetworkImage(
              imageUrl: widget.messageIteam.message,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            ),
            color: const Color(0xFFE8E8EE),
            tail: true,
            delivered: true,
          );
  }
}

class ChatBubbleReciever extends StatefulWidget {
  const ChatBubbleReciever({
    super.key,
    required this.messageIteam,
    required this.roomIteam,
  });
  final MessageModel messageIteam;
  final RoomModel roomIteam;

  @override
  State<ChatBubbleReciever> createState() => _ChatBubbleRecieverState();
}

class _ChatBubbleRecieverState extends State<ChatBubbleReciever> {
  @override
  void initState() {
    if (widget.messageIteam.toId == FirebaseAuth.instance.currentUser!.uid) {
      FireAuthRooms.readMessage(
        roomId: widget.roomIteam.members.toString(),
        msgId: widget.messageIteam.id,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.messageIteam.type == 'text'
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            child: BubbleSpecialOne(
              isSender: true,
              color: kPrimaryColor,
              text: widget.messageIteam.message,
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
        : BubbleNormalImage(
            isSender: true,
            id: widget.messageIteam.message,
            image: CachedNetworkImage(
              imageUrl: widget.messageIteam.message,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            ),
            color: kPrimaryColor,
            tail: true,
          );
  }
}
