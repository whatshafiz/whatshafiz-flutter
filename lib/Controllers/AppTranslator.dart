import 'package:get/get.dart';

class AppTranslator extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "hello": "Hello",
          "youalreadyregistered": "You already registerd! Please sign in.",
          "baninform":
              "Sistem tarafından banlandığınız için sisteme giriş yapamazsınız. Bir yanlışlık olduğunu düşünüyorsanız grup başkanınızla iletişime geçebilirsiniz."
        },
        "tr_TR": {
          "hello": "Merhaba",
          "youalreadyregistered": "Zaten üyesinizi! Lütfen giriş yapınız.",
          "baninform":
              "Sistem tarafından banlandığınız için sisteme giriş yapamazsınız. Bir yanlışlık olduğunu düşünüyorsanız grup başkanınızla iletişime geçebilirsiniz.",
        }
      };
}
