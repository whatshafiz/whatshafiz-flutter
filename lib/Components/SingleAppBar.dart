import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/Constants.dart';

class SingleAppBar extends AppBar {
  String? label = "Kod Doğrulama";

  SingleAppBar({Key? key, String? label}) : super(key: key) {
    this.label = label;
  }

  @override
  State<SingleAppBar> createState() => _SingleAppBarState();
}

class _SingleAppBarState extends State<SingleAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    return AppBar(
      toolbarHeight: size.height * 0.15,
      leadingWidth: 100,
      backgroundColor: Colors.black87,
      title: Text(
        widget.label ?? "",
        style: GoogleFonts.poppins().copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontStyle: FontStyle.normal),
      ),
      leading: Center(
        child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
      ),
    );
  }
}
