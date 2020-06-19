import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLogInScreenBack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: vDimen(170),
            ),
            child: Center(
              child: Text(
                "I'm a",
                style: TextStyle(
                    fontSize: vDimen(80),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: vDimen(60),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).pushNamed(Router.ROUTE_LOGIN_PROVIDER);
                    },
                    child: Container(
                      height: vDimen(80),
                      width: hDimen(200),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: hDimen(15),
                            right: hDimen(15),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/pictures/doctor.png",
                                height: vDimen(40),
                                width: hDimen(26),
                                fit: BoxFit.cover,
                              ),
                              hSpacing(hDimen(8)),
                              Text(
                                "Provider",
                                style: TextStyle(
                                  color: AppColor.colorSplashScreenProvider,
                                  fontSize: vDimen(24),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  vSpacing(20),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).pushNamed(Router.ROUTE_LOGIN);
                    },
                    child: Container(
                      height: vDimen(80),
                      width: hDimen(240),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: AppColor.colorHomeScreenButton2,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: hDimen(15),
                            right: hDimen(15),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/pictures/baby.png",
                                height: vDimen(40),
                                width: hDimen(30),
                                fit: BoxFit.cover,
                              ),
                              hSpacing(hDimen(10)),
                              Text(
                                "Patient",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: vDimen(24),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          vSpacing(vDimen(120)),
          Center(
            child: Text(
              "Thank you to our sponsors for helping keeping",
              style: TextStyle(
                fontSize: vDimen(18),
                color: Colors.white,
              ),
            ),
          ),
          vSpacing(vDimen(10)),
          Center(
            child: Text(
              "our costs low!",
              style: TextStyle(
                fontSize: vDimen(18),
                color: Colors.white,
              ),
            ),
          ),
          vSpacing(vDimen(20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: AppColor.colorHomeScreen1stCircle,
                maxRadius: hDimen(25),
              ),
              hSpacing(hDimen(20)),
              CircleAvatar(
                backgroundColor: AppColor.colorHomeScreen2ndCircle,
                maxRadius: hDimen(25),
              ),
              hSpacing(hDimen(20)),
              CircleAvatar(
                backgroundColor: AppColor.colorHomeScreen3rdCircle,
                maxRadius: hDimen(25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
