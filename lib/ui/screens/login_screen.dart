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

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FocusNode _nodePassword, _nodeUserEmail;

  TextEditingController _controllerPassword, _controllerEmail;

  @override
  void initState() {
    _nodePassword = FocusNode();
    _nodeUserEmail = FocusNode();

    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();

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
                height: 650,
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
                    "Welcome Back,",
                    style: TextStyle(fontSize: hDimen(40), color: Colors.white),
                  ),
                  vSpacing(10),
                  Text(
                    "Log in to continue",
                    style: TextStyle(fontSize: hDimen(22), color: Colors.white),
                  ),
                  vSpacing(125),
                  Padding(
                    padding: EdgeInsets.only(
                      left: hDimen(10),
                      right: hDimen(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextField(
                          icon: Icons.check,
                          labelText: "Email",
                          image: " ",
                          maxLength: 50,
                          focusNode: _nodeUserEmail,
                          hintText: "Email",
                          inputAction: TextInputAction.next,
                          obSecure: false,
                          textEditingController: _controllerEmail,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodeUserEmail.unfocus();
                            _nodePassword.requestFocus();
                          },
                        ),
                        vSpacing(25),
                        CustomTextField(
                          isPasswordField: true,
                          labelText: "Password",
                          image: " ",
                          maxLength: 10,
                          focusNode: _nodePassword,
                          hintText: "Password",
                          inputAction: TextInputAction.next,
                          obSecure: true,
                          textEditingController: _controllerPassword,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodePassword.unfocus();
                          },
                        ),
                        vSpacing(10),
                        GestureDetector(
                          onTap: ()
                          {
                            Navigator.of(context).pushNamed(Router.ROUTE_FORGOT_PASSWORD);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                fontSize: vDimen(14),
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        vSpacing(30),
                        CustomButton(
                          buttonText: "Login",
                          onClick: () {
                            Navigator.of(context).pushReplacementNamed(Router.ROUTE_HOME);
                          },
                        ),
                        vSpacing(20),
                        Center(
                            child: RichText(
                          text: TextSpan(
                              text: " I'm a new user, ",
                              style: TextStyle(
                                fontSize: vDimen(12),
                                color: Colors.white70,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Sign Up",
                                  recognizer: TapGestureRecognizer()..onTap = ()
                                  {
                                    print("Tab");
                                    Navigator.of(context).pushNamed(Router.ROUTE_SIGNUP_1st);
                                  },
                                  style: TextStyle(
                                    fontSize: vDimen(14),
                                    color: Colors.white70,
                                  ),
                                ),
                              ]),
                        ))
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
