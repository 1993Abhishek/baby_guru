import 'dart:async';

import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Router.ROUTE_SPLASH2);
    });
    super.initState();
  }
  viewHelperInit() async {
    ///Initialize the App Dimensions according to screen sizes
    SizeConfig().init(context);
    AppDimenHelper().init();
  }

  @override
  Widget build(BuildContext context) {
    viewHelperInit();
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Image.asset("assets/pictures/Splash.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Align(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColor.colorLogInScreenFields),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
