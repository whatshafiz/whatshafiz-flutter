import 'package:get/get.dart';
import 'package:whatshafiz/Auth/HomeController.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
