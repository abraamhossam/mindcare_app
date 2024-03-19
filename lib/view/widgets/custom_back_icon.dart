import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';

LanguageController language = Get.find();
IconData back = language.langeCode == "en"
    ? Icons.keyboard_arrow_left
    : Icons.keyboard_arrow_right;
