import 'package:flutter/material.dart';
import 'package:borong/screens/search_list_screen.dart';
import 'package:borong/screens/signup_screen.dart';
import 'package:borong/screens/signin_screen.dart';
import 'package:borong/screens/main_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const MainScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      ShoppingSearchListPage.routeName: (context) =>
          const ShoppingSearchListPage(),
      // ShoppingDetailPage.routeName: (context) => const ShoppingDetailPage(),
    };
  }
}
