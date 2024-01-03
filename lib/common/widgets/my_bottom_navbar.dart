import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.newspaper,
          ),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
          ),
          label: 'Notifications',
        ),
      ],
    );
  }
}
