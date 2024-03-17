// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class UserDataBase extends GetxController {
 
//   final User? user = FirebaseAuth.instance.currentUser;
//   String name = "";
//   String email = "";
//   // final uid = user!.uid;
//   void getdata() async {
    
//     try {
//       final DocumentSnapshot userdata =
//           await FirebaseFirestore.instance.collection("users").doc(user!.uid).get();
//       if (userdata == null) {
//         return;
//         print("***********error");
//       } else {
//         email = userdata.get("email");
//         name = userdata.get("full_name");
//         print("**********done***");
//       }
//     } catch (e) {
//       print("Error in Getting Data $e");
//     }
//     update();
//   }
  
  
// }
