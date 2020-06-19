import 'package:flutter/material.dart';

class AppColor
{
  static final Color colorHomeScreenBack = hexToColor("#f9f8fb");
  static final Color colorHomeScreenText = hexToColor("#454f63");
  static final Color colorHomeScreenButton1 = hexToColor("#3acce1");
  static final Color colorHomeScreenButton2 = hexToColor("#fcacda");
  static final Color colorHomeScreen1stCircle = hexToColor("#fdbea6");
  static final Color colorHomeScreen2ndCircle = hexToColor("#fcacda");
  static final Color colorHomeScreen3rdCircle = hexToColor("#b3cbdc");
  static final Color colorLogInScreenBack = hexToColor("#3acce1");
  static final Color colorLogInScreenFields = hexToColor("#53d1e4");
  static final Color colorLogInScreenFieldText = hexToColor("#53d1e4");
  static final Color colorLogInScreenFieldTextSelected = hexToColor("#90deea");
  static final Color colorSplashScreenProvider = hexToColor("#19a0b4");
  static final Color colorSplashScreen3rdCircle = hexToColor("#b3cbdc");
  static final Color colorResetPasswordResend = hexToColor("#454f63");


  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}