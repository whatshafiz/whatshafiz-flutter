import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Auth/HomeView.dart';
import 'Controllers/AppTranslator.dart';
import 'Controllers/LoginController.dart';
import 'Landing/Landing.dart';
import 'Landing/Logout.dart';
import 'authscreens/CodeWithNewPassword.dart';
import 'authscreens/Home.dart';
import 'authscreens/NewPasswordScreen.dart';
import 'authscreens/RegisterScreen.dart';
import 'authscreens/RegisterWithPhoneScreen.dart';
import 'constants/Constants.dart';

import 'authscreens/CodeAuthScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var loginController = LoginController();
  Get.put(loginController);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    translationsKeys: AppTranslator().keys,
    locale: Get.deviceLocale,
    theme: ThemeData(
      brightness: Brightness.dark,
      canvasColor: Colors.transparent,
      primarySwatch: Colors.grey,
      fontFamily: GoogleFonts.poppins().fontFamily,
      //text style
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    getPages: [
      GetPage(
          name: HOME,
          page: () => Obx(() => loginController.userModel.value.isSigned
              ? const LandingScreen()
              : const HomeView())),
      GetPage(name: LOGOUT, page: () => const LogoutScreen()),
      GetPage(name: LANDING, page: () => const LandingScreen()),
      GetPage(name: REGISTER, page: () => RegisterScreen()),
      GetPage(name: PHONEREGISTER, page: () => RegisterWithPhoneScreen()),
      GetPage(name: CODEAUTH, page: () => CodeAuthScreen()),
      GetPage(name: CODEANDPSW, page: () => const CodeWithNewPassword()),
    ],
  ));
}
