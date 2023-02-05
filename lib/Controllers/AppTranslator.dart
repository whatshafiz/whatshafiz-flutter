import 'package:get/get.dart';

class TranslationKeys {
  static String youalreadyregistered = "youalreadyregistered";
  static String baninform = "baninform";
  static String ulkekodu = "nationcode";
  static String ulke = "ulke";
  static String tamam = "tamam";
  static String bayan = "bayan";
  static String kaydet = "kaydet";
  static String bay = "bay";
  static String sehiradigiriniz = "sehiradigiriniz";
  static String universiteadigiriniz = "universiteadigiriniz";
  static String fakulteadigiriniz = "fakulteadigiriniz";
  static String bolumadigiriniz = "bolumadigiriniz";
  static String profile = "profile";
  static String bolum = "bolum";
  static String bolumseciniz = "bolumseciniz";
  static String universite = "universite";
  static String universiteseciniz = "universiteseciniz";
  static String fakulte = "fakulte";
  static String fakulteseciniz = "fakulteseciniz";
  static String ulkeseciniz = "ulkeseciniz";
  static String sehir = "sehir";
  static String sehirseciniz = "sehir";
  static String ileri = "ileri";
  static String adinizigiriniz = "adinizigiriniz";
  static String soyadinizigiriniz = "soyadinizigiriniz";
  static String emailgiriniz = "emailgiriniz";
  static String veribosveyaeksik = "veribosveyaeksik";
  static String kodgirilmedi = "kodgirilmedi";
  static String kodutekrargonder = "kodutekrargonder";
  static String sifredegistir = "sifredegistir";
  static String parolahatali = "parolahatali";
  static String parolatekrari = "parolatekrari";
  static String parolatekrarihatali = "parolatekrarihatali";
  static String seciniz = "seciniz";
  static String onayla = "onayla";
  static String wpdogrulamakodu = "wpdogrulamakodu"; //
  static String vazgec = "vazgec";
  static String sizegonderilenwpmesajismapdegilolarakisaretle =
      "sizegonderilenwpmesajismapdegilolarakisaretle"; //
  static String sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz =
      "sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz";

  static String dogrulamakodu = "dogrulamakodu";
  static String dogrulamakoduhataliveyaeksik = "dogrulamakoduhataliveyaeksik";
  static String telefonnowpuzerindedogrulamakodugonderilecek =
      "telefonnowpuzerindedogrulamakodugonderilecek"; //
  static String girisyap = "girisyap";
  static String wpkodugonder = "wpkodugonder";
  static String wpkodudahaoncedogrulanmis = "wpkodudahaoncedogrulanmis";
  static String parolauyusmuyor = "parolauyusmuyor";
  static String telefonnobosolamazveyaeksik = "telefonnobosolamazveyaeksik";

