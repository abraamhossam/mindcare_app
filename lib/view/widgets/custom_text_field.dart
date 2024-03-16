import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.preIcon,
      required this.title,
      required this.hinttext,
      this.sufIcon,
      this.ispassword,
      this.ontapSufIcon,
      // this.onChanged,
     required this.mycontroller});
  final String hinttext;
  final String title;
  final IconData preIcon;
  final IconData? sufIcon;
  final VoidCallback? ontapSufIcon;
  final bool? ispassword;
  // Function(String)? onChanged;
  final TextEditingController  mycontroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
      },
      // onChanged: onChanged,
      obscureText: ispassword ?? false,
      decoration: InputDecoration(
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        prefixIcon: Icon(
          preIcon,
          size: 28,
        ),
        suffixIcon: IconButton(
          onPressed: ontapSufIcon,
          icon: Icon(
            sufIcon,
            size: 28,
          ),
        ),
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
