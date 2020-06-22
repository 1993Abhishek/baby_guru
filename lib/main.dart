import 'package:babyguru/router.dart';
import 'package:babyguru/ui/helper/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BabyGuru());
}

class BabyGuru extends StatefulWidget {
  @override
  _BabyGuruState createState() => _BabyGuruState();
}

class _BabyGuruState extends State<BabyGuru> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Online Doctor",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.colorLogInScreenBack,
      ),
      initialRoute: Router.ROUTE_INITIAL,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
