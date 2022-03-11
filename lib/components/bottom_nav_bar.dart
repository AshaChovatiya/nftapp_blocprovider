import 'package:flutter/material.dart';

import '../ui/cartScreen/cart_page.dart';
import '../ui/homeScreen/home_page.dart';
import '../ui/profileScreen/profile_page.dart';
import '../ui/searchScreen/search_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xff1BEDFF),
        unselectedItemColor: Colors.black,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "*",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "*"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "*"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "*"),
        ],
      ),
      body: Stack(children: [Center(child: screens.elementAt(_currentIndex))]),
    );
  }
}
