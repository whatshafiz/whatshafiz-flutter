import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Components/MAppBar.dart';
import 'package:whatshafiz/Components/SingleAppBar.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';
import 'package:whatshafiz/authscreens/BaseWidget.dart';
import 'package:whatshafiz/constants/Constants.dart';

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
              loginController?.signOut();
            },
            child: Text("Logout"))
      ]),
    );
  }
}
