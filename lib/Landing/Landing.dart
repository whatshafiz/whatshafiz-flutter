import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Components/SingleAppBar.dart';
import 'package:whatshafiz/Controllers/LandingController.dart';

import '../Components/MAppBar.dart';
import '../Controllers/LoginController.dart';
import '../authscreens/BaseWidget.dart';

class LandingScreen extends GetWidget<LandingController> {
  LandingScreen({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleAppBar(
        label: "WhatHafız .",
      ),
      body: Column(children: [
        Obx(
          () => Text(
            "Landing Page Phone Number ${loginController.userModel.value.profile?.phoneNumber} token: ${loginController.GetToken}",
            style:
                GoogleFonts.poppins().copyWith(color: Colors.red, fontSize: 20),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              loginController.signOut();
            },
            child: const Text("Logout"))
      ]),
    );
  }
}
