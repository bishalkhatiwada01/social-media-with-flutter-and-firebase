import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmediaapp/common/widgets/my_drawer.dart';
import 'package:socialmediaapp/common/widgets/my_list_tile.dart';
import 'package:socialmediaapp/common/widgets/my_postbutton.dart';
import 'package:socialmediaapp/common/widgets/my_textfield.dart';
import 'package:socialmediaapp/features/auth/utils/firestore.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: const Text('P O S T'),
      ),
      drawer: const MyDrawer(),
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

                MyPostButton(onTap: postMessage)
              ],
            ),
          ),

          // posts
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // show loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // get all post
              final posts = snapshot.data!.docs;

              // no data?
              if (snapshot.data == null || posts.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: const Text('No posts .. Please Post something!'),
                  ),
                );
              }

              // return a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get individual posts
                    final post = posts[index];

                    // get data from each post
                    String userEmail = post['UserEmail'];
                    String message = post['PostMessage'];
                    String timestamp = post['dateString'];

                    // return as a listtile
                    return MyListTile(
                      subtitle: userEmail,
                      title: message,
                      timestamp: timestamp,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}