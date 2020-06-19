import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:babyguru/ui/util/app_view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String image;
  final String hintText;
  final TextStyle textStyle;
  final bool obSecure;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final Function onSubmit;
  final TextInputAction inputAction;
  final int maxLength;
  final Color backgroundColor;
  final bool isPasswordField;
  final Function onTab;
  final bool isDateField;
  final IconData icon;
  final String selectedDate;

  CustomTextField({
    this.selectedDate,
    this.icon,
    this.isDateField = false,
    this.onTab,
    this.isPasswordField = false,
    this.backgroundColor,
    this.labelText,
    this.focusNode,
    this.hintText,
    this.image,
    this.inputAction,
    this.maxLength,
    this.obSecure,
    this.onSubmit,
    this.textEditingController,
    this.textStyle,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool selectedField = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: hDimen(10)),
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: Colors.white70,
              fontSize: hDimen(16),
            ),
          ),
        ),
        vSpacing(10),
        GestureDetector(
          onTap: () {
            widget.isDateField ? widget.onTab() : false;
          },
          child: Card(
            color: selectedField
                ? AppColor.colorLogInScreenFieldTextSelected
                : widget.backgroundColor,
//          elevation: ,a
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white60, width: 1),
              borderRadius: BorderRadius.circular(hDimen(7)),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: hDimen(10), left: hDimen(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: vDimen(5)),
                    height: vDimen(57),
                    width: hDimen(250),
                    child: widget.isDateField
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: vDimen(13),
                            ),
                            child: Text(
                              widget.selectedDate,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: hDimen(16),
                              ),
                            ),
                          )
                        : TextFormField(
                            onTap: () {
                              setState(() {
                                selectedField = true;
                              });
                            },
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: hDimen(18),
                                fontFamily: 'Avenir-Book'),
                            controller: widget.textEditingController == null
                                ? null
                                : widget.textEditingController,
                            focusNode: widget.focusNode,
                            textInputAction: widget.inputAction,
                            obscureText: widget.obSecure,
                            maxLength: widget.maxLength,
                            onFieldSubmitted: (value) {
                              setState(() {
                                selectedField = false;
                              });
                              if (widget.onSubmit != null)
                                widget.onSubmit(value);
                            },
                            decoration: InputDecoration(
                              focusColor: Colors.white70,
                              filled: true,
                              counterText: "",
                              hintStyle: widget.textStyle,
                    hintText:widget.hintText==null ? " " : widget.hintText,
                              fillColor: selectedField
                                  ? AppColor.colorLogInScreenFieldTextSelected
                                  : widget.backgroundColor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                  ),
                  !widget.isPasswordField
                      ? Spacer(
                          flex: 2,
                        )
                      : Container(),
                  !widget.isPasswordField && widget.icon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: vDimen(16),
                          ),
                          child: Icon(
                            widget.icon,
                            color: Colors.white70,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
