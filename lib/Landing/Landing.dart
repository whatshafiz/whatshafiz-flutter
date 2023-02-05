import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/LandingController.dart';

import '../Controllers/LoginController.dart';

class LandingScreen extends GetWidget<LandingController> {
  LandingScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu, color: Colors.red)),
        backgroundColor: Colors.black,
        title: Text(
          "WhatHafız .",
          style: GoogleFonts.poppins().copyWith(
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                LoginController.Shared.signOut();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ))
        ],
      ),
      body: Column(children: const [
        Text("Landing Page"),
      ]),
      drawer: Drawer(
        backgroundColor: Colors.white24,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(() => UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  accountName:
                      Text(LoginController.Shared.userModel.value.fullName),
                  accountEmail: ListTile(
                      leading: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(LoginController
                          .Shared.userModel.value.profile?.email)),
                )),
            ListTile(
              leading: const Icon(
                Icons.insert_invitation,
                color: Colors.red,
              ),
              title: const Text('Whatsarrap'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.whatshot,
                color: Colors.red,
              ),
              title: const Text('WhatsEnglish'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.memory,
                color: Colors.red,
              ),
              title: const Text('Hafız Ol'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.data_saver_off_sharp,
                color: Colors.red,
              ),
              title: const Text('Hafız Kal'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
