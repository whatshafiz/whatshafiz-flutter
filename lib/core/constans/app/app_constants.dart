// ignore_for_file: constant_identifier_names
import 'dart:ui';

class ApplicationConstants {
  static const COMPANY_NAME = 'Whats Hafız';

  // production'da olmadığımız sürece çalışmasını istemediğimiz fonksiyonlar için kullanacağız
  static const TEST_MODE = true;

  static const LANG_ASSET_PATH = 'assets/lang';
  
  static const FONT_FAMILY = 'POPPINS';

  static const EMAIL_REGIEX = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$';

  static const APP_COLOR =Color.fromRGBO(80, 189, 190, 1);

  static const String rBaseUrl = 'https://api.whatshafiz.com/api/';
}
