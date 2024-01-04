import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/common/widgets/my_postbutton.dart';
import 'package:socialmediaapp/common/widgets/my_textfield.dart';
import 'package:socialmediaapp/features/auth/utils/firestore.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  // text controller
  final TextEditingController newPostController = TextEditingController();

  // post message
  void postMessage() {
    // only post if there something in textfield
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }
    // clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text('C R E A T E   P O S T'),
      ),
      body: Column(
        children: [
          // Textfield for user to type
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: 'Say Something',
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),

                // post button
              ],
            ),
          ),
          MyPostButton(onTap: postMessage),
        ],
      ),
    );
  }
}
