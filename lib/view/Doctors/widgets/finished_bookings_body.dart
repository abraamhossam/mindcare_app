import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/booking_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/bubble_date.dart';

class FinishedBookingsBody extends StatelessWidget {
  const FinishedBookingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("bookings")
            .where('members',
                arrayContains: FirebaseAuth.instance.currentUser!.uid)
            .where(
          'reply',
          whereIn: ['accept', 'reject'],
        ).snapshots(),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            List<BookingModel> listIteams = snapchot.data!.docs
                .map((e) => BookingModel.fromjson(e.data()))
                .toList()
              ..sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

            return listIteams.isEmpty
                ? const Center(child: Text("No bookings"))
                : ListView.builder(
                    itemCount: listIteams.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          left: 26,
                        ),
                        child: SizedBox(
                          height: SizeConfig.height! * 0.2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: SizeConfig.width! * 0.24,
                                child: Column(
                                  children: [
                                    BubbleDate(
                                      color1: Colors.white,
                                      color2: kPrimaryColor,
                                      hour: listIteams[index].hour!,
                                      month: listIteams[index].month!,
                                      day: listIteams[index].day!,
                                    ),
                                    const Spacer(),
                                    listIteams[index].reply == 'accept'
                                        ? const Icon(
                                            Icons.check_circle,
                                            size: 36,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            Icons.cancel,
                                            size: 36,
                                            color: Colors.red,
                                          ),
                                    const Spacer(
                                      flex: 2,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.width! * 0.03,
                              ),
                              Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    24,
                                  ),
                                ),
                                child: Container(
                                  width: SizeConfig.width! * 0.64,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                        ),
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Therapy Session",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 22,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundImage: AssetImage(
                                                "assets/images/user_img.png",
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: SizeConfig.width! * 0.02,
                                          ),
                                          Text(
                                            listIteams[index].userName!,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          } else if (snapchot.hasError) {
            return const Center(child: Text("OOps there is an error"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
