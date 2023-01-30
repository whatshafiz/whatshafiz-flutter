import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatshafiz/Controllers/ProfileController.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "WhatHafız .",
            style: GoogleFonts.poppins().copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          /*leading: InkWell(
              onTap: () {
                //Get.back();
                controller.demo();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),*/
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.black,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Profile Update Sayfası")],
            ),
          ),
        ),
      ),
    );
  }
}
