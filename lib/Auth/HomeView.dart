import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Controllers/HomeController.dart';
import 'package:whatshafiz/Controllers/AppTranslator.dart';
import '../Models/Countries.dart';
import '../authscreens/Home.dart';
import '../constants/Constants.dart';

class HomeView extends GetWidget<HomeController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context = context;
    Size size = getWindowSize(context);

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.15,
          leadingWidth: 100,
          backgroundColor: Colors.black87,
          title: Text(
            "WhatHafız .",
            style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontStyle: FontStyle.normal),
          ),
          leading: Center(
            child: InkWell(
                onTap: () {
                  if (controller.showPasswordFields) {
                    controller.resetForm();
                  }
                },
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: size.width * 0.7,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(width: 1, color: Colors.black54),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: !controller.showPasswordFields,
                            child: DropdownSearch<Countries>(
                              popupProps: const PopupProps.menu(
                                showSelectedItems: false,
                                showSearchBox: true,
                              ),
                              items: controller.counties,
                              itemAsString: (item) =>
                                  "(+${item.phoneCode}) ${item.name}",
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  labelText: TranslationKeys.ulkekodu.tr,
                                  hintText:
                                      TranslationKeys.telefonkoduseciniz.tr,
                                ),
                              ),
                              onChanged: (item) {
                                controller.selectedCountryPhoneCode =
                                    item?.phoneCode;
                              },
                              selectedItem: controller.counties.first,
                            ),
                          ),
                          Visibility(
                            visible: !controller.showPasswordFields,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: TextFormField(
                                validator: (txt) {
                                  if (txt == null) return null;
                                  if (txt.length < 4) {
                                    return TranslationKeys
                                        .telefonnohataliveyaeksik.tr;
                                  }
                                  return null;
                                },
                                onSaved: (txt) {
                                  if (txt != null) {
                                    controller.phoneNumber = txt!;
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText:
                                      TranslationKeys.telefonnumarasigiriniz.tr,
                                  hintText: TranslationKeys
                                      .telefonnoalankoduolmadangiriniz.tr,
                                  labelStyle: const TextStyle(color: Colors.white),
                                ),
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          !controller.firstLogin
                              ? Visibility(
                                  visible: controller.showPasswordFields,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: TextFormField(
                                          validator: (t) => validatePsw(t),
                                          onSaved: (t) {
                                            controller.password = t!;
                                          },
                                          obscureText: true,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: TranslationKeys
                                                .parolagiriniz.tr,
                                            hintText: TranslationKeys
                                                .parolagiriniz.tr,
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 10, right: 10),
                                          child: controller.forgetIsOpen
                                              ? TextButton(
                                                  onPressed: () =>
                                                      controller.wpMsgSend(),
                                                  child: Text(
                                                    TranslationKeys
                                                        .sifremiunuttum.tr,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily),
                                                  ),
                                                )
                                              : Text(
                                                  TranslationKeys
                                                      .sifremiunuttumkapali.tr,
                                                  style: GoogleFonts.poppins()
                                                      .copyWith(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Visibility(
                                  visible: controller.showPasswordFields,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: TextFormField(
                                          validator: (t) => validatePsw(t),
                                          onSaved: (t) {
                                            controller.password = t!;
                                          },
                                          obscureText: true,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: TranslationKeys
                                                .parolagiriniz.tr,
                                            hintText: TranslationKeys
                                                .parolagiriniz.tr,
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: TextFormField(
                                          validator: (t) => validatePsw(t),
                                          onSaved: (t) {
                                            controller.passwordConfirmation =
                                                t!;
                                          },
                                          obscureText: true,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: TranslationKeys
                                                .parolagiriniztekrari.tr,
                                            hintText: TranslationKeys
                                                .parolagiriniztekrari.tr,
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 10, right: 10),
                                          child: controller.forgetIsOpen
                                              ? TextButton(
                                                  onPressed: () =>
                                                      controller.wpMsgSend(),
                                                  child: Text(
                                                    TranslationKeys
                                                        .sifremiunuttum.tr,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily),
                                                  ),
                                                )
                                              : Visibility(
                                                  visible:
                                                      !controller.firstLogin,
                                                  child: Text(
                                                    TranslationKeys
                                                        .sifremiunuttumkapali
                                                        .tr,
                                                    style: GoogleFonts.poppins()
                                                        .copyWith(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                onPressed: () async {
                                  if (controller.showPasswordFields &&
                                      !controller.firstLogin) {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      controller
                                          .loginWithPswAndPhone(); //login yapılıyor.
                                    }
                                  } else if (controller.firstLogin) {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      controller.registerToApp();
                                    }
                                  } else {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      controller.userCheck();
                                    }
                                  }
                                },
                                child: Text(
                                  !controller.showPasswordFields
                                      ? TranslationKeys.ileri.tr
                                      : TranslationKeys.girisyap.tr,
                                  style: GoogleFonts.poppins().copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Helper/AppRoutes.dart';

import '../Controllers/LoginController.dart';
import '../Models/Countries.dart';
import '../Models/Country.dart';
import '../Models/ProfileModel.dart';
import '../Models/RegisterCheckModel.dart';
import '../Models/SettingsModel.dart';
import '../Models/UserCheckModel.dart';
import '../Models/WpSendCodeModel.dart';
import '../Services/ClientService.dart';
import '../authscreens/Home.dart';
import '../constants/Constants.dart';
import '../constants/Util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  LoginController? loginController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pswKey = GlobalKey();
  bool showPasswordFields = false;
  bool forgetIsOpen = false;
  bool firstLogin = false;
  String currentPhoneNum = "";
  String? selectedCountryPhoneCode = "";

  TextEditingController phoneNumText = TextEditingController();
  TextEditingController pswText = TextEditingController();
  TextEditingController firstLoginPswText = TextEditingController();
  TextEditingController firstLoginPswRetypeText = TextEditingController();
  TextEditingController pswAgainText = TextEditingController();
  List<Countries> counties = [
    Countries(id: 0, iso: "iseo", name: "Seçiniz", phoneCode: "...")
  ];

  getCountryCodes() async {
    var result = await ClientService().GetMe(COUNTRYCODEURL, EmptyMap);
    var countryWithCodes = Country.fromJson(result);

    if (countryWithCodes.countries != null) {
      counties.removeAt(0);
      setState(() {
        counties.addAll(countryWithCodes.countries!);
        selectedCountryPhoneCode = counties.first.phoneCode;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController = Get.find<LoginController>();
    getCountryCodes();
  }

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.15,
        leadingWidth: 100,
        backgroundColor: Colors.black87,
        title: Text(
          "WhatHafız .",
          style: GoogleFonts.poppins().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontStyle: FontStyle.normal),
        ),
        leading: Center(
          child: InkWell(
              onTap: () {
                if (showPasswordFields) {
                  setState(() {
                    showPasswordFields = false;
                  });
                }
              },
              child: const Icon(Icons.arrow_back)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: size.width * 0.5,
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  border: Border.all(width: 1, color: Colors.black54),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: !showPasswordFields,
                          child: DropdownSearch<Countries>(
                            popupProps: const PopupProps.menu(
                              showSelectedItems: false,
                              showSearchBox: true,
                            ),
                            items: counties,
                            itemAsString: (item) =>
                                "(+${item.phoneCode}) ${item.name}",
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Ülke Kodu",
                                hintText:
                                    "Ülkenize ait telefon kodunu seçiniz...",
                              ),
                            ),
                            onChanged: (item) => setState(() {
                              selectedCountryPhoneCode = item?.phoneCode;
                            }),
                            selectedItem: counties.first,
                          ),
                        ),
                        Visibility(
                          visible: !showPasswordFields,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            child: TextField(
                              controller: phoneNumText,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                labelText: "Telefon numaranızı giriniz.",
                                hintText:
                                    "Telefon numarası alan kodu olmadan giriniz.",
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        !firstLogin
                            ? Visibility(
                                visible: showPasswordFields,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 10, right: 10),
                                      child: TextFormField(
                                        validator: (t) => validatePsw(t),
                                        controller: pswText,
                                        obscureText: true,
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                          labelText: "Parola giriniz.",
                                          hintText: "Bir parola giriniz.",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: forgetIsOpen
                                            ? TextButton(
                                                onPressed: wpMsgSend,
                                                child: Text(
                                                  "Şifremi Unuttum",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.blue,
                                                      fontFamily:
                                                          GoogleFonts.poppins()
                                                              .fontFamily),
                                                ),
                                              )
                                            : Text(
                                                "Şifremi unuttum hizmeti kısa süre için kapalıdır.",
                                                style: GoogleFonts.poppins()
                                                    .copyWith(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Visibility(
                                visible: showPasswordFields,
                                child: Form(
                                  key: pswKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: TextFormField(
                                          validator: (t) => validatePsw(t),
                                          controller: firstLoginPswText,
                                          obscureText: true,
                                          keyboardType: TextInputType.phone,
                                          decoration: const InputDecoration(
                                            labelText: "Parola giriniz.",
                                            hintText: "Bir parola giriniz.",
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10, right: 10),
                                        child: TextFormField(
                                          validator: (t) => validatePsw(t),
                                          controller: firstLoginPswRetypeText,
                                          obscureText: true,
                                          keyboardType: TextInputType.phone,
                                          decoration: const InputDecoration(
                                            labelText:
                                                "Parola tekrarı giriniz.",
                                            hintText: "Parola tekrarı giriniz.",
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 10, right: 10),
                                          child: forgetIsOpen
                                              ? TextButton(
                                                  onPressed: () => wpMsgSend(),
                                                  child: Text(
                                                    "Şifremi Unuttum",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.blue,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily),
                                                  ),
                                                )
                                              : Visibility(
                                                  visible: !firstLogin,
                                                  child: Text(
                                                    "Şifremi unuttum hizmeti kısa süre için kapalıdır.",
                                                    style: GoogleFonts.poppins()
                                                        .copyWith(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue),
                              onPressed: () async {
                                if (showPasswordFields && !firstLogin) {
                                  setPasswordForMe();
                                } else if (firstLogin) {
                                  loginToApp();
                                } else {
                                  userCheck();
                                }
                              },
                              child: Text(
                                !showPasswordFields ? "İleri" : "Giriş Yap",
                                style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  validatePhone(String? text) {
    if (text == null) return null;
    if (text.length < 6 && text.isNotEmpty) return "Telefon boş veya geçersiz!";
    return null;
  }

  void checkSettings(String? token, BuildContext context) async {
    if (token != null) {
      final clientService = ClientService();
      var responseSettings =
          await clientService.getWithToken(SETTINGSURL, token, EmptyMap);

      if (responseSettings != null) {
        var response = SettingsModel.fromJson(responseSettings);
        if (response.settings!.isNotEmpty) {
          final model = response.settings!.first;
          final isWpEnabled = model.value == "1";
          if (isWpEnabled) {
            setState(() {
              showPasswordFields = true;
              forgetIsOpen = true;
            });
          } else {}
        }
      }
    }
  }

  getProfile(String token) async {
    var clientService = ClientService();
    final responseProfile =
        await clientService.getWithToken(PROFILEURL, token, {});
    print("client response profile  $responseProfile");
    if (responseProfile != null) {
      final profileResponse = ProfileModel.fromJson(responseProfile);
      if (profileResponse.user != null) {
        if (profileResponse.user!.phoneNumberVerifiedAt == null) {
          await yesNoDialog(
              context,
              "",
              "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
              "WhatsApp Kody Gönder",
              "Vazgeç",
              () => sendCodeAuth(token));
        } else {
          //Get.toNamed(LANDING);
          //loginController?.userModel.value.isSigned=true;
          loginController?.LoggedInd = true;
        }
      }
    }
  }

  void setPasswordForMe() async {
    final psw = pswText.text;
    if (psw.isNotEmpty) {
      var map = {
        "phone_number": currentPhoneNum,
        "password": psw,
      };

      final response =
          await ClientService().PostMeApplicationJSon(LOGINURL, map);
      final responseModel = RegisterCheckModel.fromJson(response);

      if (responseModel.token != null) {
        LoginController.Shared.SetToken = responseModel.token!;
        print(responseModel.token);
      }
    }
  }

  void userCheck() async {
    if (_formKey.currentState == null) return;
    if (!_formKey.currentState!.validate()) return;
    String? code = selectedCountryPhoneCode;
    String? phoneNum = phoneNumText.text.removeAllWhitespace;
    if (code != null) {
      if (code.isNotEmpty && phoneNum.isNotEmpty) {
        final num = "$code$phoneNum";
        setState(() {
          currentPhoneNum = num;
        });

        final map = {"phone_number": num};
        final check =
            await ClientService().PostMeApplicationJSon(CHECKURL, map);
        final responseModel = UserCheckModel.fromJson(check);
        print("===> ${responseModel.isBanned} ${responseModel.isRegistered}");
        if (responseModel.isBanned!) {
          await informUser(context, "", "baninform".tr);
        } else if (responseModel.isRegistered!) {
          print("is registeed");
          const tmpToken = "158|2fN1fBCNlkRkd7SP9HGcD7t39oyF0eOmJqqqMYiP";
          checkSettings(tmpToken, context);
        } else {
          setState(() {
            showPasswordFields = true;
            forgetIsOpen = false;
            firstLogin = true;
          });
        }
      }
    }
  }

  void wpMsgSend() async {
    String? code = selectedCountryPhoneCode;
    String? phoneNum = phoneNumText.text.removeAllWhitespace;
    final num = "$code$phoneNum";
    await yesNoDialog(
        context,
        "",
        "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
        "WhatsApp Kodu Gönder",
        "Vazgeç",
        () => sendCodeAndGotoNewPsw(num));
  }

  void settingCheck(String? token, BuildContext context) async {
    if (token != null) {
      final clientService = ClientService();
      var responseSettings =
          await clientService.getWithToken(SETTINGSURL, token, {});

      if (responseSettings != null) {
        var response = SettingsModel.fromJson(responseSettings);
        if (response.settings!.isNotEmpty) {
          final model = response.settings!.first;
          final isWpEnabled = model.value == "1";
          if (isWpEnabled) {
            await yesNoDialog(
                context,
                "",
                "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
                "WhatsApp Kodu Gönder",
                "Vazgeç",
                () => sendCodeAuth(token));
          } else {
            loginController?.SetToken = token; //login tamamdır
          }
        }
      }
    }
  }

  void loginToApp() async {
    if (pswKey.currentState == null) {
      print("key not init");
      return;
    }
    if (!pswKey.currentState!.validate()) {
      print("not validated");
      return;
    }
    print("loginToApp");
    var psw = firstLoginPswText.text;

    var pswReType = firstLoginPswRetypeText.text;
    if (psw != psw && pswReType.isNotEmpty) {
      informUser(context, "", "Parolalar uyuşmamaktadır");
      return;
    }
    if (psw.isNotEmpty && currentPhoneNum.isNotEmpty) {
      final val = {
        "phone_number": currentPhoneNum,
        "password": psw,
        "password_confirmation": pswReType
      };
      final client = ClientService();
      var res = await client.PostMeApplicationJSon(REGISTERURL, val);
      var loginResponse = RegisterCheckModel.fromJson(res);
      print("register response $loginController");
      if (loginResponse.token != null) {
        if (loginResponse.token!.isNotEmpty) {
          settingCheck(loginResponse.token, context);
        }
      }
    }
  }

  sendCodeAndGotoNewPsw(String phoneNum) async {
    var map = {"phone_number": phoneNum};
    var client =
        await ClientService().PostMeApplicationJSon(FORGETPASSWORDURL, map);
    if (client != null) {
      print("client response $client");
      final wpMsg = WpSendCodeModel.fromJson(client);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          if (wpMsg.message! == "Telefon No daha önce doğrulanmış") {
            informUser(context, "", wpMsg.message!);
          } else {
            Get.toNamed(AppRoutes.CODEANDPSW, arguments: {"token": phoneNum});
          }
        }
      }
    }
  }

  sendCodeAuth(String token) async {
    var client = await ClientService().PostWithToken(WPCODESEND, token, {});
    if (client != null) {
      final wpMsg = WpSendCodeModel.fromJson(client);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          Get.toNamed(AppRoutes.CODEAUTH, arguments: {"token": token});
        }
      }
    }
  }
}

 */
