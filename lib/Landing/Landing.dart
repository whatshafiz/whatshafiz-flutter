import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/MAppBar.dart';
import '../Controllers/LoginController.dart';
import '../authscreens/BaseWidget.dart';

class LandingScreen extends StatelessWidget with BaseWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Scaffold(
      appBar: MAppBar(
        menuSelected: MenuSelected,
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
