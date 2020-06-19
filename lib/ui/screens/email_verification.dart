import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/custom_button.dart';
import 'package:babyguru/ui/widgets/otp_box_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  TextEditingController _controllerBlock1,
      _controllerBlock2,
      _controllerBlock3,
      _controllerBlock4;

  FocusNode _focusNodeBlock1,
      _focusNodeBlock2,
      _focusNodeBlock3,
      _focusNodeBlock4;

  String otpText1 = "",
      otpText2 = "",
      otpText3 = "",
      otpText4 = "";

  @override
  void initState() {
    _controllerBlock1 = TextEditingController();
    _controllerBlock2 = TextEditingController();
    _controllerBlock3 = TextEditingController();
    _controllerBlock4 = TextEditingController();

    _focusNodeBlock1 = FocusNode();
    _focusNodeBlock2 = FocusNode();
    _focusNodeBlock3 = FocusNode();
    _focusNodeBlock4 = FocusNode();
    _focusNodeBlock4 = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLogInScreenBack,
      body: Stack(
        fit: StackFit.loose,
        overflow: Overflow.visible,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: new MyClipper(),
              child: Container(
                width: double.infinity,
//                  color: Colors.white,
                color: AppColor.colorLogInScreenFields,
                height: 620,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: vDimen(40),
              bottom: vDimen(10),
              left: hDimen(28),
              right: hDimen(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: vDimen(40),
                    width: vDimen(40),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white30,
                        width: 1,
                      ),
                      color: AppColor.colorLogInScreenFields,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                vSpacing(35),
                Text(
                  "Varify your email",
                  style: TextStyle(fontSize: hDimen(40), color: Colors.white),
                ),
                vSpacing(10),
                Text(
                  "Please enter the code sent to your",
                  style: TextStyle(fontSize: hDimen(19), color: Colors.white),
                ),
                vSpacing(5),
                Text(
                  "email id",
                  style: TextStyle(fontSize: hDimen(19), color: Colors.white),
                ),
                vSpacing(140),
                Padding(
                  padding: EdgeInsets.only(
                    left: hDimen(20),
                    right: hDimen(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Enter Code",style: TextStyle(color: Colors.white70,fontSize: hDimen(16)),),
                      vSpacing((vDimen(10))),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                        OTPBoxField(
                          height: vDimen(65),
                          width: vDimen(65),
                          textEditingController: _controllerBlock1,
                          focusNode: _focusNodeBlock1,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          hasError:otpText1.isEmpty,
                          onChange: (value) {
                            otpText1 = value;
                            if (value
                                .toString()
                                .length > 0) {
                              _focusNodeBlock1.unfocus();
                              _focusNodeBlock2.requestFocus();
                            }
                          },
                        ),
                        hSpacing(10),
                        OTPBoxField(
                          textEditingController: _controllerBlock2,
                          focusNode: _focusNodeBlock2,
                          hasError:otpText2.isEmpty,
                          onChange: (value) {
                            otpText2 = value;
                            if (value
                                .toString()
                                .length > 0) {
                              _focusNodeBlock2.unfocus();
                              _focusNodeBlock3.requestFocus();
                            } else {
                              _focusNodeBlock2.unfocus();
                              _focusNodeBlock1.requestFocus();
                            }
                          },
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                        ),
                        hSpacing(10),
                        OTPBoxField(
                          textEditingController: _controllerBlock3,
                          focusNode: _focusNodeBlock3,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          hasError:otpText3.isEmpty,
                          onChange: (value) {
                            otpText3 = value;
                            if (value
                                .toString()
                                .length > 0) {
                              _focusNodeBlock3.unfocus();
                              _focusNodeBlock4.requestFocus();
                            } else {
                              _focusNodeBlock3.unfocus();
                              _focusNodeBlock2.requestFocus();
                            }
                          },
                        ),
                        hSpacing(10),
                        OTPBoxField(
                          textEditingController: _controllerBlock4,
                          focusNode: _focusNodeBlock4,
                          hasError: otpText4.isEmpty,
                          textInputType: TextInputType.number,
                          onChange: (value) {
                            otpText4 = value;
                            if (value
                                .toString()
                                .length > 0) {
                              _focusNodeBlock4.unfocus();
//                              _focusNodeBlock5.requestFocus();
                            } else {
                              _focusNodeBlock3.requestFocus();
                            }
                            /*Timer(Duration(milliseconds: 600), () =>
                              Navigator.popUntil(context,
                                  ModalRoute.withName(Router.ROUTE_LOGIN)));*/
                          },
                        ),
                      ],),
                      vSpacing(20),
                      Text(
                        "Resend Code",
                        style: TextStyle(
                          fontSize: hDimen(15),
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      vSpacing(35),
                      CustomButton(
                        buttonText: "Reset Password",
                        onClick: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Router.ROUTE_HOME);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0, 70);

//    var firstEndpoint = new Offset(0, 80);
    var firstControlPoint = new Offset(10, 0);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      90,
      84,
    );

    var secondControlPoint = new Offset(size.width / 2 - 20, 160);

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      size.width / 2 + 100,
      100,
    );

    var thirdControlPoint = new Offset(size.width - 40, 0);

    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      size.width,
      50,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 70);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
