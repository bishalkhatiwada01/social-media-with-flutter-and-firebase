import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/auth/auth.dart';
import 'package:socialmediaapp/auth/login_or_register.dart';
import 'package:socialmediaapp/firebase_options.dart';
import 'package:socialmediaapp/themes/dark_mode.dart';
import 'package:socialmediaapp/themes/light_mode.dart';
import 'package:socialmediaapp/views/home_page.dart';
import 'package:socialmediaapp/views/profile_page.dart';
import 'package:socialmediaapp/views/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            home: const AuthPage(),
            darkTheme: darkMode,
            routes: {
              '/login_register_page': (context) => const LoginOrRegister(),
              '/home_page': (context) => HomePage(),
              '/profile_page': (context) => ProfilePage(),
              '/users_page': (context) => const UserPage(),
            },
          );
        },
      ),
    );
  }
}
