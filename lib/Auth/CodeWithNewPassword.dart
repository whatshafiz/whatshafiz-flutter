import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Controllers/AppTranslator.dart';
import 'package:whatshafiz/Controllers/CodeWithNewPasswordController.dart';
import '../constants/Constants.dart';

class CodeWithNewPassword extends StatefulWidget {
  const CodeWithNewPassword({Key? key}) : super(key: key);

  @override
  State<CodeWithNewPassword> createState() => _CodeWithNewPasswordState();
}

class _CodeWithNewPasswordState extends State<CodeWithNewPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CodeWithNewPasswordController controller =
      Get.find<CodeWithNewPasswordController>();

  @override
  initState() {
    super.initState();
    if (Get.arguments != null) {
      final phoneNum = Get.arguments["token"];
      controller.PhoneNumber = phoneNum;
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
                    TranslationKeys.spandegilolarakisaretle.tr,
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 14, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (t) {
                      if (t == null) return null;
                      if (t.isEmpty || t.length < 4)
                        return TranslationKeys.dogrulamakoduhataliveyaeksik.tr;
                      return null;
                    },
                    onSaved: (t) => controller.code = t,
                    decoration: InputDecoration(
                        labelText: TranslationKeys.dogrulamakodu.tr,
                        hintText: TranslationKeys.dogrulamakodu.tr),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (t) {
                      if (t == null) return null;
                      if (t.length < 5) return TranslationKeys.parolahatali.tr;
                      return null;
                    },
                    onSaved: (t) => controller.confirmation = t,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: TranslationKeys.parolagiriniz.tr,
                        hintText: TranslationKeys.parolagiriniz.tr),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (t) {
                      if (t == null) return null;
                      if (t.length < 5)
                        return TranslationKeys.parolatekrarihatali.tr;
                      return null;
                    },
                    onSaved: (t) => controller.password = t,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: TranslationKeys.parolatekrari.tr,
                        hintText: TranslationKeys.parolatekrari.tr),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        controller.registerToApp();
                      }
                    },
                    child: Text(
                      TranslationKeys.sifredegistir.tr,
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
