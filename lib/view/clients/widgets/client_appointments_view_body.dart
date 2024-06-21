import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/model/booking_model.dart';
import 'package:mindcare_app/view/Doctors/widgets/bubble_date.dart';

class ClientAppointmentsBody extends StatelessWidget {
  const ClientAppointmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("bookings")
          .where('members',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapchot) {
        if (snapchot.hasData) {
          List<BookingModel> listIteams = snapchot.data!.docs
              .map((e) => BookingModel.fromjson(e.data()))
              .toList()
            ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

          return listIteams.isEmpty
              ? const Center(child: Text("No Bookings yet"))
              : ListView.builder(
                  itemCount: snapchot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 24,
                      ),
                      child: SizedBox(
                        height: SizeConfig.height! * 0.27,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: SizeConfig.width! * 0.28,
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
                                  listIteams[index].reply == 'waiting'
                                      ? const Icon(
                                          Icons.schedule,
                                          size: 36,
                                          color: Colors.black,
                                        )
                                      : listIteams[index].reply == 'accept'
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
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Container(
                                width: SizeConfig.width! * 0.62,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        bottom: 8,
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
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          listIteams[index].reply == 'waiting'
                                              ? const Text(
                                                  "Waiting for reply from therapist",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : listIteams[index].reply ==
                                                      'accept'
                                                  ? const Text(
                                                      "Your appointment has been successfully booked.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : const Text(
                                                      "Your appointment has been successfully cancelled.",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                          listIteams[index].doctorName!,
                                          style: const TextStyle(
                                            fontSize: 16,
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
    );
  }
}
