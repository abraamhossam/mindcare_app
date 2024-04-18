import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/controller/botton_time_controller.dart';
import 'package:mindcare_app/firebase/fire_auth_booking.dart';
import 'package:mindcare_app/helper/show_snakbar.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/widgets/custom_back_icon.dart';
import 'package:mindcare_app/view/widgets/fee_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({
    super.key,
    this.doctor,
  });
  static String id = "/make_appointment";

  final Map<String, dynamic>? doctor;

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    String hour = listTime[0];
    String day = DateTime.now().day.toString();
    String month = months[DateTime.now().month - 1];
    return ModalProgressHUD(
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
                  widget.doctor!['name'],
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize:
                      Size(SizeConfig.width!, SizeConfig.height! * 0.06),
                ),
                onPressed: () async {
                  isLoading = true;
                  setState(() {});
                  String check = await FireAuthBooking.checkbooking(
                    doctorName: "doctor1",
                  );
                  bool checkTime = await FireAuthBooking.checkbookingTime(
                      doctorName: "doctor1",
                      day: day,
                      month: month.toString(),
                      hour: hour.toString());
                  if (check == 'waiting') {
                    snackbar(context,
                        'Already Booked Session and waiting for reply');
                  } else {
                    if (checkTime == false) {
                      FireAuthBooking.createBooking(
                          month: month,
                          day: day,
                          hour: hour,
                          doctorName: "doctor1");
                      snackbar(context,
                          "Booked session successfully and waiting for reply from therapist");
                    } else {
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

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25.0),
            //   child: Text(
            //     'Choose The Hour'.tr,
            //     style: const TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       HourButton(
            //         hour: '8:00 ${"A`M".tr}',
            //         size: size,
            //       ),
            //       HourButton(
            //         hour: '10:00 ${"AM".tr}',
            //         size: size,
            //       ),
            //       HourButton(
            //         hour: '1:00 ${"PM".tr}',
            //         size: size,
            //       ),
            //     ],
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     HourButton(
            //       hour: '3:00 ${"PM".tr}',
            //       size: size,
            //     ),
            //     HourButton(
            //       hour: '4:00 ${"PM".tr}',
            //       size: size,
            //     ),
            //     HourButton(
            //       hour: '6:00 ${"PM".tr}',
            //       size: size,
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                "Fee Details".tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FeeCard(
              size: size,
              title: 'Messeging'.tr,
              subTitle: "Can messege with therapist.".tr,
              icon: Icons.chat_bubble_outline,
              price: 3,
            ),
            FeeCard(
              size: size,
              title: "Voice Call".tr,
              subTitle: "Can make a voice call with therapist.".tr,
              icon: Icons.call_outlined,
              price: 3,
            ),
            FeeCard(
              size: size,
              title: "Video Call".tr,
              subTitle: "Can make a video call with therapist.".tr,
              icon: Icons.video_call_outlined,
              price: 3,
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
