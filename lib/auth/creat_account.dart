// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// import '../utils/shoe_toast-message.dart';
// import '../view/sign_in_view.dart';

// FirebaseAuth _auth = FirebaseAuth.instance;

// FirebaseFirestore _firestore = FirebaseFirestore.instance;
// Future<User?> createAccount(String name, String email, String password) async {
//   try {
//     UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);

//     print("Account created Succesfull");

//     userCrendetial.user!.updateDisplayName(name);

//     await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
//       "name": name,
//       "email": email,
//       "status": "Unavalible",
//       "uid": _auth.currentUser!.uid,
//     });
//     Get.offAll(SignInView.id);

//     snackbar('Success');

//     return userCrendetial.user;
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       snackbar('password is weak');
//     } else if (e.code == 'email-already-in-use') {
//       snackbar('The account already exists');
//     }
//   } catch (e) {
//     snackbar('Error in connection');
//     print(e);
//   }
// }
