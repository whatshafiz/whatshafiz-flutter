import 'package:flutter/material.dart';

import '../Utils/TapPages.dart';
import '../authscreens/Home.dart';

Map<String, dynamic> EmptyMap = {};

TapPages TapPageByIndex(int num) {
  switch (num) {
    case 0:
      return TapPages.WhatHafiz;
    case 1:
      return TapPages.Yonetmenlikler;
    case 2:
      return TapPages.BizKimiz;
    case 3:
      return TapPages.SSS;
    case 4:
      return TapPages.OgrenciYorumlari;
    case 5:
      return TapPages.EzberTeknikleri;
    case 6:
      return TapPages.Kayit;
    case 7:
      return TapPages.Giris;
  }
  return TapPages.WhatHafiz;
}

Future<void> yesNoDialog( BuildContext context, String title, String description,
    String yesTitle, String cancelTitle, Function onResponse) async {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(cancelTitle),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(yesTitle),
    onPressed: () {
      onResponse();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      continueButton,
      cancelButton,

    ],
  );

  // show the dialog
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> informUser(
    BuildContext context, String title, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(title),
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
Future<void> askUser(
    BuildContext context, String title, String content,Function completion) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(title),
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
              completion();
            },
          ),
        ],
      );
    },
  );
}
