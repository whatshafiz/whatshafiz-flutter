import 'dart:async';

import 'package:get/get.dart';
import 'AppTranslator.dart';
import 'LoginController.dart';

import '../Constants/Constants.dart';
import '../Models/WpSendCodeModel.dart';
import '../Services/ClientService.dart';

class CodeAuthScreenController extends GetxController {
  final TIMETOWAIT = 180 * 1000;
  int counter = 0;
  String timeDisplayer = "00:00";
  String btnText = "";
  String mToken = "";
  String? code = null;

  final stopwatch = Stopwatch();
  bool timeEnded = false;

  Timer? timer;
  var client = ClientService();

  set setToken(String? token) {
    mToken = token!;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }

  startTimer() {
    counter = TIMETOWAIT ~/ 1000;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      this.timer = timer;
      timerTick();
      if (stopwatch.elapsedMilliseconds >= TIMETOWAIT) {
        timer.cancel();
        stopwatch.reset();
        timeEnded = true;
        btnText = TranslationKeys.kodutekrargonder.tr;
        update();
      }
    });
    stopwatch.start();
    btnText = TranslationKeys.onayla.tr;
    update();
  }

  timerTick() {
    counter--;
    if (counter <= 0) counter = 0;
    final formatted = formatTimer(counter);
    timeDisplayer = formatted;
    update();
  }

  formatTimer(int cnt) {
    int minute = cnt ~/ 60;
    int sec = cnt % 60;
    String formatted = "";
    if (minute < 10 && sec < 10) {
      formatted = "0$minute:0$sec";
    } else if (minute < 10) {
      formatted = "0$minute:$sec";
    } else if (sec < 10) {
      formatted = "$minute:0$sec";
    } else {
      formatted = "$minute:$sec";
    }
    return formatted;
  }

  sendCodeAuth(String token) async {
    var response = await client.PostWithToken(WPCODESEND, token, {});
    if (response != null) {
      final wpMsg = WpSendCodeModel.fromJson(response);
      if (wpMsg.message != null) {
        if (wpMsg.message!.isNotEmpty) {
          startTimer();
        }
      }
    }
  }

  void sendCode() async {
    sendCodeAuth(mToken);
  }

  void codeValidTapped() async {
    if (timeEnded) {
      sendCode();
      return;
    }
    var map = {"code": code};
    print("==>  $map  $mToken");
    final response =
        await client.PostTokenWithEncoded(WPCODEVALIDATION, mToken, map);

    if (response != null) {
      final msg = WpSendCodeModel.fromJson(response);
      if (msg.message != null) {
        Get.snackbar("", msg.message!);
        LoginController.Shared.SetToken = mToken;
        //loginController?.SetToken = mToken;
      }
    }
  }
}
