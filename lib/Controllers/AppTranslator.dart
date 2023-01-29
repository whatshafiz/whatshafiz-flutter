import 'package:get/get.dart';

class TranslationKeys {
  static String youalreadyregistered = "youalreadyregistered";
  static String baninform = "baninform";
  static String ulkekodu = "nationcode";
  static String ileri = "ileri";
  static String seciniz = "seciniz";
  static String vazgec = "vazgec";
  static String telefonnowpuzerindedogrulamakodugonderilecek =
      "telefonnowpuzerindedogrulamakodugonderilecek"; //
  static String girisyap = "girisyap";
  static String wpkodugonder = "wpkodugonder";
  static String wpkodudahaoncedogrulanmis = "wpkodudahaoncedogrulanmis";
  static String parolauyusmuyor = "parolauyusmuyor";
  static String telefonnobosolamazveyaeksik = "telefonnobosolamazveyaeksik";

  static String sifremiunuttumkapali = "sifremiunuttumkapali";
  static String sifremiunuttum = "sifremiunuttum";
  static String parolagiriniz = "parolagiriniz";
  static String parolagiriniztekrari = "parolagiriniztekrari";
  static String telefonnoalankoduolmadangiriniz =
      "telefonnoalankoduolmadangiriniz";
  static String telefonnumarasigiriniz = "telefonnumarasigiriniz"; //
  static String telefonnohataliveyaeksik = "telefonnohataliveyaeksik";
  static String telefonkoduseciniz = "telefonkoduseciniz"; //

}

class AppTranslator extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          TranslationKeys.youalreadyregistered:
              "You already registerd! Please sign in.",
          TranslationKeys.ulkekodu: "Ülke Kodu",
          TranslationKeys.vazgec: "Vazgeç",
          TranslationKeys.wpkodugonder: "WhatsApp Kodu Gönder",
          TranslationKeys.ileri: "İleri",
          TranslationKeys.telefonnumarasigiriniz: "Telefon numaranızı giriniz.",
          TranslationKeys.wpkodudahaoncedogrulanmis:
              "Telefon No daha önce doğrulanmış",
          TranslationKeys.seciniz: "Seçiniz",
          TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek:
              "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon boş veya geçersiz!",
          TranslationKeys.girisyap: "Giriş Yap",
          TranslationKeys.parolauyusmuyor: "Parolalar uyuşmamaktadır",
          TranslationKeys.parolagiriniztekrari: "Parolanızı tekrar giriniz",
          TranslationKeys.sifremiunuttumkapali:
              "Şifremi unuttum hizmeti kısa süre için kapalıdır.",
          TranslationKeys.sifremiunuttum: "Şifremi Unuttum",
          TranslationKeys.parolagiriniz: "Parola giriniz.",
          TranslationKeys.telefonnoalankoduolmadangiriniz:
              "Telefon numarası alan kodu olmadan giriniz.",
          TranslationKeys.telefonkoduseciniz: "Telefon numaranızı giriniz.",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon numarası hatalı veya eksik",
          TranslationKeys.telefonkoduseciniz:
              "Ülkenize ait telefon kodunu seçiniz...",
          TranslationKeys.baninform:
              "Sistem tarafından banlandığınız için sisteme giriş yapamazsınız. Bir yanlışlık olduğunu düşünüyorsanız grup başkanınızla iletişime geçebilirsiniz."
        },
        "tr_TR": {
          TranslationKeys.parolagiriniz: "Parola giriniz.",
          TranslationKeys.seciniz: "Seçiniz",
          TranslationKeys.sifremiunuttum: "Şifremi Unuttum",
          TranslationKeys.telefonnumarasigiriniz: "Telefon numaranızı giriniz",
          TranslationKeys.wpkodugonder: "WhatsApp Kodu Gönder",
          TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek:
              "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
          TranslationKeys.parolagiriniztekrari: "Parolanızı tekrar giriniz",
          TranslationKeys.ileri: "İleri",
          TranslationKeys.wpkodudahaoncedogrulanmis:
              "Telefon No daha önce doğrulanmış",
          TranslationKeys.parolauyusmuyor: "Parolalar uyuşmamaktadır",
          TranslationKeys.girisyap: "Giriş Yap",
          TranslationKeys.vazgec: "Vazgeç",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon boş veya geçersiz! tr",
          TranslationKeys.sifremiunuttumkapali:
              "Şifremi unuttum hizmeti kısa süre için kapalıdır.",
          TranslationKeys.telefonnoalankoduolmadangiriniz:
              "Telefon numarası alan kodu olmadan giriniz.",
          TranslationKeys.youalreadyregistered:
              "Zaten üyesinizi! Lütfen giriş yapınız.",
          TranslationKeys.ulkekodu: "Nation Code",
          TranslationKeys.telefonkoduseciniz: "Telefon numaranızı giriniz.",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon numarası hatalı veya eksik",
          TranslationKeys.telefonkoduseciniz:
              "Ülkenize ait telefon kodunu seçiniz...",
          TranslationKeys.baninform:
              "Sistem tarafından banlandığınız için sisteme giriş yapamazsınız. Bir yanlışlık olduğunu düşünüyorsanız grup başkanınızla iletişime geçebilirsiniz.",
        }
      };
}
