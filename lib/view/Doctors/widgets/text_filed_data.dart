import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TextFiledData extends StatelessWidget {
    TextFiledData({super.key, required this.labelText,
    this.onChanged});
  final String labelText;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:   TextStyle(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 172, 171, 171),
          ),
          border: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 164, 161, 161),
            ),
          ),
        ),
      ),
    );
  }
}
