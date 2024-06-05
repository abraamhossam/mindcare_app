import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });
  final String image;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
