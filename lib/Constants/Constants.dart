import 'package:flutter/cupertino.dart';

Size getWindowSize(BuildContext context) => MediaQuery.of(context).size;

const ENDPOINT = "https://api.whatshafiz.com/api/v1/";
const HAFIZKALURL = "regulations/hafizkal";
const HAFIZOLURL = "regulations/hafizol";
const CHECKURL = "users/check";
const COUNTRYCODEURL = "countries";
const REGISTERURL = "register";
const SETTINGSURL = "settings";
const PROFILEURL = "profile";
const WPCODESEND = "register/verification-code/send";
const WPCODEVALIDATION = "register/verification-code/verify";
const WEBURL = "https://whatshafiz.com";
const UPDATEPASSWORDRUL = "update-password";
const FORGETPASSWORDURL = "forgot-password";
const LOGINURL = "login";
const UNIVERSITIESURL = "universities";


CITYURL(int id) => "countries/$id/cities";

FACULTYURL(int id) => "universities/$id/faculties";///universities/234/faculties/

DEPARTMENTURL(int uniid, int facultyid) =>
    "universities/$uniid/faculties/$facultyid/departments";
