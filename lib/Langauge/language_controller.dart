import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/main.dart';

class LanguageController extends GetxController {
  String langeCode = "ar";
  late Locale initLang = Locale(langeCode);
/*  late Locale initLang = sharedPrefs!.getString("lang") == null
      ? Locale(langeCode)
      : Locale(sharedPrefs!.getString("lang")!);
 */
  void changeLang() {
    if (langeCode == "en") {
      langeCode = "ar";
      sharedPrefs!.setString("lang", "ar");
      Get.updateLocale(Locale(langeCode));
    } else {
      langeCode = "en";
      sharedPrefs!.setString("lang", "en");
      Get.updateLocale(Locale(langeCode));
    }
  }
}
