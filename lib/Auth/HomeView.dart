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
                                  } else if(txt.length>10) {
                                    return TranslationKeys
                                        .telefonno10rakamolmalidir.tr;
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
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
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
