import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/finished_bookings_body.dart';
import 'package:mindcare_app/view/Doctors/widgets/uncoming_bookings_body.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});
  static String id = "/appointmentsview";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Container(
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TabBar(
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor,
                      ),
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 28,
                          ),
                          child: Tab(
                            text: "Upcoming",
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 34,
                          ),
                          child: Tab(
                            text: "Finished",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      UncomingBookingsBody(),
                      FinishedBookingsBody(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
