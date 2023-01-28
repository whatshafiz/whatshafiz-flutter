import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/MAppBar.dart';
import '../Models/WhatsArapModel.dart';
import '../Services/ClientService.dart';
import 'BaseWidget.dart';
import '../constants/Constants.dart';
import '../constants/Util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with BaseWidget {
  String? hafizKal = "";
  String? hafizOl = "";

  getHafizKal() async {
    final responseHafizKal = await ClientService().GetMe(HAFIZKALURL, EmptyMap);
    final responseHafizOl = await ClientService().GetMe(HAFIZOLURL, EmptyMap);
    final responseModelHafizKal = WhatsArapModel.fromJson(responseHafizKal);
    final responseModelHafizOl = WhatsArapModel.fromJson(responseHafizOl);
    setState(() {
      print("setting $hafizKal");
      hafizKal = responseModelHafizKal.text;
      hafizOl = responseModelHafizOl.text;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getHafizKal();
  }

  @override
  Widget build(BuildContext context) {
    Size size = getWindowSize(context);

    return Scaffold(
        appBar: MAppBar(
          menuSelected: MenuSelected,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Card(
                  margin: EdgeInsets.all(size.width * 0.01),
                  clipBehavior: Clip.antiAlias,
                  elevation: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Hafız Kal",
                                    overflow: TextOverflow.fade,
                                    maxLines: 500,
                                    softWrap: true,
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  Text(
                                    "Programına Kayıt",
                                    overflow: TextOverflow.fade,
                                    maxLines: 500,
                                    softWrap: true,
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          hafizKal ?? "",
                          overflow: TextOverflow.fade,
                          maxLines: 500,
                          softWrap: true,
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 10, color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(PHONEREGISTER,
                                arguments: {"title": "Hafız Kal"});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Kayıt Ol",
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.orange, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Card(
                  margin: EdgeInsets.all(size.width * 0.01),
                  clipBehavior: Clip.antiAlias,
                  elevation: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                          //color: Colors.red
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Hafız Ol",
                                    overflow: TextOverflow.fade,
                                    softWrap: true,
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  Text(
                                    "Programına Kayıt",
                                    overflow: TextOverflow.fade,
                                    softWrap: true,
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          hafizOl ?? "",
                          overflow: TextOverflow.fade,
                          maxLines: 500,
                          softWrap: true,
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 10, color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(PHONEREGISTER,
                                arguments: {"title": "Hafız Ol"});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Kayıt Ol",
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.orange, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
