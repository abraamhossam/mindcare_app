import 'package:flutter/widgets.dart';

class DoctorHomeTitle extends StatelessWidget {
  const DoctorHomeTitle({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
