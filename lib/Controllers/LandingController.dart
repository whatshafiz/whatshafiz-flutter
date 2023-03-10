import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whatshafiz/Controllers/AppTranslator.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';
import '../Constants/Constants.dart';
import '../Constants/Util.dart';
import '../Helper/AppRoutes.dart';
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
        await clientService.GetWithToken(PROFILEURL, token, {});
    if (responseProfile != null) {
      final profileResponse = ProfileModel.fromJson(responseProfile);
      print(
          "===> profile ${profileResponse.user?.name} ${profileResponse.user?.surname} ${profileResponse.user?.email}");
      if (profileResponse.user != null) {
        if (profileResponse.user!.phoneNumberVerifiedAt == null) {
          await yesNoDialog(
              Get.context as BuildContext,
              "",
              TranslationKeys.telefonnowpuzerindedogrulamakodugonderilecek.tr,
              TranslationKeys.wpkodugonder.tr,
              TranslationKeys.vazgec.tr,
              () => sendCodeAuth(token));
        } else {
          if (profileResponse.user!.gender == null ||
              profileResponse.user!.gender == "") {
            LoginController.Shared.UpdateProfile = profileResponse.toProfile;
            Get.offNamed(AppRoutes.PROFILE);
          } else {
            //type alan??na g??re y??nlendirme denilmi?? ama api'de falan yok
            //buras?? b??y??k ihtimalle giri??teki alanlarla alakal?? bir durum olabilir.
            //veya buras?? i??in bence type alan?? se??ilimi ve sonras??nda aksiyon daha iyi
            //olabilir.
            LoginController.Shared.UpdateProfile = profileResponse.toProfile;

            //Get.offNamed(AppRoutes.PROFILE);
          }
        }
      } else {
        LoginController.Shared.signOut();
      }
    } else {
      LoginController.Shared.signOut();
    }
  }
}
