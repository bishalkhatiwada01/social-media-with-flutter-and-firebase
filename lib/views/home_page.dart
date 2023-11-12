
import 'package:flutter/material.dart';
import 'package:socialmediaapp/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
