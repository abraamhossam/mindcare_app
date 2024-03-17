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
import 'package:mindcare_app/utils/mybindings.dart';
import 'package:mindcare_app/view/init_view.dart';
import 'package:mindcare_app/view/reset_view.dart';
import 'package:mindcare_app/view/sign_in_view.dart';
import 'package:mindcare_app/view/sign_up_view.dart';
import 'package:mindcare_app/view/splash_view.dart';
import 'package:mindcare_app/view/tests/views/adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/aniexty_test_vew.dart';
import 'package:mindcare_app/view/tests/views/dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_1_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_2_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_3_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_4_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_5_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_6_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_7_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_8_view.dart';
import 'package:mindcare_app/view/tests/views/mental_illness_test_view.dart';
import 'package:mindcare_app/view/tests/views/post_traumatic_stress_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_aniexty_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_mental_illness_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_post_traumatic_stress_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_schizophrenia_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_social_anxiety_test_view.dart';
import 'package:mindcare_app/view/tests/views/schizophrenia_test_view.dart';
import 'package:mindcare_app/view/tests/views/social_anxiety_test_view.dart';
import 'package:mindcare_app/view/tests/views/test_home_view.dart';
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
        //test
        GetPage(
          name: TestHomeView.id,
          page: () => const TestHomeView(),
        ),
        GetPage(
          name: FinalTest1View.id,
          page: () => FinalTest1View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest2View.id,
          page: () => FinalTest2View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest3View.id,
          page: () => FinalTest3View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest4View.id,
          page: () => FinalTest4View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest5View.id,
          page: () => FinalTest5View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest6View.id,
          page: () => FinalTest6View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest7View.id,
          page: () => FinalTest7View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: FinalTest8View.id,
          page: () => FinalTest8View(),
          binding: MyBindings(),
        ),
        GetPage(
          name: AniextyTestView.id,
          page: () => const AniextyTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: DASSTestView.id,
          page: () => const DASSTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ADHDTestView.id,
          page: () => const ADHDTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: DepressionTestView.id,
          page: () => const DepressionTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: MentalIllnessTestView.id,
          page: () => const MentalIllnessTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: PostTraumaticStressTestView.id,
          page: () => const PostTraumaticStressTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: SchizophreniaTestView.id,
          page: () => const SchizophreniaTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: SocialAnxietyTestView.id,
          page: () => const SocialAnxietyTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultSchizophreniaTestView.id,
          page: () => const ResultSchizophreniaTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultDepressionTestView.id,
          page: () => const ResultDepressionTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultSocialAnxietyTestView.id,
          page: () => const ResultSocialAnxietyTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultPostTraumaticStressTestView.id,
          page: () => const ResultPostTraumaticStressTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultMentalIllnessTestView.id,
          page: () => const ResultMentalIllnessTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultDASSTestView.id,
          page: () => const ResultDASSTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultAniextyTestView.id,
          page: () => const ResultAniextyTestView(),
          binding: MyBindings(),
        ),
        GetPage(
          name: ResultADHDTestView.id,
          page: () => const ResultADHDTestView(),
          binding: MyBindings(),
        ),
      ],
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? SplashView.id : '/home',
      //initialRoute: SignInView.id,
    );
  }
}
