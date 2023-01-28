import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:whatshafiz/Models/LoginModel.dart';
import 'package:whatshafiz/Models/UserModel.dart';
import 'package:whatshafiz/Services/ClientService.dart';
import 'package:whatshafiz/Services/SettingsRef.dart';

class LoginController extends GetxController {
  //Rx<UserModel> userModel = UserModel().obs;
  var userModel = UserModel().obs;

  void userModelUpdated() => userModel.refresh();

  static LoginController get Shared => Get.find<LoginController>();

  LoginController() {
    super.onInit();
  }

  set SetToken(String value) {
    userModel.update((val) {
      val?.token = value;
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
    userModel.update((val) {
      val?.profile = null;
      val?.token = null;
      val?.userPassword = null;
      val?.userEmail = null;
      val?.isSigned = false;
    });
  }

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