  static String sifremiunuttumkapali = "sifremiunuttumkapali";
  static String sifremiunuttum = "sifremiunuttum";
  static String spandegilolarakisaretle = "spandegilolarakisaretle";
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
          TranslationKeys.dogrulamakoduhataliveyaeksik:
              "Doğrulama kodu boş veya hatalı",
          TranslationKeys.ulkekodu: "Nation Code",
          TranslationKeys.ulke: "Nation",
          TranslationKeys.tamam: "Ok",
          TranslationKeys.bolum: "Bölüm",
          TranslationKeys.profile: "Profil",
          TranslationKeys.bayan: "Bayan",
          TranslationKeys.kaydet: "Save",
          TranslationKeys.bay: "Bay",
          TranslationKeys.sehiradigiriniz: "Şehir adı giriniz",
          TranslationKeys.fakulteadigiriniz: "Fakülte adı giriniz",
          TranslationKeys.bolumadigiriniz: "Bölüm adı giriniz",
          TranslationKeys.universiteadigiriniz: "Üniversite adı giriniz",
          TranslationKeys.bolumseciniz: "Bölüm seçiniz",
          TranslationKeys.universite: "Üniversite",
          TranslationKeys.universiteseciniz: "Üniversite seçiniz",
          TranslationKeys.fakulte: "Fakülte",
          TranslationKeys.fakulteseciniz: "Fakülte seçiniz",
          TranslationKeys.ulkeseciniz: "Select a nation",
          TranslationKeys.sehir: "Şehir",
          TranslationKeys.sehirseciniz: "Şehir seçiniz",
          TranslationKeys.onayla: "Onayla",
          TranslationKeys.veribosveyaeksik: "Boş veya eksik",
          TranslationKeys.wpdogrulamakodu: "WhatsApp doğrulama kodu",
          TranslationKeys.sizegonderilenwpmesajismapdegilolarakisaretle:
              "Size gönderilen whatsapp mesajını spam değil olarak işaretleyip gönderilen kodu giriniz.",
          TranslationKeys.kodgirilmedi: "Kod girilmedi",
          TranslationKeys.kodutekrargonder: "Kodu tekrar gönder",
          TranslationKeys
                  .sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz:
              "Başarıyla şifreniz değiştirildi. Şimdi Girişe yönlendiriliyorsunuz.",
          TranslationKeys.spandegilolarakisaretle:
              "Lütfen gelen mesajı spam değil olarak işaretleyiniz.",
          TranslationKeys.dogrulamakodu: "Doprulama Kodu",
          TranslationKeys.parolatekrari: "Parolanızı tekrar giriniz.",
          TranslationKeys.vazgec: "Cancel",
          TranslationKeys.sifredegistir: "Şifre Değiştir",
          TranslationKeys.parolahatali: "Parola hatalı, en az 5 hane olmalı",
          TranslationKeys.parolatekrarihatali: "Parola tekrarı hatalı.",
          TranslationKeys.wpkodugonder: "Send me whatsapp code",
          TranslationKeys.ileri: "Forward",
          TranslationKeys.adinizigiriniz: "Adınızı giriniz",
          TranslationKeys.soyadinizigiriniz: "Soyadınızı giriniz",
          TranslationKeys.emailgiriniz: "E-Posta giriniz",
          TranslationKeys.telefonnumarasigiriniz: "Enter your phone number",
          TranslationKeys.wpkodudahaoncedogrulanmis:
              "This phone number already validated",
          TranslationKeys.seciniz: "Choose",
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
          TranslationKeys.dogrulamakoduhataliveyaeksik:
              "Doğrulama kodu boş veya hatalı",
          TranslationKeys.tamam: "Tamam",
          TranslationKeys.wpdogrulamakodu: "WhatsApp doğrulama kodu",
          TranslationKeys.sizegonderilenwpmesajismapdegilolarakisaretle:
              "Size gönderilen whatsapp mesajını spam değil olarak işaretleyip gönderilen kodu giriniz.",
          TranslationKeys.onayla: "Onayla",
          TranslationKeys.bayan: "Bayan",
          TranslationKeys.bay: "Bay",
          TranslationKeys.kaydet: "Kaydet",
          TranslationKeys.sehiradigiriniz: "Şehir adı giriniz",
          TranslationKeys.fakulteadigiriniz: "Fakülte adı giriniz",
          TranslationKeys.bolumadigiriniz: "Bölüm adı giriniz",
          TranslationKeys.universiteadigiriniz: "Üniversite adı giriniz",
          TranslationKeys.kodgirilmedi: "Kod girilmedi",
          TranslationKeys.kodutekrargonder: "Kodu tekrar gönder",
          TranslationKeys.sehir: "City",
          TranslationKeys.sehirseciniz: "Şehir seçiniz",
          TranslationKeys.ulke: "Ülke",
          TranslationKeys.bolum: "Bölüm",
          TranslationKeys.profile: "Profil",
          TranslationKeys.bolumseciniz: "Bölüm seçiniz",
          TranslationKeys.universite: "Üniversite",
          TranslationKeys.universiteseciniz: "Üniversite seçiniz",
          TranslationKeys.fakulte: "Fakülte",
          TranslationKeys.fakulteseciniz: "Fakülte seçiniz",
          TranslationKeys.ulkeseciniz: "Ülke seçiniz",
          TranslationKeys.spandegilolarakisaretle:
              "Lütfen gelen mesajı spam değil olarak işaretleyiniz.",
          TranslationKeys.seciniz: "Seçiniz",
          TranslationKeys.dogrulamakodu: "Doprulama Kodu",
          TranslationKeys.sifredegistir: "Şifre Değiştir",
          TranslationKeys.parolatekrari: "Parolanızı tekrar giriniz.",
          TranslationKeys.parolatekrarihatali: "Parola tekrarı hatalı.",
          TranslationKeys.parolahatali: "Parola hatalı, en az 5 hane olmalı",
          TranslationKeys.sifremiunuttum: "Şifremi Unuttum",
          TranslationKeys.telefonnumarasigiriniz: "Telefon numaranızı giriniz",
          TranslationKeys.wpkodugonder: "WhatsApp Kodu Gönder",
          TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek:
              "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
          TranslationKeys.parolagiriniztekrari: "Parolanızı tekrar giriniz",
          TranslationKeys.ileri: "İleri",
          TranslationKeys.wpkodudahaoncedogrulanmis:
              "Telefon No daha önce doğrulanmış",
          TranslationKeys.veribosveyaeksik: "Boş veya eksik",
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
          TranslationKeys.ulkekodu: "Ülke Kodu",
          TranslationKeys
                  .sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz:
              "Başarıyla şifreniz değiştirildi. Şimdi Girişe yönlendiriliyorsunuz.",
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
