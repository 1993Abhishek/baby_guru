import 'package:babyguru/ui/helper/app_color.dart';
import 'package:flutter/material.dart';
import 'package:babyguru/ui/util/app_dimen.dart';

class OTPBoxField extends StatefulWidget {
  final String hintText;
  final String valueText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool isObscureText;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function onSubmitted;
  final Function onChange;
  final Function onTap;
  final bool isReadOnly;
  final double height;
  final double width;
  final TextStyle textStyle;
  final double borderRadius;
  final bool hasError;

  const OTPBoxField(
      {Key key,
      this.valueText,
      this.hintText,
      this.textStyle,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.isObscureText = false,
      this.textEditingController,
      this.focusNode,
      this.onChange,
      this.onTap,
      this.height,
      this.width,
      this.hasError = false,
      this.isReadOnly = false,
      this.borderRadius,
      this.onSubmitted})
      : super(key: key);

  @override
  _OTPBoxField createState() => _OTPBoxField();
}

class _OTPBoxField extends State<OTPBoxField> {
  TextEditingController _textEditingController;
  FocusNode _focusNode;

  @override
  void initState() {
    _textEditingController = widget.textEditingController == null
        ? TextEditingController()
        : widget.textEditingController;
    if (widget.valueText != null)
      _textEditingController.text = widget.valueText;
    _focusNode = widget.focusNode == null ? FocusNode() : widget.focusNode;
    _focusNode.addListener(_focusChangeListener);
    super.initState();
  }

  void _focusChangeListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Container(
        height: widget.height != null ? widget.height : vDimen(65),
        width: widget.width != null ? widget.width : hDimen(65),
        decoration: BoxDecoration(
          border: Border.all(
              color: widget.hasError
                  ? Colors.white
                  : _focusNode.hasFocus ? Colors.white70 : Colors.white70,
              width: _focusNode.hasFocus ? 2 : 0.4),
          borderRadius: BorderRadius.circular(
              widget.borderRadius != null ? widget.borderRadius : hDimen(10)),
          color: AppColor.colorLogInScreenFields,
        ),
        child: Center(
          child: TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              focusNode: _focusNode,
              controller: _textEditingController,
              textInputAction: widget.textInputAction,
              maxLength: 1,
              maxLines: 1,
              style: widget.textStyle != null
                  ? widget.textStyle
                  : TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: hDimen(22),
                    ),
              onSubmitted: (value) {
                if (widget.onSubmitted != null) widget.onSubmitted(value);
              },
              onChanged: (value) {
                if (widget.onChange != null) widget.onChange(value);
              },
              onTap: () {
                if (widget.onTap != null) widget.onTap();
              },
              keyboardType: widget.textInputType,
              obscureText: widget.isObscureText,
              readOnly: widget.isReadOnly,
              decoration: InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: widget.hintText == null ? "" : widget.hintText,
                hintStyle: TextStyle(color: Colors.white, fontSize: hDimen(18)),
              )),
        ),
      ),
    );
  }
}
