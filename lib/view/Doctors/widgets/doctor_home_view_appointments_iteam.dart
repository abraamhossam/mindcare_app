import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/booking_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/bubble_date_doctor.dart';

class DoctorHomeViewAppointmentsIteam extends StatelessWidget {
  const DoctorHomeViewAppointmentsIteam({
    super.key,
    this.controller,
  });
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.38,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("bookings")
            .where('members',
                arrayContains: FirebaseAuth.instance.currentUser!.uid)
            .where(
              'reply',
              isEqualTo: 'accept',
            )
            .snapshots(),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            List<BookingModel> listIteams = snapchot.data!.docs
                .map((e) => BookingModel.fromjson(e.data()))
                .toList()
              ..sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

            return listIteams.isEmpty
                ? const Center(child: Text("There are no appointments"))
                : ListView.builder(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: listIteams.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BubbleDateDoctor(
                              hour: listIteams[index].hour!,
                              month: listIteams[index].month!,
                              day: listIteams[index].day!,
                            ),
                            SizedBox(
                              height: SizeConfig.height! * 0.01,
                            ),
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Container(
                                height: SizeConfig.height! * 0.24,
                                width: SizeConfig.width! * 0.55,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color: Colors.white,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Therapy Session",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Appointment ${index + 1}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      listIteams[index].userName!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          } else if (snapchot.hasError) {
            return const Center(child: Text("OOps there is an error"));
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
