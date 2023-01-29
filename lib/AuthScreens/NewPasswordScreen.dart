import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/SingleAppBar.dart';
import '../Services/ClientService.dart';

import '../Models/Countries.dart';
import '../Models/Country.dart';
import '../Models/RegisterCheckModel.dart';
import '../Models/UserCheckModel.dart';
import '../constants/Constants.dart';
import '../constants/Util.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  List<Countries> counties = [
    Countries(id: 0, iso: "iseo", name: "Seçiniz", phoneCode: "...")
  ];
  String? selectedCountryPhoneCode = "";
  TextEditingController phoneNumText = TextEditingController();
  TextEditingController codeText = TextEditingController();
  TextEditingController pswText = TextEditingController();
  TextEditingController pswAgainText = TextEditingController();
  bool showPasswordFields = false;
  String currentPhoneNum = "";

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

    getCountryCodes();
  }

  getData(String code) async {
    return counties.where((element) => element.name == code);
  }

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    return Scaffold(
      appBar: SingleAppBar(
        label: "Şifremi Unuttum",
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
                            controller: codeText,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Whatsapp'tan gelen kodu giriniz.",
                              hintText: "Whatsapp parola.",
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
                            checkPhoneAndSettings();
                          }
                        },
                        child: Text(
                          !showPasswordFields ? "kod gönder" : "Şifremi yenile",
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

  void checkPhoneAndSettings() async {
    String? code = selectedCountryPhoneCode;
    String? phoneNum = phoneNumText.text;
    if (code != null) {
      if (code.isNotEmpty && phoneNum.isNotEmpty) {
        final num = "$code$phoneNum";

        final map = {"phone_number": num};
        final check =
            await ClientService().PostMeApplicationJSon(CHECKURL, map);
        final responseModel = UserCheckModel.fromJson(check);
        if (responseModel.isBanned!) {
          await informUser(context, "", "baninform".tr);
        } else if (responseModel.isRegistered!) {//kullanıcı kaydı var settings'e bak açıksa ilerle



        }
      }
    }
  }
}
