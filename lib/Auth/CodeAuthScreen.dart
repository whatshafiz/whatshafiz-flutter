
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/AppTranslator.dart';
import '../Controllers/CodeAuthScreenController.dart';
import '../constants/Constants.dart';

class CodeAuthScreen extends StatelessWidget {
  final CodeAuthScreenController controller =
      Get.find<CodeAuthScreenController>();

  final GlobalKey<FormState> codeForm = GlobalKey<FormState>();

  CodeAuthScreen({super.key});

  validateField(String? txt) {
    if (txt == null) return null;
    if (txt.isEmpty) return TranslationKeys.kodgirilmedi.tr;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      final token = Get.arguments["token"];
      controller.setToken = token;
    }
    Size size = getWindowSize(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.15,
          leadingWidth: 100,
          backgroundColor: Colors.black87,
          title: Text(
            TranslationKeys.wpdogrulamakodu.tr,
            style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontStyle: FontStyle.normal),
          ),
          leading: Center(
            child: InkWell(
                onTap: () {
                  if (controller.timer != null) {
                    controller.timer!.cancel();
                    controller.stopwatch.stop();
                  }
                  Get.back();
                },
                child: const Icon(Icons.arrow_back)),
          ),
        ),
        body: GetBuilder<CodeAuthScreenController>(
          builder: (controller) => Center(
            child: Container(
              width: size.width * 0.7,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    TranslationKeys
                        .sizegonderilenwpmesajismapdegilolarakisaretle.tr,
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
                        onSaved: (t) => controller.code = t,
                        decoration: InputDecoration(
                          labelText: TranslationKeys.wpdogrulamakodu.tr,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      controller.timeDisplayer,
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
                      onPressed: () {
                        if (codeForm.currentState!.validate()) {
                          codeForm.currentState!.save();
                          controller.codeValidTapped();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.btnText,
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
        ));
  }
}
