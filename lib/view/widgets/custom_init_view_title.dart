import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';

class CustomInitViewTitle extends StatelessWidget {
  const CustomInitViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Spacer(
          flex: 2,
        ),
        Text(
          "Mind",
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Care",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: MaterialButton(
            onPressed: () {},
            minWidth: 10,
            color: Colors.white,
            child: const Text("ع"),
          ),
        ),
      ],
    );
  }
}
