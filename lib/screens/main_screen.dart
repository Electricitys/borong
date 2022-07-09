import 'package:borong/screens/cart_screen.dart';
import 'package:borong/screens/maps/map_main_page.dart';
import 'package:borong/screens/profil_screen.dart';
import 'package:borong/screens/search_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import "package:flutter/material.dart";

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _childrenWidgets = [
    const ShoppingHomePage(),
    const ShoppingSearchPage(),
    const ShoppingCartScreen(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _childrenWidgets.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                const Icon(Icons.shopping_basket),
                Positioned(
                  top: 0.0,
                  right: -4.0,
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: const Text(
                        "1",
                        style: TextStyle(fontSize: 8, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: ContraColors.woodSmoke,
        unselectedItemColor: ContraColors.trout,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme:
            const IconThemeData(color: ContraColors.woodSmoke, opacity: 1),
        unselectedIconTheme:
            const IconThemeData(color: ContraColors.trout, opacity: 0.6),
        selectedLabelStyle: const TextStyle(
          color: ContraColors.woodSmoke,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: const TextStyle(
          color: ContraColors.trout,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
