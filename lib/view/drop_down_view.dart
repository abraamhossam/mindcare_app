import 'package:flutter/material.dart';
import 'package:mindcare_app/view/widgets/custom_init_view_title.dart';
import 'package:mindcare_app/view/widgets/drop_down_view_body.dart';

class DropDownView extends StatelessWidget {
  const DropDownView({super.key});
  static String id = "/dropdownview";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const CustomInitViewTitle(),
        ),
        body: const DropDownViewBody(),
      ),
    );
  }
}
