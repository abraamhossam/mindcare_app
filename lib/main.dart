import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/doctor_profile.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/doctor_search.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/home_page.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/make_appointment.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/test_page.dart';
import 'package:mindcare_app/Langauge/language.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/view/init_view.dart';
import 'package:mindcare_app/view/reset_view.dart';
import 'package:mindcare_app/view/sign_in_view.dart';
import 'package:mindcare_app/view/sign_up_view.dart';
import 'package:mindcare_app/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/widgets/pay_view.dart';

SharedPreferences? sharedPrefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  runApp(
    const MindCareApp(),
  );
}

class MindCareApp extends StatelessWidget {
  const MindCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController language = Get.put(LanguageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kFontFamily,
      ),
      locale: language.initLang,
      translations: Language(),
      getPages: [
        GetPage(
          name: SplashView.id,
          page: () => const SplashView(),
        ),
        GetPage(
          name: InitView.id,
          page: () => const InitView(),
        ),
        GetPage(
          name: SignInView.id,
          page: () => const SignInView(),
        ),
        GetPage(
          name: SignUpView.id,
          page: () => const SignUpView(),
        ),
        GetPage(
          name: ResetView.id,
          page: () => const ResetView(),
        ),
        GetPage(
          name: PayView.id,
          page: () => const PayView(),
        ),
        // ............سكرينات السنوسي.. ............
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/mental_tests',
          page: () => const mentalTests(),
        ),
        GetPage(
          name: '/doctor_search',
          page: () => doctorSearch(),
        ),
        GetPage(
          name: '/doctor_profile',
          page: () => doctorProfile(),
        ),
        GetPage(
          name: '/make_appointment',
          page: () => MakeAppointment(),
        ),
      ],
      initialRoute: SplashView.id,
      //initialRoute: "/home",
    );
  }
}
