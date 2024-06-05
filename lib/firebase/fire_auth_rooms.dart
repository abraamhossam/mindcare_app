import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/controller/get_details_controller.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class FireAuthRooms {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String myUid = FirebaseAuth.instance.currentUser!.uid;
  static final GetDetailscontroller controller = Get.find();
  static String myName = controller.dataModel.value.name!;
  static Future createUser({
    required String name,
    required String email,
  }) async {
    await firestore.collection('users').doc(myUid).set({
      'id': myUid,
      'name': name,
      'email': email,
      'type': 'User',
      'image': "",
      "token": "",
    });
  }

  static Future createDoctor(
      {required String name, required String email}) async {
    await firestore.collection('doctors').doc(myUid).set({
      'id': myUid,
      'name': name,
      'email': email,
      'type': 'Doctor',
      'image': "",
      "token": "",
    });
  }

  static Future creatRoom(
      {required String recieverName, required String recieverId}) async {
    QuerySnapshot user = await firestore
        .collection('users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List members = [myUid, recieverId];

    await firestore.collection('rooms').doc(members.toString()).set({
      'id': members.toString(),
      'created_at': DateTime.now().toString(),
      'members': members,
      'from': user.docs.first['name'],
      'to': recieverName,
      'type_from': 'User',
      'type_to': 'Doctor',
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
      'read': '',
      'report': '',
      'block': 'no',
    });
  }

  static Future sendMessage({
    required String recieverid,
    required String message,
    required List roomId,
    String? type,
  }) async {
    String msgId = Uuid().v1();
    await firestore
        .collection('rooms')
        .doc(roomId.toString())
        .collection('messages')
        .doc(msgId)
        .set({
      'id': msgId,
      'toid': recieverid,
      'fromid': myUid,
      'created_at': DateTime.now().toString(),
      'message': message,
      'type': type ?? 'text',
      'read': '',
    });
    firestore.collection('rooms').doc(roomId.toString()).update({
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
    if (roomId[0] == myUid) {
      firestore.collection('rooms').doc(roomId.toString()).update({
        'read': "1",
      });
    } else if (roomId[1] == myUid) {
      firestore.collection('rooms').doc(roomId.toString()).update({
        'read': "2",
      });
    }
  }

  static Future creatRoomwithAdmin(
      {required String recieverId, required String collectionName}) async {
    QuerySnapshot user = await firestore
        .collection(collectionName)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List members = [myUid, recieverId];

    await firestore.collection('adminRooms').doc(members.toString()).set({
      'id': members.toString(),
      'created_at': DateTime.now().toString(),
      'members': members,
      'from': user.docs.first['name'],
      'to': 'admin',
      'type_from': user.docs.first['type'],
      'type_to': 'Admin',
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
      'read': '',
    });
  }

  static Future sendMessageAdmin({
    required String recieverid,
    required String message,
    required String roomId,
    String? type,
  }) async {
    String msgId = Uuid().v1();
    await firestore
        .collection('adminRooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set({
      'id': msgId,
      'toid': recieverid,
      'fromid': myUid,
      'created_at': DateTime.now().toString(),
      'message': message,
      'type': type ?? 'text',
      'read': "",
    });
    firestore.collection('adminRooms').doc(roomId).update({
      'last_message_time': DateTime.now().millisecondsSinceEpoch.toString(),
    });
    firestore.collection('adminRooms').doc(roomId).update({
      'read': "1",
    });
  }

  static Future readMessage({
    required String roomId,
    required String msgId,
  }) async {
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection("messages")
        .doc(msgId)
        .update({
      'read': DateTime.now().microsecondsSinceEpoch.toString(),
    });
  }

  static Future readMessageAdmin({
    required String roomId,
    required String msgId,
  }) async {
    await firestore
        .collection('adminRooms')
        .doc(roomId)
        .collection("messages")
        .doc(msgId)
        .update({
      'read': DateTime.now().microsecondsSinceEpoch.toString(),
    });
  }

  static Future sendNotification({
    required String recieveId,
    required String msg,
    required String type,
  }) async {
    if (type == 'User') {
      QuerySnapshot user =
          await firestore.collection("users").where(recieveId).get();
      final header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAA8FGV3Fg:APA91bFgPrBTGPYqD6cprx0A9SvxT1v530h86c7MMPT5TgbQf1E_7KzVXsMxpiDxFbpoiYuXyid0phkNPrEw8N6jSHsMHrAGvxi8bJ3SRwS3Xe97LK__BUd5bPExlIbnHjqcIRk15qfZ",
      };
      final body = {
        "to": user.docs.first['token'],
        "notification": {
          "title": myName,
          "body": msg,
        }
      };
      final request = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        body: jsonEncode(body),
        headers: header,
      );
      print("================================================0");
      print(request.statusCode);
    } else if (type == "Doctor") {
      QuerySnapshot user =
          await firestore.collection("doctors").where(recieveId).get();
      final header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAA8FGV3Fg:APA91bFgPrBTGPYqD6cprx0A9SvxT1v530h86c7MMPT5TgbQf1E_7KzVXsMxpiDxFbpoiYuXyid0phkNPrEw8N6jSHsMHrAGvxi8bJ3SRwS3Xe97LK__BUd5bPExlIbnHjqcIRk15qfZ",
      };
      final body = {
        "to": user.docs.first['token'],
        "notification": {
          "title": myName,
          "body": msg,
        }
      };
      final request = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        body: jsonEncode(body),
        headers: header,
      );
      print("================================================0");
      print(request.statusCode);
    } else {
      final header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAA8FGV3Fg:APA91bFgPrBTGPYqD6cprx0A9SvxT1v530h86c7MMPT5TgbQf1E_7KzVXsMxpiDxFbpoiYuXyid0phkNPrEw8N6jSHsMHrAGvxi8bJ3SRwS3Xe97LK__BUd5bPExlIbnHjqcIRk15qfZ",
      };
      final body = {
        "to":
            "en5RY1bbTHe3QCuYeVVjV2:APA91bHYiVj9xP16poMLnzUll2LCbSsVTIc2uWmvEC-MMpq7mcXsMDw6nNaEkSrU5fcaimHp05jmnOhck-L8LNo6vuGhLfcws5ErQRT8j4h7BxLJVrknHCU9yXHVi_PwfXT6l-bQm0Lu",
        "notification": {
          "title": myName,
          "body": msg,
        }
      };
      final request = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        body: jsonEncode(body),
        headers: header,
      );
      print(request.statusCode);
    }
  }

  static Future sendNotificationBooking({
    required String msg,
    required String type,
    required String recieverName,
  }) async {
    if (type == 'User') {
      QuerySnapshot user = await firestore
          .collection('users')
          .where('name', isEqualTo: recieverName)
          .get();
      final header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAA8FGV3Fg:APA91bFgPrBTGPYqD6cprx0A9SvxT1v530h86c7MMPT5TgbQf1E_7KzVXsMxpiDxFbpoiYuXyid0phkNPrEw8N6jSHsMHrAGvxi8bJ3SRwS3Xe97LK__BUd5bPExlIbnHjqcIRk15qfZ",
      };
      final body = {
        "to": user.docs.first['token'],
        "notification": {
          "title": myName,
          "body": msg,
        }
      };
      final request = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        body: jsonEncode(body),
        headers: header,
      );
      print("================================================0");
      print(request.statusCode);
    } else if (type == "Doctor") {
      QuerySnapshot user = await firestore
          .collection('doctors')
          .where('name', isEqualTo: recieverName)
          .get();
      final header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAA8FGV3Fg:APA91bFgPrBTGPYqD6cprx0A9SvxT1v530h86c7MMPT5TgbQf1E_7KzVXsMxpiDxFbpoiYuXyid0phkNPrEw8N6jSHsMHrAGvxi8bJ3SRwS3Xe97LK__BUd5bPExlIbnHjqcIRk15qfZ",
      };
      final body = {
        "to": user.docs.first['token'],
        "notification": {
          "title": myName,
          "body": msg,
        }
      };
      final request = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        body: jsonEncode(body),
        headers: header,
      );
      print("================================================0");
      print(request.statusCode);
    }
  }
}
