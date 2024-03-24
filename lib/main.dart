import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Langauge/language.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';
import 'package:mindcare_app/constants.dart';
import 'package:mindcare_app/utils/mybindings.dart';
import 'package:mindcare_app/view/Doctors/views/appointments_view.dart';
import 'package:mindcare_app/view/Doctors/views/doctor_home_view.dart';
import 'package:mindcare_app/view/Doctors/views/enquiry_details_view.dart';
import 'package:mindcare_app/view/Doctors/views/notifications_view.dart';
import 'package:mindcare_app/view/Doctors/views/rester_view_doctor.dart';
import 'package:mindcare_app/view/Doctors/views/sign_in_view_doctors.dart';
import 'package:mindcare_app/view/Doctors/views/sign_up_view_doctor.dart';
import 'package:mindcare_app/view/Doctors/views/test_view.dart';
import 'package:mindcare_app/view/doctor_profile.dart';
import 'package:mindcare_app/view/doctor_search.dart';
import 'package:mindcare_app/view/home_page.dart';
import 'package:mindcare_app/view/init_view.dart';
import 'package:mindcare_app/view/make_appointment.dart';
import 'package:mindcare_app/view/profile_page.dart';
import 'package:mindcare_app/view/reset_view.dart';
import 'package:mindcare_app/view/sign_in_view.dart';
import 'package:mindcare_app/view/sign_up_view.dart';
import 'package:mindcare_app/view/splash_view.dart';
import 'package:mindcare_app/view/test_page.dart';
import 'package:mindcare_app/view/tests/views/adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/aniexty_test_vew.dart';
import 'package:mindcare_app/view/tests/views/dass_test_view.dart';
import 'package:mindcare_app/view/tests/views/depression_test_view.dart';
import 'package:mindcare_app/view/tests/views/final_test_view.dart';
import 'package:mindcare_app/view/tests/views/mental_illness_test_view.dart';
import 'package:mindcare_app/view/tests/views/post_traumatic_stress_test_view.dart';
import 'package:mindcare_app/view/tests/views/result_adhd_test_view.dart';
import 'package:mindcare_app/view/tests/views/schizophrenia_test_view.dart';
import 'package:mindcare_app/view/tests/views/social_anxiety_test_view.dart';
import 'package:mindcare_app/view/tests/views/test_home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'view/Doctors/views/edication_data.dart';
import 'view/Doctors/views/first_info.dart';
import 'view/Doctors/views/medical_info.dart';
import 'view/Doctors/views/profile_info.dart';
import 'view/Doctors/views/verification_page.dart';
import 'view/Doctors/views/work_experience.dart';
import 'view/mental_illness_history.dart';
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

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
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
          GetPage(
            name: DoctorHomeView.id,
            page: () => DoctorHomeView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: EnquiryDetailsView.id,
            page: () => EnquiryDetailsView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: AppointmentsView.id,
            page: () => const AppointmentsView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: NotificationsView.id,
            page: () => const NotificationsView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: TestView.id,
            page: () => const TestView(),
            binding: MyBindings(),
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
            name: HomePage.id,
            page: () => const HomePage(),
          ),
          GetPage(
            name: mentalTests.id,
            page: () => const mentalTests(),
          ),
          GetPage(
            name: doctorSearch.id,
            page: () => doctorSearch(),
          ),
          GetPage(
            name: doctorProfile.id,
            page: () => doctorProfile(),
          ),
          GetPage(
            name: MakeAppointment.id,
            page: () => MakeAppointment(),
          ),
          //test
          GetPage(
            name: TestHomeView.id,
            page: () => const TestHomeView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: FinalTestView.id,
            page: () => FinalTestView(),
            binding: MyBindings(),
          ),

          GetPage(
            name: AniextyTestView.id,
            page: () => AniextyTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: DASSTestView.id,
            page: () => DASSTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: ADHDTestView.id,
            page: () => ADHDTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: DepressionTestView.id,
            page: () => DepressionTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: MentalIllnessTestView.id,
            page: () => MentalIllnessTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: PostTraumaticStressTestView.id,
            page: () => PostTraumaticStressTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: SchizophreniaTestView.id,
            page: () => SchizophreniaTestView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: SocialAnxietyTestView.id,
            page: () => SocialAnxietyTestView(),
            binding: MyBindings(),
          ),

          GetPage(
            name: ResultADHDTestView.id,
            page: () => const ResultADHDTestView(),
            binding: MyBindings(),
          ),
          //
          GetPage(
            name: BasicInfo.id,
            page: () => const BasicInfo(),
          ),
          GetPage(
            name: WorkExperienceView.id,
            page: () => const WorkExperienceView(),
          ),
          GetPage(
            name: EdicationDataView.id,
            page: () => const EdicationDataView(),
          ),
          GetPage(
            name: MedicalInfo.id,
            page: () => const MedicalInfo(),
          ),
          GetPage(
            name: ProfileInfo.id,
            page: () => const ProfileInfo(),
          ),
          GetPage(
            name: VerificationPage.id,
            page: () => const VerificationPage(),
          ),
          GetPage(
              name: MentalIllnessHistoryPage.id,
              page: () =>MentalIllnessHistoryPage(),
              binding: MyBindings(),
              )
        ],
        initialRoute: SplashView.id,
        // initialRoute: FirebaseAuth.instance.currentUser == null
        //     ? SplashView.id
        //     : HomePage.id,
        //initialRoute: SignInView.id,
        // initialRoute: BasicInfo.id,
      ),
    );
  }
}
