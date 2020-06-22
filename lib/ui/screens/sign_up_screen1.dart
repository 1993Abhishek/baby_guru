import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/custom_button.dart';
import 'package:babyguru/ui/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage1st extends StatefulWidget {
  @override
  _SignUpPage1stState createState() => _SignUpPage1stState();
}

class _SignUpPage1stState extends State<SignUpPage1st> {
  FocusNode _nodeLastName, _nodeFirstName, _nodeGender;

  TextEditingController _controllerFirstName,
      _controllerLastName,
      _controllerGender;

  @override
  void initState() {
    _nodeFirstName = FocusNode();
    _nodeLastName = FocusNode();
    _nodeGender = FocusNode();

    _controllerFirstName = TextEditingController();
    _controllerLastName = TextEditingController();
    _controllerGender = TextEditingController();

    super.initState();
  }

  String dropdownValue = 'Male';

  List<DropdownMenuItem<String>> _list = [];

  void loadData() {
    _list.add(
      DropdownMenuItem(
        child: Text("Item 1"),
        value: " val-1",
      ),
    );
    _list.add(
      DropdownMenuItem(
        child: Text("Item 2"),
        value: " val-2",
      ),
    );
    _list.add(
      DropdownMenuItem(
        child: Text("Item 3"),
        value: " val-3",
      ),
    );

  }

  Widget dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.white70),
      underline: Container(
        height: 2,
        color: Colors.white70,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Male', 'Female', 'Transgender', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
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
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
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
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  vSpacing(35),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: hDimen(40), color: Colors.white),
                  ),
                  vSpacing(10),
                  Text(
                    "Sign Up to continue",
                    style: TextStyle(fontSize: hDimen(22), color: Colors.white),
                  ),
                  vSpacing(135),
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
                          labelText: "First Name",
                          image: " ",
                          maxLength: 50,
                          focusNode: _nodeFirstName,
//                          hintText: "Email",
                          inputAction: TextInputAction.next,
                          obSecure: false,
                          textEditingController: _controllerFirstName,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodeFirstName.unfocus();
                            _nodeLastName.requestFocus();
                          },
                        ),
                        vSpacing(25),
                        CustomTextField(
                          isPasswordField: true,
                          labelText: "Last Name",
                          image: " ",
                          maxLength: 10,
                          focusNode: _nodeLastName,
//                          hintText: "Password",
                          inputAction: TextInputAction.next,
                          obSecure: true,
                          textEditingController: _controllerLastName,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodeLastName.unfocus();
                            _nodeGender.requestFocus();
                          },
                        ),
                        vSpacing(25),
                        CustomTextField(
                          selectedDate: dropdownValue,
                          isDateField: true,
                          onTab: () {
                            print("On Tab");
                            dropDown();
                          },
                          icon: Icons.arrow_drop_down,
                          isPasswordField: false,
                          labelText: "Gender",
                          image: " ",
                          maxLength: 10,
                          focusNode: _nodeGender,
//                          hintText: "Gender",
                          inputAction: TextInputAction.next,
                          obSecure: false,
                          textEditingController: _controllerGender,
                          textStyle: TextStyle(
                            fontSize: vDimen(16),
                            color: Colors.white70,
                          ),
                          onSubmit: (value) {
                            _nodeGender.unfocus();
                          },
                        ),
                        vSpacing(30),
                        CustomButton(
                          buttonText: "Next",
                          onClick: () {
                            Navigator.of(context)
                                .pushNamed(Router.ROUTE_SIGNUP_2nd);
                          },
                        ),
                        vSpacing(20),
                        Center(
                            child: RichText(
                          text: TextSpan(
                              text: " I'm already a member, ",
                              style: TextStyle(
                                fontSize: vDimen(12),
                                color: Colors.white70,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Sign in",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
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
