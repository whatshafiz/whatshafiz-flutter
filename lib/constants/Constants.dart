import 'package:flutter/cupertino.dart';

Size getWindowSize(BuildContext context) => MediaQuery.of(context).size;

const LOGOUT = "/logout";
const HOME = "/";
const LANDING = "/landing";
const LOGIN = "/login";
const REGISTER = "/register";
const PHONEREGISTER = "/phone";
const CODEAUTH = "/codeauth";
const FORGETPSW = "/forgetpsw";
const CODEANDPSW = "/codeandpsw";

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
