import 'package:borong/screens/cart_screen.dart';
import 'package:borong/screens/profil_screen.dart';
import 'package:borong/screens/search_screen.dart';
import 'package:borong/screens/transactions/transactions_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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
  final List<int> _indexTrail = [0];
  List<Widget> _childrenWidgets(BuildContext context) {
    Widget wrapper(Widget child) => WillPopScope(
          onWillPop: () async {
            if (_indexTrail.length <= 1) return true;
            _changeTab(_indexTrail.elementAt(1));
            _indexTrail.removeAt(0);
            return false;
          },
          child: child,
        );
    return [
      wrapper(const ShoppingHomePage()),
      wrapper(const ShoppingSearchPage()),
      wrapper(const ShoppingCartScreen()),
      wrapper(const TransactionsScreen()),
      wrapper(const ProfilePage()),
    ];
  }

  void _onItemTapped(int index) {
    if (_indexTrail.first != index) {
      _indexTrail.insert(0, index);
      _changeTab(index);
    }
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrenWidgets(context).elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: _ButtonNavigationBarItemIcon(
              icon: Icon(Icons.shopping_basket),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: _ButtonNavigationBarItemIcon(
              icon: Icon(Icons.receipt),
            ),
            label: "Transaction",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: ContraColors.woodSmoke,
        unselectedItemColor: ContraColors.trout,
        showSelectedLabels: true,
        showUnselectedLabels: false,
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

class _ButtonNavigationBarItemIcon extends StatelessWidget {
  final Icon icon;
  final String? badgeText;

  const _ButtonNavigationBarItemIcon({
    Key? key,
    required this.icon,
    this.badgeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          icon,
          if (badgeText != null)
            Positioned(
              top: 0.0,
              right: -4.0,
              child: InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  alignment: Alignment.center,
                  child: Text(
                    badgeText ?? "",
                    style: const TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      );
}
