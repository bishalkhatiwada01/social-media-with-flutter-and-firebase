import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/components/my_back_buttom.dart';
import 'package:socialmediaapp/helper/helper_functions.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          // any errors
          if (snapshot.hasError) {
            displayMessageToUser('Something went wrong', context);
          }

          // show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text('No data');
          }

          // get all users
          final users = snapshot.data!.docs;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  top: 40.h,
                ),
                child: Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  // get individual users
                  final user = users[index];

                  return ListTile(
                    title: Text(user['username']),
                    subtitle: Text(user['email']),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
