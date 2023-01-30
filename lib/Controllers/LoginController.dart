import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../Constants/Constants.dart';
import '../Models/LoginModel.dart';
import '../Models/UserModel.dart';
import '../Services/ClientService.dart';
import '../Services/SettingsRef.dart';

class LoginController extends GetxController {
  var userModel = UserModel().obs;

  void userModelUpdated() => userModel.refresh();

  static LoginController get Shared => Get.find<LoginController>();

  checkUserSigned() async {
    var checkUserIsLogged = await SettingsRef().Token;
    print("====> user logged in before $checkUserIsLogged");
    if (checkUserIsLogged != null) {
      userModel.value.token = checkUserIsLogged!;
      userModel.value.isSigned = true;
      update();
    }
  }

  LoginController() {
    super.onInit();
    checkUserSigned();
  }

  set SetToken(String value) {
    userModel.update((val) {
      val?.token = value;
      SettingsRef().saveToken(value);
      val?.isSigned = true;
    });
  }

  set LoggedInd(bool sign) {
    userModel.update((val) {
      val?.isSigned = sign;
    });
  }

  get GetToken {
    return userModel.value.token;
  }

  Future<LoginModel> loginUser(Map<String, dynamic> uservals) async {
    ClientService service = ClientService();
    final data = await service.PostMeWith(uservals);
    final mUserModel = LoginModel.fromJson(data);
    userModel.update((val) {
      val?.profile = mUserModel.profile;
      val?.token = mUserModel.token;
      val?.userEmail = mUserModel.profile?.email;
      val?.userPassword = "***";
    });
    return mUserModel;
  }

  Future<void> signOut() async {
    SettingsRef().removeToken();
    userModel.update((val) {
      val?.profile = null;
      val?.token = null;
      val?.userPassword = null;
      val?.userEmail = null;
      val?.isSigned = false;
    });
  }

  /*getProfile(String token) async {
    var clientService = ClientService();
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
                  () => controller.sendCodeAuth(token));
        } else {
          //Get.toNamed(LANDING);
          //loginController?.userModel.value.isSigned=true;
        }
      }
    }
  }*/

  Future<void> readAll() async {
    var settings = await SettingsRef().getUserProps();
    userModel.value = UserModel(
        userEmail: settings.userEmail,
        userPassword: settings.userPassword,
        token: settings.token);
    if (settings.userEmail!.isNotEmpty) {
      userModel.update((val) {
        val?.Signed = true;
      });
    }
  }
}
