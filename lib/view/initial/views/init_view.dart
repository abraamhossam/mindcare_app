import 'package:flutter/material.dart';
import 'package:mindcare_app/view/initial/widgets/app_title.dart';
import 'package:mindcare_app/view/initial/widgets/init_view_body.dart';

class InitView extends StatelessWidget {
  const InitView({super.key});
  static String id = "/homeview1";
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
        body: const InitViewBody(),
      ),
    );
  }
}
