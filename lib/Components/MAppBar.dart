import 'package:flutter/material.dart';

import '../Helper/AppRoutes.dart';
import '../Services/ClientService.dart';
import '../Utils/MenuItems.dart';
import '../Utils/TapPages.dart';
import '../Utils/WindowType.dart';
import '../constants/Constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MAppBar extends AppBar {
  final Function(MenuItems menuItems)? menuSelected;

  MAppBar({Key? key, this.menuSelected}) : super(key: key);

  @override
  State<MAppBar> createState() => _MAppBarState();
}

class _MAppBarState extends State<MAppBar> {
  WindowType windowTye(Size size) {
    final current = size.width;
    if (current >= WindowType.LARGE.sizes) return WindowType.LARGE;
    if (current <= WindowType.XSMALL.sizes) return WindowType.XSMALL;
    if (current <= WindowType.SMALL.sizes) return WindowType.SMALL;
    return WindowType.MEDIUM;
  }

  final popupMenus = [
    MenuItems(0, "WhatHafız nedir?"),
    MenuItems(1, "Yönetmenlikler"),
    MenuItems(2, "Biz kimiz?"),
    MenuItems(3, "S.S.S"),
    MenuItems(4, "Öğrenci Yorumları"),
    MenuItems(5, "Ezberleme Teknikleri"),
    MenuItems(6, "Kayıt"),
    MenuItems(7, "Giriş Yap"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    WindowType winType = windowTye(size);
    return AppBar(
      toolbarHeight: size.height * 0.15,
      leadingWidth: 100,
      backgroundColor: Colors.black87,
      leading: Visibility(
        visible: winType != WindowType.MEDIUM,
        child: Center(
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.HOME);
            },
            child: Text(
              "WhatsHafız .",
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
      actions: [
        Visibility(
          visible: winType == WindowType.SMALL || winType == WindowType.XSMALL,
          child: PopupMenuButton<int>(
            onSelected: (item) => widget.menuSelected!(popupMenus[item]),
            itemBuilder: (context) => popupMenus
                .map((e) =>
                    PopupMenuItem<int>(value: e.value, child: Text(e.text)))
                .toList(),
          ),
        ),
        Visibility(
            visible:
                winType == WindowType.LARGE || winType == WindowType.MEDIUM,
            child: Row(
                children: popupMenus
                    .map((e) => TextButton(
                        onPressed: () {
                          widget.menuSelected!(e);
                        },
                        child: Text(e.text)))
                    .toList()))
      ],
    );
  }
}
