import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/LoginController.dart';
import '../Services/SettingsRef.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
      body: Column(children: [
        Text("Logout Page"),
        ElevatedButton(
            onPressed: () async {
              await controller.readAll();
            },
            child: Text("Click To Save"))
      ]),
    );
  }
}
