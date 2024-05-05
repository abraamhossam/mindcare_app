import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/view/Doctors/widgets/image_profile_doc.dart';
import 'package:mindcare_app/view/initial/widgets/title_text.dart';

class ProfilePagedoctor extends StatefulWidget {
  const ProfilePagedoctor({super.key});
  static String id = "/ProfilDoctorepage";

  @override
  State<ProfilePagedoctor> createState() => _ProfilePagedoctorState();
}

class _ProfilePagedoctorState extends State<ProfilePagedoctor> {
  final User? user = FirebaseAuth.instance.currentUser;
  String name = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    try {
      final DocumentSnapshot doctordata = await FirebaseFirestore.instance
          .collection("doctors")
          .doc(user!.uid)
          .get();
      if (doctordata == null) {
        return;
      } else {
        setState(() {
          email = doctordata.get("email");
          name = doctordata.get("name");
        });
        // print("**********done***");
      }
    } catch (e) {
      // print("Error in Getting Data $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF42B9F5),
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              const ImageProfile(),
              const SizedBox(
                height: 30,
              ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.person_2_outlined,
                  size: 24,
                  color: Colors.blue,
                ),
                title: "Name",
                subtitle: name,
              ),
              // SizedBox(
              //   height: 1,
              // ),
              ListTitleWdiget(
                leading: const Icon(
                  Icons.email,
                  size: 23,
                  color: Colors.blue,
                ),
                title: "Email",
                subtitle: " $email",
              ),
            ],
          )),
    );
  }
}
