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
              "Do??rulama kodu bo?? veya hatal??",
          TranslationKeys.ulkekodu: "Nation Code",
          TranslationKeys.ulke: "Nation",
          TranslationKeys.tamam: "Ok",
          TranslationKeys.bolum: "B??l??m",
          TranslationKeys.profile: "Profil",
          TranslationKeys.bayan: "Bayan",
          TranslationKeys.kaydet: "Save",
          TranslationKeys.bay: "Bay",
          TranslationKeys.sehiradigiriniz: "??ehir ad?? giriniz",
          TranslationKeys.fakulteadigiriniz: "Fak??lte ad?? giriniz",
          TranslationKeys.bolumadigiriniz: "B??l??m ad?? giriniz",
          TranslationKeys.universiteadigiriniz: "??niversite ad?? giriniz",
          TranslationKeys.bolumseciniz: "B??l??m se??iniz",
          TranslationKeys.universite: "??niversite",
          TranslationKeys.universiteseciniz: "??niversite se??iniz",
          TranslationKeys.fakulte: "Fak??lte",
          TranslationKeys.fakulteseciniz: "Fak??lte se??iniz",
          TranslationKeys.ulkeseciniz: "Select a nation",
          TranslationKeys.sehir: "??ehir",
          TranslationKeys.sehirseciniz: "??ehir se??iniz",
          TranslationKeys.onayla: "Onayla",
          TranslationKeys.veribosveyaeksik: "Bo?? veya eksik",
          TranslationKeys.wpdogrulamakodu: "WhatsApp do??rulama kodu",
          TranslationKeys.sizegonderilenwpmesajismapdegilolarakisaretle:
              "Size g??nderilen whatsapp mesaj??n?? spam de??il olarak i??aretleyip g??nderilen kodu giriniz.",
          TranslationKeys.kodgirilmedi: "Kod girilmedi",
          TranslationKeys.kodutekrargonder: "Kodu tekrar g??nder",
          TranslationKeys
                  .sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz:
              "Ba??ar??yla ??ifreniz de??i??tirildi. ??imdi Giri??e y??nlendiriliyorsunuz.",
          TranslationKeys.spandegilolarakisaretle:
              "L??tfen gelen mesaj?? spam de??il olarak i??aretleyiniz.",
          TranslationKeys.dogrulamakodu: "Doprulama Kodu",
          TranslationKeys.parolatekrari: "Parolan??z?? tekrar giriniz.",
          TranslationKeys.vazgec: "Cancel",
          TranslationKeys.sifredegistir: "??ifre De??i??tir",
          TranslationKeys.parolahatali: "Parola hatal??, en az 5 hane olmal??",
          TranslationKeys.parolatekrarihatali: "Parola tekrar?? hatal??.",
          TranslationKeys.wpkodugonder: "Send me whatsapp code",
          TranslationKeys.ileri: "Forward",
          TranslationKeys.adinizigiriniz: "Ad??n??z?? giriniz",
          TranslationKeys.soyadinizigiriniz: "Soyad??n??z?? giriniz",
          TranslationKeys.emailgiriniz: "E-Posta giriniz",
          TranslationKeys.telefonnumarasigiriniz: "Enter your phone number",
          TranslationKeys.wpkodudahaoncedogrulanmis:
              "This phone number already validated",
          TranslationKeys.seciniz: "Choose",
          TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek:
              "Telefon numaran??za WhatsApp ??zerinden do??rulama kodu g??nderilecektir.",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon bo?? veya ge??ersiz!",
          TranslationKeys.girisyap: "Giri?? Yap",
          TranslationKeys.parolauyusmuyor: "Parolalar uyu??mamaktad??r",
          TranslationKeys.parolagiriniztekrari: "Parolan??z?? tekrar giriniz",
          TranslationKeys.sifremiunuttumkapali:
              "??ifremi unuttum hizmeti k??sa s??re i??in kapal??d??r.",
          TranslationKeys.sifremiunuttum: "??ifremi Unuttum",
          TranslationKeys.parolagiriniz: "Parola giriniz.",
          TranslationKeys.telefonnoalankoduolmadangiriniz:
              "Telefon numaras?? alan kodu olmadan giriniz.",
          TranslationKeys.telefonkoduseciniz: "Telefon numaran??z?? giriniz.",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon numaras?? hatal?? veya eksik",
          TranslationKeys.telefonkoduseciniz:
              "??lkenize ait telefon kodunu se??iniz...",
          TranslationKeys.baninform:
              "Sistem taraf??ndan banland??????n??z i??in sisteme giri?? yapamazs??n??z. Bir yanl????l??k oldu??unu d??????n??yorsan??z grup ba??kan??n??zla ileti??ime ge??ebilirsiniz."
        },
        "tr_TR": {
          TranslationKeys.parolagiriniz: "Parola giriniz.",
          TranslationKeys.dogrulamakoduhataliveyaeksik:
              "Do??rulama kodu bo?? veya hatal??",
          TranslationKeys.tamam: "Tamam",
          TranslationKeys.wpdogrulamakodu: "WhatsApp do??rulama kodu",
          TranslationKeys.sizegonderilenwpmesajismapdegilolarakisaretle:
              "Size g??nderilen whatsapp mesaj??n?? spam de??il olarak i??aretleyip g??nderilen kodu giriniz.",
          TranslationKeys.onayla: "Onayla",
          TranslationKeys.bayan: "Bayan",
          TranslationKeys.bay: "Bay",
          TranslationKeys.kaydet: "Kaydet",
          TranslationKeys.sehiradigiriniz: "??ehir ad?? giriniz",
          TranslationKeys.fakulteadigiriniz: "Fak??lte ad?? giriniz",
          TranslationKeys.bolumadigiriniz: "B??l??m ad?? giriniz",
          TranslationKeys.universiteadigiriniz: "??niversite ad?? giriniz",
          TranslationKeys.kodgirilmedi: "Kod girilmedi",
          TranslationKeys.kodutekrargonder: "Kodu tekrar g??nder",
          TranslationKeys.sehir: "City",
          TranslationKeys.sehirseciniz: "??ehir se??iniz",
          TranslationKeys.ulke: "??lke",
          TranslationKeys.bolum: "B??l??m",
          TranslationKeys.profile: "Profil",
          TranslationKeys.bolumseciniz: "B??l??m se??iniz",
          TranslationKeys.universite: "??niversite",
          TranslationKeys.universiteseciniz: "??niversite se??iniz",
          TranslationKeys.fakulte: "Fak??lte",
          TranslationKeys.fakulteseciniz: "Fak??lte se??iniz",
          TranslationKeys.ulkeseciniz: "??lke se??iniz",
          TranslationKeys.spandegilolarakisaretle:
              "L??tfen gelen mesaj?? spam de??il olarak i??aretleyiniz.",
          TranslationKeys.seciniz: "Se??iniz",
          TranslationKeys.dogrulamakodu: "Doprulama Kodu",
          TranslationKeys.sifredegistir: "??ifre De??i??tir",
          TranslationKeys.parolatekrari: "Parolan??z?? tekrar giriniz.",
          TranslationKeys.parolatekrarihatali: "Parola tekrar?? hatal??.",
          TranslationKeys.parolahatali: "Parola hatal??, en az 5 hane olmal??",
          TranslationKeys.sifremiunuttum: "??ifremi Unuttum",
          TranslationKeys.telefonnumarasigiriniz: "Telefon numaran??z?? giriniz",
          TranslationKeys.wpkodugonder: "WhatsApp Kodu G??nder",
          TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek:
              "Telefon numaran??za WhatsApp ??zerinden do??rulama kodu g??nderilecektir.",
          TranslationKeys.parolagiriniztekrari: "Parolan??z?? tekrar giriniz",
          TranslationKeys.ileri: "??leri",
          TranslationKeys.wpkodudahaoncedogrulanmis:
              "Telefon No daha ??nce do??rulanm????",
          TranslationKeys.veribosveyaeksik: "Bo?? veya eksik",
          TranslationKeys.parolauyusmuyor: "Parolalar uyu??mamaktad??r",
          TranslationKeys.girisyap: "Giri?? Yap",
          TranslationKeys.vazgec: "Vazge??",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon bo?? veya ge??ersiz! tr",
          TranslationKeys.sifremiunuttumkapali:
              "??ifremi unuttum hizmeti k??sa s??re i??in kapal??d??r.",
          TranslationKeys.telefonnoalankoduolmadangiriniz:
              "Telefon numaras?? alan kodu olmadan giriniz.",
          TranslationKeys.youalreadyregistered:
              "Zaten ??yesinizi! L??tfen giri?? yap??n??z.",
          TranslationKeys.ulkekodu: "??lke Kodu",
          TranslationKeys
                  .sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz:
              "Ba??ar??yla ??ifreniz de??i??tirildi. ??imdi Giri??e y??nlendiriliyorsunuz.",
          TranslationKeys.telefonkoduseciniz: "Telefon numaran??z?? giriniz.",
          TranslationKeys.telefonnohataliveyaeksik:
              "Telefon numaras?? hatal?? veya eksik",
          TranslationKeys.telefonkoduseciniz:
              "??lkenize ait telefon kodunu se??iniz...",
          TranslationKeys.baninform:
              "Sistem taraf??ndan banland??????n??z i??in sisteme giri?? yapamazs??n??z. Bir yanl????l??k oldu??unu d??????n??yorsan??z grup ba??kan??n??zla ileti??ime ge??ebilirsiniz.",
        }
      };
}
