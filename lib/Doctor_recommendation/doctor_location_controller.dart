// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mindcare_app/Doctor_recommendation/doctor_profile2.dart';

class DoctorLocatorController extends GetxController {
  final TextEditingController cityController = TextEditingController();

  Set<Marker> markers = {};

  @override
  void onClose() {
    cityController.dispose();
    super.onClose();
  }

  /* Future<CameraPosition> getCameraPosition(String city) async {
    LatLng 
  } */

  Future<void> fetchDoctorLocations(String city) async {
    var url = Uri.parse('http://192.168.1.3:8080/recommend_top_doctors');
    var response = await http.post(
      url,
      body: json.encode({'city': city}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      markers.clear();

      for (var doctor in data) {
        if (doctor['Latitude'] != null && doctor['Longitude'] != null) {
          markers.add(CustomMarker(doctor));
        } else {
          print("Invalid latitude or longitude value for $doctor");
        }
      }
    } else {
      print('Failed to fetch doctor locations: ${response.reasonPhrase}');
    }
  }
}

Marker CustomMarker(Map<String, dynamic> doctor) {
  return Marker(
    markerId: MarkerId(doctor["Doctors_Names"]),
    infoWindow: InfoWindow(
      title: doctor["Doctors_Names"],
      onTap: () {
        Get.to(DoctorProfile(
          doctor: doctor,
        ));
      },
    ),
    position: LatLng(doctor['Latitude'], doctor['Longitude']),
    icon: BitmapDescriptor.defaultMarker,
  );
}
