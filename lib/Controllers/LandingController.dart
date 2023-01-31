import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';

import '../Constants/Constants.dart';
import '../Constants/Util.dart';
import '../Helper/AppRoutes.dart';
import '../Landing/ProfileScreen.dart';
import '../Models/ProfileModel.dart';
import '../Models/WpSendCodeModel.dart';
import '../Services/ClientService.dart';

class LandingController extends GetxController {
  var clientService = ClientService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  sendCodeAuth(String token) async {
    var response = await clientService.PostWithToken(WPCODESEND, token, {});
    if (response != null) {
      final wpMsg = WpSendCodeModel.fromJson(response);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          Get.toNamed(AppRoutes.CODEAUTH, arguments: {"token": token});
        }
      }
    }
  }

  getProfile() async {
    final token = LoginController.Shared.GetToken;
    final responseProfile =
        await clientService.getWithToken(PROFILEURL, token, {});
    if (responseProfile != null) {
      final profileResponse = ProfileModel.fromJson(responseProfile);
      if (profileResponse.user != null) {
        if (profileResponse.user!.phoneNumberVerifiedAt == null) {
          await yesNoDialog(
              Get.context as BuildContext,
              "",
              "Telefon numaranıza WhatsApp üzerinden doğrulama kodu gönderilecektir.",
              "WhatsApp Kody Gönder",
              "Vazgeç",
              () => sendCodeAuth(token));
        } else {
          if (profileResponse.user!.gender == null ||
              profileResponse.user!.gender == "") {
            Get.offAll(const ProfileScreen());
          } else {
            //type alanına göre yönlendirme denilmiş ama api'de falan yok
            //burası büyük ihtimalle girişteki alanlarla alakalı bir durum olabilir.
            //veya burası için bence type alanı seçilimi ve sonrasında aksiyon daha iyi
            //olabilir.

          }
          //Get.toNamed(LANDING);
          //loginController?.userModel.value.isSigned=true;
        }
      }
    }
  }
}
