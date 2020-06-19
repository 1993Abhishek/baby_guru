import 'package:flutter/material.dart';

void appPrint(Object object, {Type fromClass, bool printOn = true}) {
  if (!printOn) return;
  debugPrint("[${fromClass.toString()}] :: $object");
}

void appPrintln(Object object, {Type fromClass, bool printOn = true}) {
  if (!printOn) return;
  debugPrint("\n[${fromClass.toString()}] :: $object\n");
}

Widget vSpacing(double dimen) {
  return Container(
    height: dimen,
    width: 0,
  );
}

Widget hSpacing(double dimen) {
  return Container(
    height: 0,
    width: dimen,
  );
}

class AppViewHelper {}