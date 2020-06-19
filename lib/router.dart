import 'package:babyguru/ui/helper/route_animation.dart';
import 'package:babyguru/ui/screens/email_verification.dart';
import 'package:babyguru/ui/screens/forgot_password.dart';
import 'package:babyguru/ui/screens/home.dart';
import 'package:babyguru/ui/screens/log_in_provider.dart';
import 'package:babyguru/ui/screens/login_screen.dart';
import 'package:babyguru/ui/screens/sign_up_screen1.dart';
import 'package:babyguru/ui/screens/sign_up_screen2.dart';
import 'package:babyguru/ui/screens/sign_up_screen3.dart';
import 'package:babyguru/ui/screens/splash_screen.dart';
import 'package:babyguru/ui/screens/splash_screen2.dart';
import 'package:babyguru/ui/screens/update_password_screen.dart';
import 'package:flutter/material.dart';

class Router
{
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_LOGIN = "login";
  static const String ROUTE_HOME = "home-screen";
  static const String ROUTE_SIGNUP_1st = "signup1st";
  static const String ROUTE_SIGNUP_2nd = "signup2nd";
  static const String ROUTE_SIGNUP_3rd = "signup3rd";
  static const String ROUTE_SPLASH2 = "splashscreen2";
  static const String ROUTE_LOGIN_PROVIDER = "login-provider";
  static const String ROUTE_FORGOT_PASSWORD = "forgot-password";
  static const String ROUTE_EMAIL_VERIFICATION = "email-verification";
  static const String ROUTE_UPDATE_PASSWORD = "update-password";

  static String ROUTE_CURRENT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;

    switch (settings.name) {
      case ROUTE_INITIAL:
        currentWidget = SplashScreen();
        break;
      case ROUTE_SPLASH2:
        currentWidget = SplashScreen2();
        break;

      case ROUTE_LOGIN:
        currentWidget = LogInScreen();
        break;
      case ROUTE_LOGIN_PROVIDER:
        currentWidget = LogInScreenProvider();
        break;
      case ROUTE_FORGOT_PASSWORD:
        currentWidget = ForgotPassword();
        break;
      case ROUTE_EMAIL_VERIFICATION:
        currentWidget = VerifyEmail();
        break;
      case ROUTE_UPDATE_PASSWORD:
        currentWidget = UpdatePassword();
        break;

      case ROUTE_SIGNUP_1st:
        currentWidget = SignUpPage1st();
        break;
      case ROUTE_SIGNUP_2nd:
        currentWidget = SignUpPage2nd();
        break;
      case ROUTE_SIGNUP_3rd:
        currentWidget = SignUpPage3rd();
        break;
      case ROUTE_HOME:
        currentWidget = HomeScreen();
        break;
      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }

    return FadeRoute(page: currentWidget, settings: settings);
  }
}