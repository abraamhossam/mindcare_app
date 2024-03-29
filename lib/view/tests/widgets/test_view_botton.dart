import 'package:flutter/material.dart';
import 'package:mindcare_app/helper/size_config.dart';

class TestViewButton extends StatelessWidget {
  const TestViewButton({
    super.key,
    required this.data,
    required this.onPressed,
  });
  final Map<String, dynamic> data;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          minimumSize: Size(
            SizeConfig.width! * 0.9,
            SizeConfig.height! * 0.05,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          data['text'],
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
