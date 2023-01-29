import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/LoginController.dart';
import '../Helper/AppRoutes.dart';
import '../Models/CodeUpdateModel.dart';
import '../Services/ClientService.dart';
import '../constants/Util.dart';

import '../constants/Constants.dart';

class CodeWithNewPassword extends StatefulWidget {
  const CodeWithNewPassword({Key? key}) : super(key: key);

  @override
  State<CodeWithNewPassword> createState() => _CodeWithNewPasswordState();
}

class _CodeWithNewPasswordState extends State<CodeWithNewPassword> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController codeEditController = TextEditingController();
  TextEditingController pswEditController = TextEditingController();
  TextEditingController pswRetypeEditController = TextEditingController();
  String? phoneNumber;

  @override
  initState() {
    super.initState();

    if (Get.arguments != null) {
      final phoneNum = Get.arguments["token"];
      setState(() {
        this.phoneNumber = phoneNum;
      });
    }
  }

  registerToApp() async {
    if (formKey.currentState == null) return;
    if (formKey.currentState!.validate()) {
      String code = codeEditController.text;
      String psw = pswEditController.text;
      String pswRetype = pswRetypeEditController.text;
      if (psw == pswRetype) {
        var map = {
          "verification_code": code,
          "password": psw,
          "password_confirmation": pswRetype,
          "phone_number": phoneNumber
        };

        var response = await ClientService()
            .PostMeApplicationJSonWithAccept(UPDATEPASSWORDRUL, map);
        if (response != null) {
          final codeModel = CodeUpdateModel.fromJson(response);
          print("===> ${response}");
          if (codeModel.errors == null) {
            if (codeModel.message ==
                "Kod hatalı veya süresi dolmuş, lütfen tekrar deneyin.") {
              informUser(context, "", codeModel.message!);
              return;
            }
            askUser(context, "",
                "Başarıyla şifreniz değiştirildi. Şimdi Girişe yönlendiriliyorsunuz.",
                () {
              Get.toNamed(AppRoutes.HOME);
            });
          } else {
            informUser(context, "", codeModel.message!);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.15,
        leadingWidth: 100,
        backgroundColor: Colors.black,
        title: Text(
          "WhatHafız .",
          style: GoogleFonts.poppins().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontStyle: FontStyle.normal),
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
          width: size.width,
          color: Colors.black,
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Text(
                    "Lütfen gelen mesajı spam değil olarak işaretleyiniz.",
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 14, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: codeEditController,
                    decoration: const InputDecoration(
                        labelText: "doğrulama kodu",
                        hintText: "doğrulama kodu"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: pswEditController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Parola", hintText: "Parola giriniz."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: pswRetypeEditController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: "Parola tekrarı",
                        hintText: "Parolanızı tekrar giriniz."),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: registerToApp,
                    child: Text(
                      "Şifre Değiştir",
                      style: GoogleFonts.poppins()
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
