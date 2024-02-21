import 'package:get/get.dart';

class Language implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": {
          "page1 text": "We help you help yourselves",
          "page1 subText":
              "Our diaggnosis tool suggests test techniques to deal with mental distness",
          "page2 text": "Find the right therapist for you",
          "page2 subText":
              "Discover the perfect therapist to guide your mental health journey with our tailored selection",
          "page3 text": "Let us lend a hand",
        },
        "ar": {
          "page1 text": "نحن نساعدك في مساعدة نفسك",
          "page1 subText":
              "تقترح أداة التشخيص الخاصة بنا تقنيات اختبار للتعامل مع التشتت الذهني",
          "page2 text": "اعثر على المعالج النفسي المناسب لك",
          "page2 subText":
              "اكتشف المعالج النفسي المثالي لتوجيه رحلتك في مجال الصحة النفسية من خلال مجموعتنا المخصصة",
          "page3 text": "دعنا نساعدك",
        },
      };
}
