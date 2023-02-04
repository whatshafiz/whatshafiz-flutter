import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Constants/Constants.dart';
import 'package:whatshafiz/Controllers/ProfileController.dart';
import 'package:whatshafiz/Helper/Enums.dart';
import 'package:whatshafiz/Models/Cities.dart';

import '../Controllers/AppTranslator.dart';
import '../Models/Countries.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = getWindowSize(context);
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "WhatHafız .",
            style: GoogleFonts.poppins().copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          /*leading: InkWell(
              onTap: () {
                //Get.back();
                controller.demo();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),*/
        ),
        body: !controller.initialized
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          TranslationKeys.profile.tr,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (txt) => controller.name = txt,
                            validator: (t) => controller.emptyValidation(t),
                            initialValue: controller.name,
                            decoration: InputDecoration(
                                labelText: TranslationKeys.adinizigiriniz.tr,
                                hintText: TranslationKeys.adinizigiriniz.tr),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (txt) => controller.surname = txt,
                            validator: (t) => controller.emptyValidation(t),
                            initialValue: controller.surname,
                            decoration: InputDecoration(
                                labelText: TranslationKeys.soyadinizigiriniz.tr,
                                hintText: TranslationKeys.soyadinizigiriniz.tr),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onSaved: (txt) => controller.email = txt,
                            validator: (t) => controller.emailValidation(t),
                            initialValue: controller.email,
                            decoration: InputDecoration(
                                labelText: TranslationKeys.emailgiriniz.tr,
                                hintText: TranslationKeys.emailgiriniz.tr),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: ListTile(
                                  title: Text(TranslationKeys.bayan.tr),
                                  leading: Radio(
                                    value: Gender.female,
                                    onChanged: (t) {
                                      controller.setGender = t as Gender;
                                    },
                                    groupValue: controller.gender,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: ListTile(
                                  title: Text(TranslationKeys.bay.tr),
                                  leading: Radio(
                                    value: Gender.male,
                                    onChanged: (t) {
                                      controller.setGender = t as Gender;
                                    },
                                    groupValue: controller.gender,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        controller.countries.isEmpty
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownSearch<Countries>(
                                  popupProps: const PopupProps.menu(
                                    showSelectedItems: false,
                                    showSearchBox: true,
                                  ),
                                  items: controller.countries,
                                  itemAsString: (item) => "${item.name}",
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: TranslationKeys.ulke.tr,
                                      hintText: TranslationKeys.ulkeseciniz.tr,
                                    ),
                                  ),
                                  onChanged: (item) {
                                    controller.nationChanged(item);
                                  },
                                  selectedItem: controller.countries.first,
                                ),
                              ),
                        controller.cities!.isEmpty
                            ? Container()
                            : controller.selectedCityId == -2
                                ? Container(
                                    child: TextFormField(
                                      validator: (txt) =>
                                          controller.emptyValidation(txt),
                                      onSaved: (txt) =>
                                          controller.cityText = txt,
                                      decoration: InputDecoration(
                                          labelText: TranslationKeys
                                              .sehiradigiriniz.tr,
                                          hintText: TranslationKeys
                                              .sehiradigiriniz.tr),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: DropdownSearch<Cities>(
                                      popupProps: const PopupProps.menu(
                                        showSelectedItems: false,
                                        showSearchBox: true,
                                      ),
                                      items: controller.cities!,
                                      itemAsString: (item) => "${item.name}",
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: TranslationKeys.sehir.tr,
                                          hintText:
                                              TranslationKeys.sehirseciniz.tr,
                                        ),
                                      ),
                                      onChanged: (item) {
                                        controller.cityChanged(item);
                                      },
                                      selectedItem: controller.cities?.first,
                                    ),
                                  ),
                        controller.universities!.isEmpty
                            ? Container()
                            : controller.selectedUniId == -2
                                ? Container(
                                    child: TextFormField(
                                      validator: (txt) =>
                                          controller.emptyValidation(txt),
                                      onSaved: (txt) =>
                                          controller.uniText = txt,
                                      decoration: InputDecoration(
                                          labelText: TranslationKeys
                                              .universiteadigiriniz.tr,
                                          hintText: TranslationKeys
                                              .universiteadigiriniz.tr),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: DropdownSearch<Cities>(
                                      popupProps: const PopupProps.menu(
                                        showSelectedItems: false,
                                        showSearchBox: true,
                                      ),
                                      items: controller.universities!,
                                      itemAsString: (item) => "${item.name}",
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText:
                                              TranslationKeys.universite.tr,
                                          hintText: TranslationKeys
                                              .universiteseciniz.tr,
                                        ),
                                      ),
                                      onChanged: (item) {
                                        controller.universityChanged(item);
                                      },
                                      selectedItem:
                                          controller.universities?.first,
                                    ),
                                  ),
                        controller.faculties!.isEmpty
                            ? Container()
                            : controller.selectedFacultyId == -2
                                ? Container(
                                    child: TextFormField(
                                      validator: (txt) =>
                                          controller.emptyValidation(txt),
                                      onSaved: (txt) =>
                                          controller.facultyText = txt,
                                      decoration: InputDecoration(
                                          labelText: TranslationKeys
                                              .fakulteadigiriniz.tr,
                                          hintText: TranslationKeys
                                              .bolumadigiriniz.tr),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: DropdownSearch<Cities>(
                                      popupProps: const PopupProps.menu(
                                        showSelectedItems: false,
                                        showSearchBox: true,
                                      ),
                                      items: controller.faculties!,
                                      itemAsString: (item) => "${item.name}",
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: TranslationKeys.fakulte.tr,
                                          hintText:
                                              TranslationKeys.fakulteseciniz.tr,
                                        ),
                                      ),
                                      onChanged: (item) {
                                        controller.facultyChanged(item);
                                      },
                                      selectedItem: controller.faculties?.first,
                                    ),
                                  ),
                        controller.departments!.isEmpty
                            ? Container()
                            : controller.selectedDepartmentId == -2
                                ? Container(
                                    child: TextFormField(
                                      validator: (txt) =>
                                          controller.emptyValidation(txt),
                                      onSaved: (txt) =>
                                          controller.departmentText = txt,
                                      decoration: InputDecoration(
                                          labelText: TranslationKeys
                                              .bolumadigiriniz.tr,
                                          hintText: TranslationKeys
                                              .bolumadigiriniz.tr),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: DropdownSearch<Cities>(
                                      popupProps: const PopupProps.menu(
                                        showSelectedItems: false,
                                        showSearchBox: true,
                                      ),
                                      items: controller.departments!,
                                      itemAsString: (item) => "${item.name}",
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: TranslationKeys.bolum.tr,
                                          hintText:
                                              TranslationKeys.bolumseciniz.tr,
                                        ),
                                      ),
                                      onChanged: (item) {
                                        controller.departmentChanged(item);
                                      },
                                      selectedItem:
                                          controller.departments?.first,
                                    ),
                                  ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            alignment: Alignment.topRight,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  controller.saveChanges();
                                }
                              },
                              child: Text(
                                TranslationKeys.kaydet.tr,
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 16,
                                ),
                              ),
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
