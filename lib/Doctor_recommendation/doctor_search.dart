import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mindcare_app/Doctor_recommendation/cities.dart';
import 'package:mindcare_app/Doctor_recommendation/doctor_location_controller.dart';

import 'package:mindcare_app/view/widgets/custom_back_icon.dart';

// ignore: use_key_in_widget_constructors
class DoctorSearch extends StatelessWidget {
  static String id = "/doctor_search";
  final DoctorLocatorController controller = Get.put(DoctorLocatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctor Locator',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: DropdownMenu(
          controller: controller.cityController,
          onSelected: (city) async {
            if (city != null) {
              await controller.fetchDoctorLocations(city);

              Get.to(() => CustomMap(
                    city: city.toLowerCase(),
                    //markers: controller.markers,
                  ));
            }
          },
          hintText: "Select City",
          enableSearch: true,
          width: 300,
          menuHeight: 250,
          dropdownMenuEntries: const <DropdownMenuEntry<String>>[
            DropdownMenuEntry(value: "cairo", label: "Cairo"),
            DropdownMenuEntry(value: "giza", label: "Giza"),
            DropdownMenuEntry(value: "alexandria", label: "Alexandria"),
            DropdownMenuEntry(value: "qalyubia", label: "Qalyubia"),
            DropdownMenuEntry(value: "gharbia", label: "Gharbia"),
            DropdownMenuEntry(value: "assiut", label: "Assiut"),
            DropdownMenuEntry(value: "sohag", label: "Sohag"),
            DropdownMenuEntry(value: "minya", label: "Minya"),
            DropdownMenuEntry(value: "qena", label: "Qena"),
            DropdownMenuEntry(value: "menoufia", label: "Menoufia"),
            DropdownMenuEntry(value: "dakahlia", label: "Dakahlia"),
            DropdownMenuEntry(value: "beni suef", label: "Beni suef"),
            DropdownMenuEntry(value: "sharkia", label: "Sharkia"),
            DropdownMenuEntry(value: "port said", label: "Port said"),
          ],
        ),
      ),
    );
  }
}

class CustomMap extends StatelessWidget {
  // final Set<Marker> markers;
  final String city;
  final DoctorLocatorController controller = Get.put(DoctorLocatorController());

  CustomMap({
    super.key,
    // required this.markers,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: cities[city]!,
            zoom: 11,
          ),
          markers: controller.markers,
        ));
  }
}
