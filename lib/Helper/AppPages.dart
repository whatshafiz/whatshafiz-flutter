import 'package:get/get.dart';
import '../Landing/ProfileScreen.dart';
import '../Auth/CodeAuthScreen.dart';
import '../Auth/CodeWithNewPassword.dart';
import '../Auth/HomeView.dart';
import '../Controllers/LoginController.dart';
import '../Landing/Landing.dart';
import '../Landing/Logout.dart';
import '../authscreens/RegisterScreen.dart';
import '../authscreens/RegisterWithPhoneScreen.dart';
import 'AppRoutes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => Obx(() => LoginController.Shared.userModel.value.isSigned
          ? LandingScreen()
          : HomeView()),
    ),
    GetPage(name: AppRoutes.LOGOUT, page: () => const LogoutScreen()),
    GetPage(name: AppRoutes.LANDING, page: () => LandingScreen()),
    GetPage(name: AppRoutes.REGISTER, page: () => RegisterScreen()),
    GetPage(
        name: AppRoutes.PHONEREGISTER, page: () => RegisterWithPhoneScreen()),
    GetPage(name: AppRoutes.CODEAUTH, page: () => CodeAuthScreen()),
    GetPage(
        name: AppRoutes.CODEANDPSW, page: () => const CodeWithNewPassword()),
    GetPage(name: AppRoutes.PROFILE, page: () => ProfileScreen()),
  ];
}
