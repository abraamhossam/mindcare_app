import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/utils/assets.dart';
import 'package:mindcare_app/utils/size_config.dart';

class DoctorVirtualConsultationBody extends StatelessWidget {
  const DoctorVirtualConsultationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: SizeConfig.height! * 0.22,
      decoration: BoxDecoration(
        border: Border.all(
          color: kPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: SizeConfig.height! * 0.15,
              width: SizeConfig.width! * 0.22,
              child: Image.asset(
                Assets.testImage,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Access to patient navigation",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height! * 0.005,
                ),
                const Text(
                  "Virtual consultation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "with a patient navigator",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height! * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        minimumSize: const Size(100, 32),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Arrange",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.width! * 0.1,
                    ),
                    const Icon(
                      Icons.help_outline_sharp,
                      size: 28,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
