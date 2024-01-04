import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/features/posts/my_posts.dart';

import 'common/export_common.dart';
import 'package:socialmediaapp/shared/database/status_page.dart';
import 'package:socialmediaapp/helper/login_or_register.dart';
import 'package:socialmediaapp/features/profile/views/users_page.dart';
import 'package:socialmediaapp/firebase/firebase_options.dart';
import 'package:socialmediaapp/features/dashbord/views/home_page.dart';
import 'package:socialmediaapp/features/notifications/views/notification_page.dart';
import 'package:socialmediaapp/features/profile/views/profile_page.dart';

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
            home: const StatusPage(),
            darkTheme: darkMode,
            routes: {
              '/login_register_page': (context) => const LoginOrRegister(),
              '/main_page': (context) => const MainPage(),
              '/home_page': (context) => const HomePage(),
              '/profile_page': (context) => ProfilePage(),
              '/users_page': (context) => const UserPage(),
              '/notification_page': (context) => const NotificationPage(),
              'my_posts': (context) => const PostPage(),


            },
          );
        },
      ),
    );
  }
}

// mainpage

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [
    const HomePage(),
    const PostPage(),
    ProfilePage(),
    const NotificationPage()
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
