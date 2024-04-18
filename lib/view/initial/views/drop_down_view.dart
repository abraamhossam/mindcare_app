import 'package:flutter/material.dart';
import 'package:mindcare_app/view/initial/widgets/app_title.dart';
import 'package:mindcare_app/view/initial/widgets/drop_down_view_body.dart';

class DropDownView extends StatelessWidget {
  const DropDownView({super.key});
  static String id = "/DropDownView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const AppTitle(),
        ),
        body: const DropDownViewBody(),
      ),
    );
  }
}
