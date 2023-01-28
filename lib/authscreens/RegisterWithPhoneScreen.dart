import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Controllers/AppTranslator.dart';
import 'package:whatshafiz/Models/Countries.dart';
import 'package:whatshafiz/Models/Country.dart';
import 'package:whatshafiz/Models/RegisterCheckModel.dart';
import 'package:whatshafiz/Models/UserCheckModel.dart';
import 'package:whatshafiz/Services/ClientService.dart';
import 'package:whatshafiz/constants/Util.dart';

import '../constants/Constants.dart';

class RegisterWithPhoneScreen extends StatefulWidget {
  RegisterWithPhoneScreen({Key? key}) : super(key: key);

  @override
  State<RegisterWithPhoneScreen> createState() =>
      _RegisterWithPhoneScreenState();
}

class _RegisterWithPhoneScreenState extends State<RegisterWithPhoneScreen> {
  List<Countries> counties = [
    Countries(id: 0, iso: "iseo", name: "Seçiniz", phoneCode: "...")
  ];
  String? selectedCountryPhoneCode = "";
  TextEditingController phoneNumText = TextEditingController();
  TextEditingController pswText = TextEditingController();
  TextEditingController pswAgainText = TextEditingController();
  bool showPasswordFields = false;
  String currentPhoneNum = "";
  String title = "";

  getCountryCodes() async {
    var result = await ClientService().GetMe(COUNTRYCODEURL, EmptyMap);
    var countryWithCodes = Country.fromJson(result);
    print("===> ${countryWithCodes.countries?.length}");

    if (countryWithCodes.countries != null) {
      counties.removeAt(0);
      setState(() {
        counties.addAll(countryWithCodes.countries!);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    final _title = Get.arguments["title"];
    setState(() {
      title = _title;
    });
    getCountryCodes();
  }

  getData(String code) async {
    return counties.where((element) => element.name == code);
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
          "$title Kayıt",
          style: GoogleFonts.poppins().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontStyle: FontStyle.normal),
        ),
        leading: Center(
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back)),
        ),
      ),
      body: Center(
        child: Container(
          width: size.width * 0.5,
          height: size.height * 0.5,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Ülke Kodu",
                          hintText: "Ülkenize ait telefon kodunu seçiniz...",
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
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
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
                  Visibility(
                    visible: showPasswordFields,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: TextField(
                            controller: pswText,
                            obscureText: true,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Parola giriniz.",
                              hintText: "Bir parola giriniz.",
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: TextField(
                            obscureText: true,
                            controller: pswAgainText,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Parola tekrarı giriniz.",
                              hintText: "Parola tekrarı giriniz.",
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: TextButton(
                        onPressed: () async {
                          if (showPasswordFields) {
                            setPasswordForMe();
                          } else {
                            checkEmail();
                          }
                        },
                        child: Text(
                          !showPasswordFields ? "Kaydol" : "Şifremi belirle",
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.orange),
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

  void setPasswordForMe() async {
    final psw = pswText.text;
    final pswAgn = pswAgainText.text;
    if (psw.isNotEmpty && pswAgn.isNotEmpty) {
      if (psw == pswAgn && psw.length > 0) {
        var map = {
          "phone_number": currentPhoneNum,
          "password": psw,
          "password_confirmation": pswAgn
        };
        final response =
            await ClientService().PostMeApplicationJSon(REGISTERURL, map);
        print("==> $response");
        final responseModel = RegisterCheckModel.fromJson(response);
        print("==> ${responseModel.token}");
      }
    }
  }

  void checkEmail() async {
    String? code = selectedCountryPhoneCode;
    String? phoneNum = phoneNumText.text;
    if (code != null) {
      if (code.isNotEmpty && phoneNum.isNotEmpty) {
        final num = "$code$phoneNum";

        final map = {"phone_number": num};
        final check =
            await ClientService().PostMeApplicationJSon(CHECKURL, map);
        final responseModel = UserCheckModel.fromJson(check);
        print("===> ${responseModel.isBanned} ${responseModel.isRegistered}");
        if (responseModel.isBanned!) {
          await informUser(context, "", "baninform".tr);
        } else if (responseModel.isRegistered!) {
          await informUser(context, "", "youalreadyregistered".tr);
          Get.toNamed(LOGIN);
        } else {
          setState(() {
            showPasswordFields = true;
            currentPhoneNum = num;
          });
        }
      }
    }
  }


}
