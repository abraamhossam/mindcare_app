import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/container_info_save_data.dart';


class MedicalInfo extends StatelessWidget {
  const MedicalInfo({super.key});
static String id = "/medical";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          titel: "Medical Info",
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              SizedBox(
                height: 3,
              ),
              ContainerInfo(
                indexpages: "5/5",
                title: "Medical Info",
                desc: "Enter Medical Information",
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Credentials",
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
