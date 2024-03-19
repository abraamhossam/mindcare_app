import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/dropdown_button.dart';


// ignore: must_be_immutable
class DropdownButtonn extends StatelessWidget {
  const DropdownButtonn(
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
          width: double.infinity,
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: const TextStyle(
                  fontSize: 18,
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
              value: controller.selectitemsgender,
              // items: itemsgender
              items: controller.itemsgender
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) => controller.selectitemsgender = item),
        ),
      ),
    );
  }
}
