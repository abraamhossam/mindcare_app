import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/assets.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:mindcare_app/view/Doctors/widgets/custom_profile_image.dart';
import 'package:mindcare_app/view/Doctors/widgets/notifications_view_botton.dart';

class NotificationsViewIteam extends StatelessWidget {
  const NotificationsViewIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Container(
        height: SizeConfig.height! * 0.15,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.4),
              width: 2,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProfileImage(
              image: Assets.testImage,
              width: SizeConfig.width! * 0.14,
              height: SizeConfig.height! * 0.07,
            ),
            SizedBox(
              width: SizeConfig.width! * 0.04,
            ),
            SizedBox(
              width: SizeConfig.width! * 0.735,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Anna Kowalsky",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Case: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        "Mike Smith",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height! * 0.01,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NotificationsViewBotton(
                        backgroundColor: kPrimaryColor,
                        color: Colors.white,
                      ),
                      Text(
                        "April 29, 2021",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
