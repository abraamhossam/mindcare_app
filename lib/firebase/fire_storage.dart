import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';

class FireStorage {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;
  String myUid = FirebaseAuth.instance.currentUser!.uid;
  sendImage(
      {required File file,
      required List roomId,
      required String recieverId}) async {
    String ext = file.path.split(".").last;
    final ref = fireStorage
        .ref()
        .child("images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext");
    await ref.putFile(file);
    String imageUrl = await ref.getDownloadURL();
    FireAuthRooms.sendMessage(
        recieverid: recieverId,
        message: imageUrl,
        roomId: roomId,
        type: 'image');
    if (roomId[0] == myUid) {
      FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId.toString())
          .update({
        'read': "1",
      });
    } else if (roomId[1] == myUid) {
      FirebaseFirestore.instance
          .collection('rooms')
          .doc(roomId.toString())
          .update({
        'read': "2",
      });
    }
  }

  sendImageAdmin(
      {required File file,
      required String roomId,
      required String recieverId}) async {
    String ext = file.path.split(".").last;
    final ref = fireStorage
        .ref()
        .child("images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext");
    await ref.putFile(file);
    String imageUrl = await ref.getDownloadURL();
    FireAuthRooms.sendMessageAdmin(
        recieverid: recieverId,
        message: imageUrl,
        roomId: roomId,
        type: 'image');
    FirebaseFirestore.instance.collection('adminRooms').doc(roomId).update({
      'read': "1",
    });
  }
}
