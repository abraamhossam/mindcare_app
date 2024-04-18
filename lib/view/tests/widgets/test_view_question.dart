import 'package:flutter/material.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/helper/size_config.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';

class TestViewQuestion extends StatelessWidget {
  const TestViewQuestion({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BubbleSpecialOne(
      isSender: false,
      color: kPrimaryColor,
      text: text,
      constraints: BoxConstraints(
        maxWidth: SizeConfig.width! * 0.88,
        minWidth: SizeConfig.width! * 0.88,
      ),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
// Container(
//       padding: const EdgeInsets.all(16),
//       width: SizeConfig.width! * 0.85,
//       decoration: const BoxDecoration(
//         color: kPrimaryColor,
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(32),
//           bottomRight: Radius.circular(32),
//           bottomLeft: Radius.circular(32),
//         ),
//       ),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );