import 'package:borong/screens/orders_screen.dart';
import 'package:borong/screens/profil_screen.dart';
import 'package:borong/screens/settings/setting_screen.dart';
import 'package:borong/screens/settings/settings_manage_account_screen.dart';
import 'package:borong/screens/settings/settings_manage_privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:borong/screens/signup_screen.dart';
import 'package:borong/screens/signin_screen.dart';
import 'package:borong/screens/main_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      MainScreen.routeName: (_) => const MainScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      ProfilePage.routeName: (context) => const ProfilePage(),

      // Store
      OrderListScreen.routeName: (context) => const OrderListScreen(),

      // Settings
      SettingsScreen.routeName: (context) => const SettingsScreen(),
      SettingsManageAccountScreen.routeName: (context) =>
          const SettingsManageAccountScreen(),
      SettingsManagePrivacyScreen.routeName: (context) =>
          const SettingsManagePrivacyScreen(),
    };
  }
}
