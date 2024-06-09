import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/view/clients/views/doctor_profile.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';

class RegisteredDoctorsView extends StatelessWidget {
  const RegisteredDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("doctors_data").snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(DoctorProfile(
                          doctor: snapshot.data!.docs[index],
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  snapshot.data!.docs[index]['urlImage'],
                                ),
                              ),
                            ),
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(
                            width: SizeConfig.width! * 0.1,
                          ),
                          SizedBox(
                            width: SizeConfig.width! * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "D.${snapshot.data!.docs[index]['name']}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.docs[index]['phone'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("OOps there is an error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
