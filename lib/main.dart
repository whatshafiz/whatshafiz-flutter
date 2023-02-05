import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Helper/Binding.dart';
import 'Controllers/AppTranslator.dart';
import 'Helper/AppPages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    initialBinding: Binding(),
    translations: AppTranslator(),
    translationsKeys: AppTranslator().keys,
    locale: Get.deviceLocale,
    getPages: AppPages.pages,
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
  ));
}
