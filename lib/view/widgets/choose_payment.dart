import 'package:flutter/material.dart';

class ChoosePayment extends StatelessWidget {
  const ChoosePayment({
    super.key,
    required this.image,
    this.onTap,
  });
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Center(
          child: Image.asset(
            image,
          ),
        ),
      ),
    );
  }
}
