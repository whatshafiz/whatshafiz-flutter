import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whatshafiz/Controllers/AppTranslator.dart';
import 'LoginController.dart';
import '../Helper/AppRoutes.dart';
import '../Models/Countries.dart';
import '../Models/Country.dart';
import '../Models/RegisterCheckModel.dart';
import '../Models/SettingsModel.dart';
import '../Models/UserCheckModel.dart';
import '../Models/WpSendCodeModel.dart';
import '../Services/ClientService.dart';
import '../constants/Constants.dart';
import '../constants/Util.dart';

class HomeController extends GetxController {
  bool showPasswordFields = false;
  String? selectedCountryPhoneCode = null;
  bool forgetIsOpen = false;
  bool firstLogin = false;
  String currentPhoneNum = "";
  String phoneNumber = "";
  String password = "";
  String passwordConfirmation = "";
  String firstLoginPswText = "";
  String userToken = "";
  ClientService client = ClientService();

  List<Countries> counties = [
    Countries(
        id: 0, iso: "iseo", name: TranslationKeys.seciniz.tr, phoneCode: "...")
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCountryCodes();
  }

  resetForm() {
    showPasswordFields = false;
    forgetIsOpen = false;
    firstLogin = false;
    update();
  }

  getCountryCodes() async {
    var result = await client.GetMe(COUNTRYCODEURL, EmptyMap);
    var countryWithCodes = Country.fromJson(result);

    if (countryWithCodes.countries != null) {
      counties.removeAt(0);
      counties.addAll(countryWithCodes.countries!);
      selectedCountryPhoneCode = counties.first.phoneCode;
    }
    update();
  }

  void registerToApp() async {
    if (password.isEmpty) return;
    if (password != passwordConfirmation && password.isNotEmpty) {
      informUser(
          Get.context as BuildContext, "", TranslationKeys.parolauyusmuyor.tr);
      return;
    }

    final val = {
      "phone_number": currentPhoneNum,
      "password": password,
      "password_confirmation": passwordConfirmation
    };

    var res = await client.PostMeApplicationJSon(REGISTERURL, val);
    var loginResponse = RegisterCheckModel.fromJson(res);
    if (loginResponse.token != null) {
      if (loginResponse.token!.isNotEmpty) {
        settingCheck(loginResponse.token);
      }
    }
  }

  void settingCheck(String? token) async {
    if (token != null) {
      var responseSettings = await client.getWithToken(SETTINGSURL, token, {});

      if (responseSettings != null) {
        var response = SettingsModel.fromJson(responseSettings);
        if (response.settings!.isNotEmpty) {
          final model = response.settings!.first;
          final isWpEnabled = model.value == "1";
          if (isWpEnabled) {
            await yesNoDialog(
                Get.context as BuildContext,
                "",
                TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek.tr,
                TranslationKeys.wpkodugonder.tr,
                TranslationKeys.vazgec.tr,
                () => sendCodeAuth(token));
          } else {
            //loginController?.SetToken = token; //login tamamdır
          }
        }
      }
    }
  }

  sendCodeAuth(String token) async {
    var _client = await client.PostWithToken(WPCODESEND, token, {});
    if (_client != null) {
      final wpMsg = WpSendCodeModel.fromJson(_client);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          Get.toNamed(AppRoutes.CODEAUTH, arguments: {"token": token});
        }
      }
    }
  }

  void userCheck() async {
    String? code = selectedCountryPhoneCode;
    String? phoneNum = phoneNumber?.removeAllWhitespace;
    if (code != null) {
      if (code.isNotEmpty && phoneNum!.isNotEmpty) {
        final num = "$code$phoneNum";
        currentPhoneNum = num;
        final map = {"phone_number": num};
        final check = await client.PostMeApplicationJSon(CHECKURL, map);
        final responseModel = UserCheckModel.fromJson(check);
        print("===> ${responseModel.isBanned} ${responseModel.isRegistered}");
        if (responseModel.isBanned!) {
          await informUser(Get.context as BuildContext, "", "baninform".tr);
        } else if (responseModel.isRegistered!) {
          print("is registeed");
          const tmpToken = "158|2fN1fBCNlkRkd7SP9HGcD7t39oyF0eOmJqqqMYiP";
          checkSettings(tmpToken);
        } else {
          showPasswordFields = true;
          forgetIsOpen = false;
          firstLogin = true;
          update();
        }
      }
    }
  }

  void wpMsgSend() async {
    final num = currentPhoneNum;
    print("====> phone $num");
    await yesNoDialog(
        Get.context as BuildContext,
        "",
        TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek.tr,
        TranslationKeys.wpkodugonder.tr,
        TranslationKeys.vazgec.tr, () {
      Navigator.of(Get.context as BuildContext).pop();
      sendCodeAndGotoNewPsw(num);
    });
  }

  void checkSettings(String? token) async {
    if (token != null) {
      var responseSettings =
          await client.getWithToken(SETTINGSURL, token, EmptyMap);

      if (responseSettings != null) {
        var response = SettingsModel.fromJson(responseSettings);
        if (response.settings!.isNotEmpty) {
          final model = response.settings!.first;
          final isWpEnabled = model.value == "1";
          if (isWpEnabled) {
            showPasswordFields = true;
            forgetIsOpen = true;
          } else {
            print("else part");
          }
        }
        update();
      }
    }
  }

  sendCodeAndGotoNewPsw(String phoneNum) async {
    var map = {"phone_number": phoneNum};
    var _client = await client.PostMeApplicationJSon(FORGETPASSWORDURL, map);
    if (_client != null) {
      final wpMsg = WpSendCodeModel.fromJson(_client);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          if (wpMsg.message! == "Telefon No daha önce doğrulanmış") {
            //informUser(Get.context as BuildContext, "", wpMsg.message!);
            informUser(Get.context as BuildContext, "",
                TranslationKeys.wpkodudahaoncedogrulanmis.tr);
          } else {
            showPasswordFields = false;
            Get.toNamed(AppRoutes.CODEANDPSW, arguments: {"token": phoneNum});
            update();
          }
        }
      }
    }
  }

  void loginWithPswAndPhone() async {
    if (password.isNotEmpty) {
      var map = {
        "phone_number": currentPhoneNum,
        "password": password,
      };
      final response = await client.PostMeApplicationJSon(LOGINURL, map);
      final responseModel = RegisterCheckModel.fromJson(response);

      if (responseModel.token != null) {
        userToken = responseModel.token!;
        showPasswordFields = false;
        LoginController.Shared.SetToken = responseModel.token!;
      }
    }
  }
}
