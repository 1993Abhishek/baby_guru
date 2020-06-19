import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:babyguru/ui/widgets/custom_button.dart';
import 'package:babyguru/ui/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage3rd extends StatefulWidget {
  @override
  _SignUpPage3rdState createState() => _SignUpPage3rdState();
}

class _SignUpPage3rdState extends State<SignUpPage3rd> {
  FocusNode _nodeAddress1, _nodeAddress2, _nodeState, _nodeCountry, _nodeZipcode;

  TextEditingController _controllerAddress1,
      _controllerAddress2,
      _controllerState,
  _controllerZipcode;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    _nodeAddress1 = FocusNode();
    _nodeAddress2 = FocusNode();
    _nodeState = FocusNode();
    _nodeCountry = FocusNode();
    _nodeZipcode= FocusNode();

    _controllerAddress1 = TextEditingController();
    _controllerAddress2 = TextEditingController();
    _controllerState = TextEditingController();
    _controllerZipcode = TextEditingController();

    super.initState();
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
                    "Step 3 of 3",
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
                      labelText: "Address line 1",
                      image: " ",
                      maxLength: 50,
                      focusNode: _nodeAddress1,
                      backgroundColor: AppColor.colorLogInScreenFields,
                      hintText: "Type here",
                      inputAction: TextInputAction.next,
                      obSecure: false,
//                      textEditingController: _controllerFirstName,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeAddress1.unfocus();
                        _nodeAddress2.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
//                      icon: Icons.arrow_drop_down,
                      labelText: "Address line 2",
                      image: " ",
                      maxLength: 50,
                      focusNode: _nodeAddress2,
                      backgroundColor: AppColor.colorLogInScreenFields,
                      hintText: "Type here",
                      inputAction: TextInputAction.next,
                      obSecure: false,
                      textEditingController: _controllerAddress2,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeAddress2.unfocus();
                        _nodeState.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
                      isPasswordField: true,
                      labelText: "Type here",
                      image: " ",
                      maxLength: 10,
                      focusNode: _nodeState,
                      backgroundColor: AppColor.colorLogInScreenFields,
                      hintText: "Password",
                      inputAction: TextInputAction.next,
                      obSecure: false,
                      textEditingController: _controllerState,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeState.unfocus();
                        _nodeCountry.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
                      icon: Icons.arrow_drop_down,
                      isPasswordField: false,
                      labelText: "Country",
                      image: " ",
                      maxLength: 10,
                      focusNode: _nodeCountry,
                      backgroundColor: AppColor.colorLogInScreenFields,
                      hintText: "Choose here",
                      inputAction: TextInputAction.next,
                      obSecure: false,
//                      textEditingController: _controllerEmail,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeCountry.unfocus();
                        _nodeZipcode.requestFocus();
                      },
                    ),
                    vSpacing(25),
                    CustomTextField(
                      isPasswordField: true,
                      labelText: "zipcode",
                      image: " ",
                      maxLength: 10,
                      focusNode: _nodeZipcode,
                      backgroundColor: AppColor.colorLogInScreenFields,
                      hintText: "Type here",
                      inputAction: TextInputAction.next,
                      obSecure: true,
                      textEditingController: _controllerZipcode,
                      textStyle: TextStyle(
                        fontSize: vDimen(16),
                        color: Colors.white70,
                      ),
                      onSubmit: (value) {
                        _nodeZipcode.unfocus();
                      },
                    ),
                    vSpacing(25),
                    CustomButton(
                      buttonText: "Submit",
                      onClick: () {},
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
