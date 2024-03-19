import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/dropdown_button.dart';


// ignore: must_be_immutable
class DropdownButtonyear extends StatelessWidget {
  const DropdownButtonyear(
      {super.key, required this.hint, required this.labelText});
  final String hint;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownButtonController>(
      init: DropdownButtonController(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: DropdownButtonFormField<dynamic>(
              menuMaxHeight: MediaQuery.of(context).size.height * 0.40,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 193, 192, 192),
                ),
                border: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 193, 192, 192),
                  ),
                ),
              ),
              hint: Text(
                hint,
                style: const TextStyle(color: Color.fromARGB(255, 78, 77, 77)),
              ),
              // value: selectitemsgender,
              value: controller.selectitemyear,
              // items: itemsgender
              items: controller.itemsyears
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) => controller.selectitemyear = item),
        ),
      ),
    );
  }
}
