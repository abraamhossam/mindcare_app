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
          //............................................................
          "Name": "Name",
          "Name hint": "Enter Your Name",
          "Email": "Email",
          "Email hint": "Enter Your Email",
          "Password": "Password",
          "Password hint": "Enter Your Password",
          //.......................Sign in page.........................
          "signIn title": "Welcome Back",
          "signIn forgot pass": "Forgot Password?",
          "signIn button": "Log In",
          "signIn bottom1": "Don't have an account? ",
          "signIn bottom2": "  Sign Up",
          //.......................Reset Password page.........................
          "reset title": "Reset Your Password",
          "reset button": "Reset Password",
          //.......................Sign up page.........................
          "signUp title": "Welcome To Your Private Area",
          "signUp button": "Sign Up",
          "signUp bottom1": "Already Have An Account?",
          "signUp bottom2": "  Log In",
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
          //............................................................
          "Name": "الاسم",
          "Name hint": "ادخل الاسم",
          "Email": "البريد الإلكتروني",
          "Email hint": "ادخل بريدك الإلكتروني",
          "Password": "كلمة المرور",
          "Password hint": "ادخل كلمة المرور",
          //.......................Sign in page.........................
          "signIn title": "مرحبا بعودتك",
          "signIn forgot pass": "هل نسيت كلمة المرور؟",
          "signIn button": "تسجيل الدخول",
          "signIn bottom1": "ليس لديك حساب؟",
          "signIn bottom2": "  إنشاء حساب جديد",
          //.......................Reset Password page.........................
          "reset title": "أعد تعيين كلمة المرور",
          "reset button": "أعد التعيين",
          //.......................Sign up page.........................
          "signUp title": "مرحبًا بك في مساحتك الخاصة",
          "signUp button": "تسجيل",
          "signUp bottom1": "لديك حساب بالفعل؟",
          "signUp bottom2": "  تسجيل الدخول"
        },
      };
}
