// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';

import '../mental_illness_history.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  List dataresult = [];
  bool isloading = true;
  getDataFromFirebase() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Result")
        .where("User_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    dataresult.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: dataresult.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/yoga.png"),
                      radius: 25,
                    ),
                    title: Text(
                      "Result of Mental Illness Test ${dataresult[index]['Result']}% ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "data of test: ${dataresult[index]['time'].toString()}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentTextStyle: const TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                                backgroundColor: kPrimaryColor,
                                content: const Text(
                                  " Are you sure to Delete ? ",
                                ),
                                actions: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await FirebaseFirestore.instance
                                          .collection("Result")
                                          .doc(dataresult[index].id)
                                          .delete();

                                      Get.offAllNamed(
                                          MentalIllnessHistoryPage.id);
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                        size: 28,
                      ),
                    )),
              );
            });
  }
}
