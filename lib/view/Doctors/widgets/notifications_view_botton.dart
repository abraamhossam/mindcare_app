import 'package:flutter/material.dart';
import 'package:mindcare_app/utils/size_config.dart';

class NotificationsViewBotton extends StatelessWidget {
  const NotificationsViewBotton({
    super.key,
    required this.color,
    required this.backgroundColor,
  });
  final Color color, backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(
          SizeConfig.width! * 0.2,
          SizeConfig.height! * 0.035,
        ),
      ),
      onPressed: () {},
      child: Text(
        "Pending",
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    );
  }
}
