import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: vDimen(10)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(vDimen(20)),
            bottomRight: Radius.circular(vDimen(20)),
            topRight: Radius.circular(
              vDimen(20),
            ),
          ),
        ),
        color: Colors.white,
//        elevation: 1,
        child: Padding(
          padding: EdgeInsets.only(
            left: hDimen(20),
            top: vDimen(10),
            bottom: vDimen(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Steve Martyn",
                style: TextStyle(
                  fontSize: hDimen(14),
                  color: AppColor.colorHomeScreenText,
                ),
              ),
              vSpacing(vDimen(5)),
              Text(
                "Father",
                style: TextStyle(
                  fontSize: hDimen(12),
                  color: AppColor.colorHomeScreen2ndCircle,
                ),
              ),
              vSpacing(vDimen(5)),
              Text(
                "29 years old",
                style: TextStyle(
                  fontSize: hDimen(12),
                  color: AppColor.colorHomeScreen3rdCircle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
