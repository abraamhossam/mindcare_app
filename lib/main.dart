import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/doctor_profile.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/doctor_search.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/home_page.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/make_appointment.dart';
import 'package:mindcare_app/Ahmed%20Elsanousy/Screens/profile_page.dart';
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

import 'firebase_options.dart';
import 'view/Doctors/rester_view_doctor.dart';
import 'view/Doctors/sign_in_view_doctors.dart';
import 'view/Doctors/sign_up_view_doctor.dart';
import 'view/widgets/pay_view.dart';

SharedPreferences? sharedPrefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        // doctor
        GetPage(
          name: SignInViewDoctors.id,
          page: () => const SignInViewDoctors(),
        ),
        GetPage(
          name: SignUpView.id,
          page: () => const SignUpView(),
        ),
        //
        GetPage(
          name: SignUpViewDoctors.id,
          page: () => const SignUpViewDoctors(),
        ),
        GetPage(
          name: ResetView.id,
          page: () => const ResetView(),
        ),
        GetPage(
          name: ResterViewDoctor.id,
          page: () => const ResterViewDoctor(),
        ),
        GetPage(
          name: PayView.id,
          page: () => const PayView(),
        ),
        GetPage(
          name: ProfilePage.id,
          page: () => const ProfilePage(),
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
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? SplashView.id : '/home',
      //initialRoute: SignInView.id,
    );
  }
}
