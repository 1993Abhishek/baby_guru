import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/home_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorHomeScreenBack,
//      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.only(
          top: vDimen(35),
          left: hDimen(30),
          right: hDimen(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.drag_handle,
                  color: AppColor.colorHomeScreenText,
                  size: vDimen(30),
                ),
                hSpacing(hDimen(120)),
                Text(
                  "Home",
                  style: TextStyle(
                    color: AppColor.colorHomeScreenText,
                    fontSize: hDimen(25),
                  ),
                ),
              ],
            ),
            vSpacing(vDimen(20)),
            Center(
              child: Text(
                "Welcome back to",
                style: TextStyle(
                  color: AppColor.colorHomeScreenText,
                  fontSize: hDimen(25),
                ),
              ),
            ),
            Center(
              child: Text(
                "Docs For Kids!",
                style: TextStyle(
                  color: AppColor.colorHomeScreenText,
                  fontSize: hDimen(25),
                ),
              ),
            ),
            vSpacing(vDimen(5)),
            Center(
              child: Text(
                "Thank you to our sponsors for helping keeping",
                style: TextStyle(
                  color: AppColor.colorHomeScreenText,
                  fontSize: hDimen(14),
                ),
              ),
            ),
            Center(
              child: Text(
                "our costs low!",
                style: TextStyle(
                  color: AppColor.colorHomeScreenText,
                  fontSize: hDimen(14),
                ),
              ),
            ),
            vSpacing(vDimen(15)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(95),
                right: hDimen(95),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: AppColor.colorHomeScreen1stCircle,
                    maxRadius: hDimen(20),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColor.colorHomeScreen2ndCircle,
                    maxRadius: hDimen(20),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColor.colorHomeScreen3rdCircle,
                    maxRadius: hDimen(20),
                  ),
                ],
              ),
            ),
            vSpacing(vDimen(25)),
            Padding(
              padding: EdgeInsets.only(
                left: hDimen(10),
              ),
              child: Text(
                "Members List",
                style: TextStyle(
                  color: AppColor.colorHomeScreenText,
                  fontSize: hDimen(14),
                ),
              ),
            ),
            vSpacing(vDimen(10)),
            Container(
              height: vDimen(315),
              width: double.infinity,
              child: ListView.builder(
//                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 106,
                      child: HomeItem(),
                    );
                  }),
            ),
            vSpacing(vDimen(15)),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: vDimen(49),
                    width: hDimen(180),
                    child: Card(
                      color: AppColor.colorHomeScreenButton1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: hDimen(13),
                          right: hDimen(15),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white70,
                              size: hDimen(15),
                            ),
                            hSpacing(hDimen(10)),
                            Text(
                              "Request Appointment",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: vDimen(13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  vSpacing(5),
                  Container(
                    height: vDimen(49),
                    width: hDimen(165),
                    child: Card(
                      color: AppColor.colorHomeScreenButton2,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: hDimen(13),
                          right: hDimen(15),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.tag_faces,
                              color: Colors.white70,
                              size: hDimen(15),
                            ),
                            hSpacing(hDimen(10)),
                            Text(
                              "Refer a friend",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: vDimen(13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  vSpacing(5),
                  Container(
                    height: vDimen(49),
                    width: hDimen(120),
                    child: Card(
                      color: AppColor.colorHomeScreenButton1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: hDimen(13),
                          right: hDimen(15),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.white70,
                              size: hDimen(17),
                            ),
                            hSpacing(hDimen(7)),
                            Text(
                              "Review Us",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: vDimen(13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
