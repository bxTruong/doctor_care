import 'package:doctor_care/ui/home/home_binding.dart';
import 'package:doctor_care/ui/home/home_page.dart';
import 'package:doctor_care/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          initialRoute: '/home',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          getPages: [
            GetPage(name: '/home', page: () => HomePage()),
            GetPage(name: '/login', page: () => LoginPage())
          ],
        );
      },
    );
  }
}
