import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';
import 'package:whatshafiz/Models/UserModel.dart';

class SettingsRef {
  String USEREMAIL = "USEREMAIL";
  String USERPASSWROD = "USERPASSWROD";
  String USERTOKEN = "USERTOKEN";

  Future<SharedPreferences> _shared() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> saveUserProps(
      String userEmail, String userPassword, String token) async {
    final prefs = await _shared();
    await prefs.setString(USEREMAIL, userEmail);
    await prefs.setString(USERPASSWROD, userPassword);
    await prefs.setString(USERTOKEN, token);
    return true;
  }

  Future<UserModel> getUserProps() async {
    final prefs = await _shared();
    final String? userEmail = prefs.getString(USEREMAIL);
    final String? userPas = prefs.getString(USERPASSWROD);
    final String? token = prefs.getString(USERTOKEN);

    return UserModel(userEmail: userEmail, userPassword: userPas, token: token);

    //final List<String>? items = prefs.getStringList('items');
  }

  Future<bool> clearUserProps() async {
    final prefs = await _shared();
    await prefs.remove(USERTOKEN);
    await prefs.remove(USEREMAIL);
    await prefs.remove(USERPASSWROD);

    return true;
  }
}
