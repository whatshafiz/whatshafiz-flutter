import 'package:get/get.dart';
import 'package:whatshafiz/Controllers/HomeController.dart';
import 'package:whatshafiz/Controllers/CodeWithNewPasswordController.dart';
import 'package:whatshafiz/Controllers/LandingController.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';

import '../Controllers/CodeAuthScreenController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController(), permanent: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CodeWithNewPasswordController(), fenix: true);
    Get.lazyPut(() => CodeAuthScreenController(), fenix: true);
    Get.lazyPut(() => LandingController(), fenix: true);
  }
}
