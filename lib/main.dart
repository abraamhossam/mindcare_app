import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mindcare_app/Doctor_recommendation/doctor_profile2.dart';
import 'package:mindcare_app/Doctor_recommendation/doctor_search.dart';
import 'package:mindcare_app/Langauge/language.dart';
import 'package:mindcare_app/Langauge/language_controller.dart';
import 'package:mindcare_app/chatbot/chatbot_view.dart';
import 'package:mindcare_app/helper/mybindings.dart';
import 'package:mindcare_app/view/Doctors/views/appointments_view.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_admin_view.dart';
import 'package:mindcare_app/view/Doctors/views/chatting_users_view.dart';
import 'package:mindcare_app/view/Doctors/views/doctor_home_view.dart';
import 'package:mindcare_app/view/Doctors/views/reports_view.dart';
import 'package:mindcare_app/view/Doctors/views/reset_doctor_view.dart';
import 'package:mindcare_app/view/Doctors/views/sign_in_doctor_view.dart';
import 'package:mindcare_app/view/Doctors/views/sign_up_doctor_view.dart';
import 'package:mindcare_app/view/Doctors/views/test_view.dart';
import 'package:mindcare_app/view/Doctors/views/profile_doctor_view.dart';
import 'package:mindcare_app/view/Recommendations/views/mood_recommendations_view.dart';
import 'package:mindcare_app/view/Recommendations/views/video_recommendations_view.dart';
import 'package:mindcare_app/view/clients/views/client_home_view.dart';
import 'package:mindcare_app/view/clients/views/doctors_view.dart';
import 'package:mindcare_app/view/clients/views/make_appointment.dart';
import 'package:mindcare_app/view/clients/views/reset_view_client_view.dart';
import 'package:mindcare_app/view/clients/views/sign_in_client_view.dart';
import 'package:mindcare_app/view/clients/views/sign_up_client_view.dart';
import 'package:mindcare_app/view/initial/views/drop_down_view.dart';
import 'package:mindcare_app/view/initial/views/init_view.dart';
import 'package:mindcare_app/view/initial/views/splash_view.dart';
import 'package:mindcare_app/view/clients/views/profile_user_View.dart';
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
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'firebase_options.dart';
import 'view/Doctors/views/basic_info.dart';
import 'view/Doctors/views/edication_data.dart';
import 'view/Doctors/views/medical_info.dart';
import 'view/Doctors/views/profile_info.dart';
import 'view/Doctors/views/verification_page.dart';
import 'view/Doctors/views/work_experience.dart';
import 'view/mental_illness_history.dart';
import 'view/widgets/pay_view.dart';

SharedPreferences? sharedPrefs;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MindCareApp(navigatorKey: navigatorKey));
  });
}

class MindCareApp extends StatelessWidget {
  const MindCareApp({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    LanguageController language = Get.put(LanguageController());

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: language.initLang,
        translations: Language(),
        initialBinding: MyBindings(),
        initialRoute: sharedPrefs!.getString("frist_Reg") == "true"
            ? sharedPrefs!.getString("type") == "User"
                ? ClientHomeView.id
                : sharedPrefs!.getString("type") == "Doctor"
                    ? DoctorHomeView.id
                    : DropDownView.id
            : SplashView.id,
        getPages: [
          GetPage(
            name: MakeAppointment.id,
            page: () => const MakeAppointment(),
          ),
          GetPage(
            name: SplashView.id,
            page: () => const SplashView(),
          ),
          GetPage(
            name: InitView.id,
            page: () => const InitView(),
          ),
          GetPage(
            name: DropDownView.id,
            page: () => const DropDownView(),
          ),
          GetPage(
            name: SignInClientView.id,
            page: () => const SignInClientView(),
          ),

          GetPage(
            name: SignUpClientView.id,
            page: () => const SignUpClientView(),
          ),
          GetPage(
            name: ResetClientView.id,
            page: () => const ResetClientView(),
          ),
          GetPage(
            name: DoctorHomeView.id,
            page: () => const DoctorHomeView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: ReportsView.id,
            page: () => const ReportsView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: AppointmentsView.id,
            page: () => const AppointmentsView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: ChattingUsersView.id,
            page: () => ChattingUsersView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: ChattingAdminView.id,
            page: () => ChattingAdminView(),
            binding: MyBindings(),
          ),
          GetPage(
            name: TestView.id,
            page: () => const TestView(),
            binding: MyBindings(),
          ),
          //
          GetPage(
            name: SignUpDoctorView.id,
            page: () => const SignUpDoctorView(),
          ),
          GetPage(
            name: SignInDoctorView.id,
            page: () => const SignInDoctorView(),
          ),
          GetPage(
            name: ResetDoctorView.id,
            page: () => const ResetDoctorView(),
          ),

          GetPage(
            name: PayView.id,
            page: () => const PayView(),
          ),
          GetPage(
            name: ProfileUserView.id,
            page: () => ProfileUserView(),
          ),
          GetPage(
            name: ProfileDoctorView.id,
            page: () => ProfileDoctorView(),
          ),
          // ............سكرينات السنوسي.. ............
          GetPage(
            name: ClientHomeView.id,
            page: () => const ClientHomeView(),
          ),
          GetPage(
            name: mentalTests.id,
            page: () => const mentalTests(),
          ),

          GetPage(
            name: DoctorProfile.id,
            page: () => const DoctorProfile(),
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
            page: () => BasicInfo(),
          ),
          GetPage(
            name: WorkExperienceView.id,
            page: () => const WorkExperienceView(),
          ),
          GetPage(
            name: EdicationDataView.id,
            page: () => EdicationDataView(),
          ),
          GetPage(
            name: MedicalInfo.id,
            page: () => const MedicalInfo(),
          ),
          GetPage(
            name: ProfileInfo.id,
            page: () => ProfileInfo(),
          ),
          GetPage(
            name: VerificationPage.id,
            page: () => const VerificationPage(),
          ),
          GetPage(
            name: MentalIllnessHistoryPage.id,
            page: () => const MentalIllnessHistoryPage(),
            binding: MyBindings(),
          ),
          GetPage(
            name: ChatBotScreen.id,
            page: () => ChatBotScreen(),
          ),
          GetPage(
            name: VideoRecommendationsView.id,
            page: () => const VideoRecommendationsView(),
          ),
          GetPage(
            name: MoodRecommendationsView.id,
            page: () => const MoodRecommendationsView(),
          ),
          GetPage(
            name: DoctorSearch.id,
            page: () => DoctorSearch(),
          ),

          GetPage(
            name: DoctorsView.id,
            page: () => const DoctorsView(),
          ),
        ],
      ),
    );
  }
}
