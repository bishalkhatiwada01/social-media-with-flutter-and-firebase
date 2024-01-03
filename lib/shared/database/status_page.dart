import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/helper/login_or_register.dart';
import 'package:socialmediaapp/main.dart';
import 'package:socialmediaapp/features/dashbord/views/home_page.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return MainPage();
          } else {
            return const LoginOrRegister();
          }

          // user is not logged in
        },
      ),
    );
  }
}
