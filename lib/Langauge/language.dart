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
          //.......................Drawer.........................
          "Hello": "Hello",
          "Profile": "Profile",
          "History": "History",
          "Mental Tests": "Mental Tests",
          "Search for doctors": "Search for doctors",
          "Talk with Ai Chatbot": "Talk with Ai Chatbot",
          //.......................Home page.........................
          "Home": "Home",
          "Tests": "Tests",
          "Meditation Sessions": "Meditation Sessions",
          "Stay relaxed": "Stay relaxed",
          "Common Tests": "Common Tests",
          "Our Doctors": "Our Doctors",
          //.......................Emotions.........................
          "Depression": "Depression",
          "Anxiety": "Anxiety",
          "Anger": "Anger",
          "Fear": "Fear",
          "Stress": "Stress",
          //.......................Doctors.........................
          "Search": "Search",
          "Book": "Book",
          //.......................Make appointment.........................
          "Choose The Hour": "Choose The Hour",
          "AM": "AM",
          "PM": "PM",
          "Fee Details": "Fee Details",
          "Messeging": "Messeging",
          "Can messege with therapist.": "Can messege with therapist.",
          "Voice Call": "Voice Call",
          "Can make a voice call with therapist.":
              "Can make a voice call with therapist.",
          "Video Call": "Video Call",
          "Can make a video call with therapist.":
              "Can make a video call with therapist.",
          //.......................Doctor profile.........................
          "Make Appointment": "Make Appointment",
          "About Therapist": "About Therapist",
          "Working Time": "Working Time",

          //.......................Doctor description.........................
          "Shereen El dardery": //1
              "Professor and behavioral science of autism for children and member of the Psychoanalytic Association, Master’s in Philosophy of Education, Ain Shams University",
          "Mohamed Roshdy": //2
              "Consultant Psychiatrist, Fellow of the American Psychiatric Association, Master of Psychiatry and Neurology, Director of Qasr Al-Maadi Mental Health Hospital, Head of the Department of Psychiatry and Neurology at the Police Hospital (formerly), specialist in cognitive-behavioural psychotherapy, specializing in treating personality defects in adolescents and adults.",
          "Remon Qanas": //3
              "At least 14 years of experience in treating psychological and neurological diseases and treating addiction. Treatment includes cognitive behavioural therapy and not just medications. ",
          "Amgad Khairy": //4
              "Professor of Behavioural Sciences at the American University and member of the American Psychiatric Association - Advisor to Caritas for Psychosocial Rehabilitation and Addiction Treatment, Psychological Guidance and Family Counselling Unit, and Member of the American Psychiatric Association",
          "Hossam imara": //5
              "He graduated from Ain Shams Medicine in 2002, and holds a Master’s degree in Psychiatry and Neurology from Ain Shams Medicine. He is registered with the Egyptian Fellowship of Psychiatry and specializes in treating all psychological disorders for adults and children and treating all types of addictions, as well as a distinguished clinic for marital and family counselling.",
          "Gamel Sobhy": //6
              "Consultation for psychological and neurological diseases, treatment of children’s psychological diseases, psychological, emotional and family counselling, treatment of addiction and childhood disease problems.",
          "Naser El maghreby": //7
              "A graduate of Ain Shams University, he holds a fellowship from the Royal College of Psychiatrists in England and a master’s degree in psychiatry and neurology from Ain Shams. He worked in the United Kingdom for 4 years as a former consultant in the therapeutic institution, health insurance, the railway authority, and Egypt Air. Long experience in treating all psychological disorders. Former Director of the Military Psychiatric Hospital",
          //.......................Work hours.........................
          "from": "from",
          "to": "to",
          "Sat": "Saturday",
          "Sun": "Sunday",
          "Mon": "Monday",
          "Tue": "Tuesday",
          "Wed": "Wednesday",
          "Thu": "Thursday",
          "Fri": "Friday",
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
          "signUp bottom2": "  تسجيل الدخول",
          //.......................Drawer.........................
          "Hello": "مرحبا",
          "Profile": "الملف الشخصي",
          "History": "السجل",
          "Mental Tests": "الاختبارات النفسية",
          "Search for doctors": "البحث عن أطباء",
          "Talk with Ai Chatbot": "التحدث مع روبوت الدردشة",
          //.......................Home page.........................
          "Home": "الصفحة الرئيسية",
          "Tests": "الاختبارات",
          "Meditation Sessions": "جلسات التأمل",
          "Stay relaxed": "ابق مسترخياً",
          "Common Tests": "الاختبارات الشائعة",
          "Our Doctors": "أطباؤنا",
          //.......................Emotions.........................
          "Depression": "الاكتئاب",
          "Anxiety": "القلق/الاضطراب",
          "Anger": "الغضب",
          "Fear": "الخوف",
          "Stress": "الضغط/التوتر",
          //.......................Doctors.........................
          "Search": "بحث",
          "Book": "حجز",
          //.......................Make appointment.........................
          "Choose The Hour": "اختر الساعة",
          "AM": "ص",
          "PM": "م",
          "Fee Details": "تفاصيل الرسوم",
          "Messeging": "التراسل",
          "Can messege with therapist.": " يمكنك المراسله مع المعالج النفسي.",
          "Voice Call": "مكالمة صوتية",
          "Can make a voice call with therapist.":
              " يمكنك إجراء مكالمة صوتية مع المعالج النفسي.",
          "Video Call": "مكالمة فيديو",
          "Can make a video call with therapist.":
              "يمكنك التحدث عبر الفيديو مع المعالج النفسي.",
          //.......................Doctor profile.........................
          "Make Appointment": "احجز موعد",
          "About Therapist": "معلومات عن المعالج",
          "Working Time": "مواعيد العمل",
          //.......................Doctor description.........................
          "Shereen El dardery": //1
              "أستاذة في علم سلوكيات التوحد لدى الأطفال وعضوة بجمعية التحليل النفسي، ماجستير في فلسفة .التربية، جامعة عين شمس",
          "Mohamed Roshdy": //2
              "استشاري الطب النفسي، زميل بالجمعية الأمريكية للطب النفسي، ماجستير في الطب النفسي والأعصاب، مدير مستشفى قصر المعادي للصحة النفسية، رئيس قسم الطب النفسي والعصبي بمستشفى الشرطة (سابقا)، أخصائي العلاج النفسي المعرفي السلوكي، متخصص في علاج عيوب الشخصية لدى المراهقين والبالغين.",
          "Remon Qanas": //3
              "خبرة لا تقل عن 14 سنة في علاج الأمراض النفسية والعصبية وعلاج الإدمان. العلاج يشمل العلاج السلوكي المعرفي وليس الأدوية فقط.",
          "Amgad Khairy": //4
              "أستاذ العلوم السلوكية بالجامعة الأمريكية وعضو بالجمعية الأمريكية للطب النفسي - مستشار كاريتاس للتأهيل النفسي الاجتماعي وعلاج الإدمان ووحدة الإرشاد النفسي والإرشاد الأسري، وعضو بالجمعية الأمريكية للطب النفسي",
          "Hossam imara": //5
              "تخرج من طب عين شمس عام 2002 وحاصل على درجة الماجستير في الطب النفسي والأعصاب من طب عين شمس ومسجل بالزمالة المصرية للطب النفسي ويتخصص في علاج كافة الاضطرابات النفسية للكبار والصغار وعلاج جميع أنواع الإدمان بالإضافة إلى عيادة متميزة للإستشارات الزوجية والأسرية.",
          "Gamel Sobhy": //6
              "استشارات الأمراض النفسية والعصبية، علاج الأمراض النفسية للأطفال، استشارات نفسية وعاطفية وأسرية، علاج الإدمان ومشاكل أمراض الطفولة.",
          "Naser El maghreby": //7
              "خريج جامعة عين شمس وحاصل على زمالة الكلية الملكية للأطباء النفسيين بإنجلترا ودرجة الماجستير في الطب النفسي والأعصاب من عين شمس. عمل في المملكة المتحدة لمدة 4 سنوات كاستشاري سابق بالمؤسسة العلاجية، التأمين الصحي وهيئة السكك الحديدية ومصر للطيران. خبرة طويلة في علاج كافة الاضطرابات النفسية. مدير مستشفى الطب النفسي العسكري سابقا",
          //.......................Work hours.........................
          "from": "من",
          "to": "إلى",
          "Sat": "السبت",
          "Sun": "الأحد",
          "Mon": "الإثنين",
          "Tue": "الثلاثاء",
          "Wed": "الأربعاء",
          "Thu": "الخميس",
          "Fri": "الجمعة",
        },
      };
}
