import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whatshafiz/constants/Constants.dart';
import '../Utils/MenuItems.dart';
import '../Utils/TapPages.dart';
import '../Utils/WindowType.dart';
import '../constants/Util.dart';

class BaseWidget {
  getWhatsArapModel() async {}

  getRegister() async {
    Get.toNamed(REGISTER);
  }

  getLogin() async {
    Get.toNamed(LOGIN);
  }

  getSss() async {}

  getBizKimiz() async {}

  WindowType windowTye(Size size) {
    final current = size.width;
    if (current >= WindowType.LARGE.sizes) return WindowType.LARGE;
    if (current <= WindowType.XSMALL.sizes) return WindowType.XSMALL;
    if (current <= WindowType.SMALL.sizes) return WindowType.SMALL;
    return WindowType.MEDIUM;
  }

  void MenuSelected(MenuItems? item) {
    final target = TapPageByIndex(item!.value);
    switch (target) {
      case TapPages.WhatHafiz:
        getWhatsArapModel();
        break;
      case TapPages.Yonetmenlikler:
        getBizKimiz();
        break;
      case TapPages.BizKimiz:
        getBizKimiz();
        break;
      case TapPages.SSS:
        getSss();
        break;
      case TapPages.OgrenciYorumlari:
        getBizKimiz();
        break;
      case TapPages.EzberTeknikleri:
        getBizKimiz();
        break;
      case TapPages.Kayit:
        getRegister();
        break;
      case TapPages.Giris:
        getLogin();
        break;
    }
  }
}
