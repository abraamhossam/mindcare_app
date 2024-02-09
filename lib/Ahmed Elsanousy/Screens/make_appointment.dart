import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Custom%20Widgets/fee_card.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Custom%20Widgets/hour_button.dart';

// ignore: must_be_immutable
class MakeAppointment extends StatelessWidget {
  MakeAppointment({
    super.key,
    this.doctor,
  });

  Map<String, dynamic>? doctor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  size: 30,
                ),
              ),
              SizedBox(
                width: size.width * 0.16,
              ),
              Text(
                doctor!['name'],
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25.0),
            child: Text(
              'Choose The Hour',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HourButton(
                  hour: '8:00 AM',
                  size: size,
                ),
                HourButton(
                  hour: '10:00 AM',
                  size: size,
                ),
                HourButton(
                  hour: '1:00 PM',
                  size: size,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HourButton(
                hour: '3:00 PM',
                size: size,
              ),
              HourButton(
                hour: '4:00 PM',
                size: size,
              ),
              HourButton(
                hour: '6:00 PM',
                size: size,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25.0),
            child: Text(
              'Fee Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FeeCard(
            size: size,
            title: 'Messeging',
            subTitle: 'Can messege with therapist.',
            icon: Icons.chat_bubble_outline,
            price: 3,
          ),
          FeeCard(
            size: size,
            title: 'Voice Call',
            subTitle: 'Can make a voice call with therapist.',
            icon: Icons.call_outlined,
            price: 3,
          ),
          FeeCard(
            size: size,
            title: 'Video Call',
            subTitle: 'Can make a voice call with therapist.',
            icon: Icons.video_call_outlined,
            price: 3,
          ),
        ],
      ),
    );
  }
}
