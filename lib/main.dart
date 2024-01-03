import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/auth/auth.dart';
import 'package:socialmediaapp/auth/login_or_register.dart';
import 'package:socialmediaapp/auth/users_page.dart';
import 'package:socialmediaapp/components/my_bottom_navbar.dart';
import 'package:socialmediaapp/firebase_options.dart';
import 'package:socialmediaapp/news_page.dart';
import 'package:socialmediaapp/themes/dark_mode.dart';
import 'package:socialmediaapp/themes/light_mode.dart';
import 'package:socialmediaapp/views/home_page.dart';
import 'package:socialmediaapp/views/notification_page.dart';
import 'package:socialmediaapp/views/profile_page.dart';

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
              '/main_page': (context) => MainPage(),
              '/home_page': (context) => HomePage(),
              '/profile_page': (context) => ProfilePage(),
              '/users_page': (context) => const UserPage(),
              '/notification_page': (context) => const NotificationPage(),


            },
          );
        },
      ),
    );
  }
}

// homepage

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [
    HomePage(),
    NewsPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
