import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/themes/dark_mode.dart';
import 'package:socialmediaapp/themes/light_mode.dart';
import 'package:socialmediaapp/views/home_page.dart';
import 'package:socialmediaapp/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home: LoginPage(),
          darkTheme: darkMode,
        );
      },
    );
  }
}
