import 'package:get/get.dart';

class Language implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": {
          //.......................initial pages.........................
          "initial page1 text": "We help you help yourselves",
          "initial page1 subText":
              "Our diaggnosis tool suggests test techniques to deal with mental distness",
          "initial page2 text": "Find the right therapist for you",
          "initial page2 subText":
              "Discover the perfect therapist to guide your mental health journey with our tailored selection",
          "initial page3 text": "Let us lend a hand",
          //.......................Sign in / sign up pages.........................
          "signIn title": "Welcome Back",
          "signIn forgot pass": "Forgot Password?",
          "signIn button": "Login",
          "signIn bottom1": "Don't have an account? ",
          "signIn bottom2": "  Sign Up"
        },
        "ar": {
          //.......................initial pages.........................
          "initial page1 text": "نحن نساعدك في مساعدة نفسك",
          "initial page1 subText":
              "تقترح أداة التشخيص الخاصة بنا تقنيات اختبار للتعامل مع التشتت الذهني",
          "initial page2 text": "اعثر على المعالج النفسي المناسب لك",
          "initial page2 subText":
              "اكتشف المعالج النفسي المثالي لتوجيه رحلتك في مجال الصحة النفسية من خلال مجموعتنا المخصصة",
          "initial page3 text": "دعنا نساعدك",
          //.......................Sign in / sign up pages.........................
          "signIn title": "مرحبا بعودتك",
          "signIn forgot pass": "هل نسيت كلمة المرور؟",
          "signIn button": "تسجيل الدخول",
          "signIn bottom1": "ليس لديك حساب؟",
          "signIn bottom2": "  إنشاء حساب جديد"
        },
      };
}
