import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/custom_button.dart';
import 'package:babyguru/ui/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage2nd extends StatefulWidget {
  @override
  _SignUpPage2ndState createState() => _SignUpPage2ndState();
}

class _SignUpPage2ndState extends State<SignUpPage2nd> {
  FocusNode _nodeDOB, _nodeNoOfChildren, _nodePhoneNO, _nodeEmail, _nodePassword;

  TextEditingController _controllerPhoneNO,
      _controllerEmail,
      _controllerPassword;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    _nodeDOB = FocusNode();
    _nodeNoOfChildren = FocusNode();
    _nodePhoneNO = FocusNode();
    _nodeEmail = FocusNode();
    _nodePassword= FocusNode();

    _controllerPhoneNO = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();

    super.initState();
  }

  String year=" ";
  String month=" ";
  String day=" ";

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        year= picked.toString().substring(0,4);
        month = picked.toString().substring(5,7);
        day =picked.toString().substring(8,10);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLogInScreenBack,
      body: SingleChildScrollView(
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
              Row(
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
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Step 2 of 3",
                    style: TextStyle(
                      fontSize: vDimen(16),
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              vSpacing(40),
              Padding(
                padding: EdgeInsets.only(
                  left: hDimen(10),
                  right: hDimen(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextField(
                      selectedDate:day==" " ? " ":day+"/"+month+"/"+year,
                      isDateField: true,
                      onTab: ()
                      {
                        print("Date Tab..");
                        _selectDate(context);
                      },
                      labelText: "DOB",
                      image: " ",
                      maxLength: 50,
                      focusNode: _nodeDOB,
                      hintText: "DOB",
                      inputAction: TextInputAction.next,
                      obSecure: false,
//                      textEditingController: _controllerFirstName,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeDOB.unfocus();
                        _nodeNoOfChildren.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
                      icon: Icons.arrow_drop_down,
                      labelText: "No. of Children",
                      image: " ",
                      maxLength: 50,
                      focusNode: _nodeNoOfChildren,
//                      hintText: "",
                      inputAction: TextInputAction.next,
                      obSecure: false,
//                      textEditingController: _controllerFirstName,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeNoOfChildren.unfocus();
                        _nodePhoneNO.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
                      isPasswordField: false,
                      labelText: "Phone Number",
                      image: " ",
                      maxLength: 10,
                      focusNode: _nodePhoneNO,
//                      hintText: "Password",
                      inputAction: TextInputAction.next,
                      obSecure: false,
                      textEditingController: _controllerPhoneNO,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodePhoneNO.unfocus();
                        _nodeEmail.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
                      isPasswordField: false,
                      labelText: "Email",
                      image: " ",
                      maxLength: 10,
                      focusNode: _nodeEmail,
//                      hintText: "Email",
                      inputAction: TextInputAction.next,
                      obSecure: false,
                      textEditingController: _controllerEmail,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeEmail.unfocus();
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
//                      hintText: "Password",
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
                    vSpacing(25),
                    CustomButton(
                      buttonText: "Next",
                      onClick: () {
                        Navigator.of(context).pushNamed(Router.ROUTE_SIGNUP_3rd);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
