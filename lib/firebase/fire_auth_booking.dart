import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuthBooking {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String myUid = FirebaseAuth.instance.currentUser!.uid;
  static Future createBooking({
    String? day,
    String? hour,
    String? month,
    String? date,
    required String doctorName,
  }) async {
    QuerySnapshot doctor = await firestore
        .collection('doctors')
        .where('name', isEqualTo: doctorName)
        .get();
    QuerySnapshot user =
        await firestore.collection('users').where('id', isEqualTo: myUid).get();

    List members = [myUid, doctor.docs.first.id];
    await firestore.collection('bookings').doc(members.toString()).set({
      'created_at': DateTime.now().toString(),
      'id': members.toString(),
      'members': members,
      'user_name': user.docs.first['name'],
      'doctor_name': doctor.docs.first['name'],
      'month': month,
      'day': day,
      'hour': hour,
      'reply': 'waiting',
      'read': '',
      "doctor_reply": "0",
    });
  }

  static Future booking(
      {required String userName,
      required String reply,
      required String doctorReply}) async {
    QuerySnapshot user = await firestore
        .collection('users')
        .where('name', isEqualTo: userName)
        .get();
    List members = [user.docs.first.id, myUid];
    await firestore.collection('bookings').doc(members.toString()).update({
      'reply': reply,
    });
    await firestore.collection('bookings').doc(members.toString()).update({
      'doctor_reply': doctorReply,
    });
  }

  static Future checkbooking({required String doctorName}) async {
    QuerySnapshot doctor = await firestore
        .collection('doctors')
        .where('name', isEqualTo: doctorName)
        .get();
    List members = [myUid, doctor.docs.first.id];
    DocumentSnapshot<Map<String, dynamic>> document =
        await firestore.collection('bookings').doc(members.toString()).get();
    return document.data()?['reply'] == null ? "" : document.data()!['reply'];
  }

  static Future checkbookingTime({
    required String doctorName,
    required String day,
    required String month,
    required String hour,
  }) async {
    bool check = false;
    QuerySnapshot doctor = await firestore
        .collection('doctors')
        .where('name', isEqualTo: doctorName)
        .get();
    QuerySnapshot documents = await FirebaseFirestore.instance
        .collection("bookings")
        .where('members', arrayContains: doctor.docs.first.id)
        .get();

    for (int i = 0; i < documents.docs.length; i++) {
      if (documents.docs[i]['day'] == day &&
          documents.docs[i]['month'] == month &&
          documents.docs[i]['hour'] == hour) {
        check = true;
      }
    }

    return check;
  }
}
