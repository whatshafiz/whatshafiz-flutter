import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/SingleAppBar.dart';
import '../Controllers/LoginController.dart';
import '../Services/ClientService.dart';
import '../constants/Constants.dart';

import '../Models/WpSendCodeModel.dart';

class CodeAuthScreen extends StatefulWidget {
  const CodeAuthScreen({Key? key}) : super(key: key);

  @override
  State<CodeAuthScreen> createState() => _CodeAuthScreenState();
}

class _CodeAuthScreenState extends State<CodeAuthScreen> {
  final TIMETOWAIT = 180 * 1000;
  int counter = 0;
  String timeDisplayer = "00:00";
  String btnText = "";
  String mToken = "";

  TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> codeForm = GlobalKey<FormState>();
  final stopwatch = Stopwatch();
  bool timeEnded = false;
  LoginController? loginController;
  Timer? timer;

  startTimer() {
    counter = TIMETOWAIT ~/ 1000;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      this.timer = timer;
      timerTick();
      if (stopwatch.elapsedMilliseconds >= TIMETOWAIT) {
        timer.cancel();
        stopwatch.reset();
        setState(() {
          timeEnded = true;
          btnText = "Kodu tekrar gönder";
        });
      }
    });
    stopwatch.start();
    setState(() {
      btnText = "Onayla";
    });
  }

  timerTick() {
    counter--;
    if (counter <= 0) counter = 0;
    final formatted = formatTimer(counter);
    setState(() {
      timeDisplayer = formatted;
    });
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

  @override
  void initState() {
    loginController = Get.find<LoginController>();
    if (Get.arguments != null) {
      final token = Get.arguments["token"];
      setState(() {
        mToken = token;
      });
    }
    startTimer();
  }

  validateField(String? txt) {
    if (txt == null) return null;
    if (txt.isEmpty) return "Kod girilmedi";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.15,
        leadingWidth: 100,
        backgroundColor: Colors.black87,
        title: Text(
          "Whatsapp Kod Doğrulama",
          style: GoogleFonts.poppins().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontStyle: FontStyle.normal),
        ),
        leading: Center(
          child: InkWell(
              onTap: () {
                if (timer != null) {
                  timer!.cancel();
                  stopwatch.stop();
                }
                Get.back();
              },
              child: const Icon(Icons.arrow_back)),
        ),
      ),
      body: Center(
        child: Container(
          width: size.width * 0.5,
          height: size.height * 0.5,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Size gönderilen whatsapp mesajını spam değil olarak işaretleyip gönderilen kodu giriniz.",
                style: GoogleFonts.poppins().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Form(
                key: codeForm,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    validator: (txt) => validateField(txt),
                    decoration: const InputDecoration(
                      labelText: "WhatsApp doğrulama kodu",
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  timeDisplayer,
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  ),
                  onPressed: codeValidTapped,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      btnText,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  sendCodeAuth(String token) async {
    var client = await ClientService().PostWithToken(WPCODESEND, token, {});
    if (client != null) {
      final wpMsg = WpSendCodeModel.fromJson(client);
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
    if (codeForm.currentState!.validate()) {
      final code = codeController.text;
      final token = mToken;

      final client = await ClientService()
          .PostTokenWithEncoded(WPCODEVALIDATION, token, {"code": code});
      if (client != null) {
        final msg = WpSendCodeModel.fromJson(client);
        if (msg.message != null) {
          Get.snackbar("", msg.message!);
          loginController?.SetToken = mToken;
        }
      }
    }
  }
}
