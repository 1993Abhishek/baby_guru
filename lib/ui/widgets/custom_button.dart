import 'package:babyguru/ui/helper/app_color.dart';
import 'package:babyguru/ui/util/app_dimen.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onClick;

  CustomButton(
  {this.buttonText,
    this.onClick,}
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Container(
          height: vDimen(55),
          width: hDimen(350),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: AppColor.colorLogInScreenBack,
                fontSize: hDimen(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
