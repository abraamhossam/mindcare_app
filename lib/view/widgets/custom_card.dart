import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.size,
    required this.backColor,
    required this.imageName,
    required this.title,
    required this.subTitle,
    this.textColor,
    this.ontap,
  });

  final Size size;
  final Color backColor;
  final ImageProvider imageName;
  final String title;
  final String subTitle;
  final Color? textColor;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: GestureDetector(
        onTap: ontap,
        child: Card(
          elevation: 5,
          color: backColor,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: size.height * 0.35,
            width: size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: size.width * 0.15, backgroundImage: imageName,
                  //AssetImage("assests/images/meditation/$imageName.png"),
                  //NetworkImage(url),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: textColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
