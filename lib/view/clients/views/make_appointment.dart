import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/botton_time_controller.dart';
import 'package:mindcare_app/firebase/fire_auth_booking.dart';
import 'package:mindcare_app/firebase/fire_auth_rooms.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/widgets/choose.dart';
import 'package:mindcare_app/view/widgets/custom_back_icon.dart';
import 'package:mindcare_app/view/widgets/fee_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({
    super.key,
    this.doctorData,
  });
  static String id = "/make_appointment";

  final dynamic doctorData;

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  List<String> listTime = [
    '8.00 AM',
    '10.00 AM',
    '1.00 PM',
    '3.00 PM',
    '4.00 PM',
    '6.00 PM',
  ];

  List months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  bool isLoading = false;
  String? method;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    String hour = listTime[0];
    String day = DateTime.now().day.toString();
    String month = months[DateTime.now().month - 1];
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: kPrimaryColor,
      ),
      inAsyncCall: isLoading,
      child: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    back,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.16,
                ),
                Text(
                  widget.doctorData!['name'],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 8,
                bottom: 8,
              ),
              child: SizedBox(
                height: SizeConfig.height! * 0.14,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectedTextColor: Colors.white,
                  selectionColor: kPrimaryColor,
                  onDateChange: (selectedDate) {
                    day = selectedDate.day.toString();

                    month = months[selectedDate.month.toInt() - 1];
                  },
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.height! * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SizedBox(
                height: SizeConfig.height! * 0.16,
                child: GridView.builder(
                    itemCount: listTime.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 0.8,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return GetBuilder<ButtonTimeController>(
                        init: ButtonTimeController(),
                        builder: (controller) {
                          return CustomTime(
                            time: listTime[index],
                            backGroundColor: index == controller.index
                                ? kPrimaryColor
                                : Colors.white,
                            color: index == controller.index
                                ? Colors.white
                                : kPrimaryColor,
                            ontap: () {
                              controller.setIndex(buttonIndex: index);
                              hour = listTime[index];
                            },
                          );
                        },
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Text(
                      "Session Method : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              activeColor: kPrimaryColor,
                              value: "offline",
                              groupValue: method,
                              onChanged: (val) {
                                method = val;

                                setState(() {});
                              }),
                          const Text(
                            "offline",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              activeColor: kPrimaryColor,
                              value: "online",
                              groupValue: method,
                              onChanged: (val) {
                                method = val;

                                setState(() {});
                              }),
                          const Text(
                            "online",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.height! * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: Size(
                    SizeConfig.width!,
                    SizeConfig.height! * 0.06,
                  ),
                ),
                onPressed: () async {
                  isLoading = true;
                  setState(() {});
                  String check = await FireAuthBooking.checkbooking(
                    doctorName: widget.doctorData!['name'],
                  );
                  bool checkTime = await FireAuthBooking.checkbookingTime(
                      doctorName: widget.doctorData!['name'],
                      day: day,
                      month: month.toString(),
                      hour: hour.toString());
                  if (check == 'waiting') {
                    // ignore: use_build_context_synchronously
                    snackbar(context,
                        'Already Booked Session and waiting for reply');
                  } else {
                    if (checkTime == false) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentTextStyle: const TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              backgroundColor: const Color(0xff607D8B),
                              content: const Text(
                                "Are you sure to booking session ?",
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    if (method == "online") {
                                      FireAuthBooking.createBooking(
                                        type: "online",
                                        month: month,
                                        day: day,
                                        hour: hour,
                                        doctorName: widget.doctorData!['name'],
                                      );
                                    } else {
                                      FireAuthBooking.createBooking(
                                        type: "offline",
                                        month: month,
                                        day: day,
                                        hour: hour,
                                        doctorName: widget.doctorData!['name'],
                                      );
                                    }
                                    Get.back();
                                    snackbar(
                                      context,
                                      "Booked session successfully and waiting for reply from therapist",
                                    );
                                    FireAuthRooms.sendNotificationBooking(
                                      msg: "he wants to book a therapy session",
                                      collectionName: "doctors",
                                      recieverName: widget.doctorData!['name'],
                                    );
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      // ignore: use_build_context_synchronously
                      snackbar(context, "This time is already booked");
                    }
                  }
                  isLoading = false;
                  setState(() {});
                },
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 24,
              ),
              child: Text(
                "Fee Details".tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FeeCard(
              ontap: () {
                Get.bottomSheet(
                  const ChooseMethodeToPayment(),
                  backgroundColor: Colors.white,
                );
              },
              size: size,
              title: 'Offline Session'.tr,
              subTitle: "Can make therapy session with therapist offline.".tr,
              icon: Icons.interpreter_mode,
              price: 20,
            ),
            FeeCard(
              ontap: () {
                Get.bottomSheet(
                  const ChooseMethodeToPayment(),
                  backgroundColor: Colors.white,
                );
              },
              size: size,
              title: 'Online Session'.tr,
              subTitle: "Can make therapy session with therapist online.".tr,
              icon: Icons.interpreter_mode,
              price: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTime extends StatelessWidget {
  const CustomTime({
    super.key,
    required this.time,
    this.color,
    this.backGroundColor,
    this.ontap,
  });
  final String time;
  final Color? color, backGroundColor;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: kPrimaryColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: color ?? kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
