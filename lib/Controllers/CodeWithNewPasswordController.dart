import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'AppTranslator.dart';

import '../Constants/Constants.dart';
import '../Constants/Util.dart';
import '../Helper/AppRoutes.dart';
import '../Models/CodeUpdateModel.dart';
import '../Services/ClientService.dart';

class CodeWithNewPasswordController extends GetxController {
  String? phoneNumber;
  String? password;
  String? confirmation;
  String? code;
  var client = ClientService();

  registerToApp() async {
    if (password == confirmation && confirmation!.isNotEmpty) {
      var map = {
        "verification_code": code,
        "password": password,
        "password_confirmation": confirmation,
        "phone_number": phoneNumber
      };

      var response =
          await client.PostMeApplicationJSonWithAccept(UPDATEPASSWORDRUL, map);
      if (response != null) {
        final codeModel = CodeUpdateModel.fromJson(response);
        print("===> ${response}");
        if (codeModel.errors == null) {
          if (codeModel.message ==
              "Kod hatalı veya süresi dolmuş, lütfen tekrar deneyin.") {
            informUser(Get.context as BuildContext, "", codeModel.message!);
            return;
          }
          askUser(
              Get.context as BuildContext,
              "",
              TranslationKeys
                  .sifrenizbasariyladegistirildigiriseyonlendiriliyorsunuz
                  .tr, () {
            Get.toNamed(AppRoutes.HOME);
          });
        } else {
          informUser(Get.context as BuildContext, "", codeModel.message!);
        }
      }
    }
  }

  set PhoneNumber(String? phone) {
    phoneNumber = phone;
    update();
  }
}
