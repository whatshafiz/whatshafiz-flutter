import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx/webviewx.dart';
import 'package:whatshafiz/Components/MAppBar.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';
import 'package:whatshafiz/Models/ProfileModel.dart';
import 'package:whatshafiz/Models/SettingsModel.dart';
import 'package:whatshafiz/Models/WpSendCodeModel.dart';
import 'package:whatshafiz/Services/ClientService.dart';
import 'package:whatshafiz/authscreens/BaseWidget.dart';
import 'package:whatshafiz/constants/Constants.dart';
import 'package:whatshafiz/constants/Util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with BaseWidget {
  LoginController? loginController;
  late WebViewXController webviewController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late List<String> pageContent;
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  getSss() {
    webviewController.loadContent(WEBURL, SourceType.url);
  }

  @override
  getWhatsArapModel() async {
    var wp = await ClientService().getWhatsArapModel();
    webviewController.loadContent(
        wp.text!.replaceAll("\n", "<br/>"), SourceType.html);
  }

  @override
  getBizKimiz() async {
    var wp = await ClientService().getWhatsArapModel();
    webviewController.loadContent(
        wp.text!.replaceAll("\n", "<br/>"), SourceType.html);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController = Get.find<LoginController>();
    getWhatsArapModel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    return Scaffold(
      appBar: MAppBar(menuSelected: MenuSelected),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              WebViewX(
                width: size.width * 0.4,
                height: size.height,
                initialSourceType: SourceType.html,
                onWebViewCreated: (controller) =>
                    webviewController = controller,
                initialContent: '<h2> Whats Hafız . </h2>',
              ),
              Container(
                width: size.width * 0.5,
                height: size.height * 0.6,
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
                      children: [
                        Text(
                          "WhatsHafiz Giriş",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            validator: (txt) => validatePsw(txt),
                            controller: phoneTextController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Telefon numaranızı giriniz.",
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.red,
                                ),
                                labelText: 'Telefon numaranızı giriniz.',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            validator: (txt) => validatePhone(txt),
                            controller: passwordTextController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Telefon numaranızı giriniz.",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.red,
                                ),
                                labelText: 'Lütfen telefon numaranızı giriniz.',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(FORGETPSW);
                              },
                              child: Text(
                                "Şifremi Unuttum",
                                style: GoogleFonts.poppins()
                                    .copyWith(fontSize: 14, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return Colors.blue.withOpacity(0.04);
                                    }
                                    if (states
                                            .contains(MaterialState.focused) ||
                                        states
                                            .contains(MaterialState.pressed)) {
                                      return Colors.blue.withOpacity(0.12);
                                    }
                                    return null; // Defer to the widget's default.
                                  },
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState == null) return;
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                var phoneNum = phoneTextController.text;
                                var psw = passwordTextController.text;
                                if (phoneNum.isNotEmpty && psw.isNotEmpty) {
                                  final val = {
                                    "phone_number": phoneNum,
                                    "password": psw
                                  };
                                  var res =
                                      await loginController?.loginUser(val);
                                  if (res?.token != null) {
                                    checkSettings(res?.token, context);
                                  }
                                }
                              },
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily),
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
      loginController?.SetToken = token;
      final clientService = ClientService();
      var responseSettings =
          await clientService.getWithToken(SETTINGSURL, token!, {});

      if (responseSettings != null) {
        var response = SettingsModel.fromJson(responseSettings);
        if (response.settings!.isNotEmpty) {
          final model = response.settings!.first;
          final isWpEnabled = model.value == "1";

          print("==> resquesting to profile");
          final responseProfile =
              await clientService.getWithToken(PROFILEURL, token!, {});
          print("client response ${responseProfile}");
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
                    () => sendCodeAuth(token!));
              } else {
                //Get.toNamed(LANDING);
                //loginController?.userModel.value.isSigned=true;
                loginController?.LoggedInd = true;
              }
            }
          }
        }
      }
    }
  }

  sendCodeAuth(String token) async {
    print("send code ${token}");
    var client = await ClientService().PostWithToken(WPCODESEND, token, {});
    if (client != null) {
      print("send code ${client}");
      final wpMsg = WpSendCodeModel.fromJson(client);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          Get.toNamed(CODEAUTH);
        }
      }
    }
  }
}

validatePsw(String? text) {
  if (text == null) return null;
  if (text.length < 5 && text.isNotEmpty) return "Şifre boş veya geçersiz!";
  return null;
}
