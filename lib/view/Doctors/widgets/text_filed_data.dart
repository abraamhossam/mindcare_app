import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFiledData extends StatelessWidget {
  const TextFiledData({
    super.key,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.inputType,
    this.maxLine,
  });
  final String labelText;
  final Function(String)? onChanged;
  final dynamic validator;
  final TextInputType? inputType;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: TextFormField(
        maxLines: maxLine,
        keyboardType: inputType,
        validator: validator,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey,
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
