import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/custom_button.dart';
import 'package:babyguru/ui/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class UpdatePassword extends StatefulWidget {
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  FocusNode _nodeUserPassword, _nodeNewPassword;

  TextEditingController _controllerPassword, _controllerNewPassword;

  @override
  void initState() {
    _nodeUserPassword = FocusNode();
    _nodeNewPassword = FocusNode();

    _controllerPassword = TextEditingController();
    _controllerNewPassword = TextEditingController();

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
          SingleChildScrollView(
            child: Padding(
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
                    onTap: ()
                    {
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
                    "Update password",
                    style: TextStyle(fontSize: hDimen(40), color: Colors.white),
                  ),
                  vSpacing(10),
                  Text(
                    "Don't worry we will update your password",
                    style: TextStyle(fontSize: hDimen(19), color: Colors.white),
                  ),

                  vSpacing(170),
                  Padding(
                    padding: EdgeInsets.only(
                      left: hDimen(20),
                      right: hDimen(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextField(
                          icon: Icons.check,
                          labelText: "Enter new password",
                          image: " ",
                          maxLength: 50,
                          focusNode: _nodeNewPassword,
                          backgroundColor: AppColor.colorLogInScreenFields,
//                          hintText: "Email",
                          inputAction: TextInputAction.next,
                          obSecure: false,
                          textEditingController: _controllerNewPassword,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodeNewPassword.unfocus();
                            _nodeUserPassword.requestFocus();
                          },
                        ),
                        vSpacing(20),
                        CustomTextField(
                          icon: Icons.check,
                          labelText: "Confirm new password",
                          image: " ",
                          maxLength: 50,
                          focusNode: _nodeUserPassword,
                          backgroundColor: AppColor.colorLogInScreenFields,
//                          hintText: "Email",
                          inputAction: TextInputAction.next,
                          obSecure: false,
                          textEditingController: _controllerNewPassword,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodeUserPassword.unfocus();
                          },
                        ),
                        vSpacing(65),
                        CustomButton(
                          buttonText: "Done",
                          onClick: () {
                            Navigator.of(context).pushNamed(Router.ROUTE_EMAIL_VERIFICATION);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
