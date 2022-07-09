import 'package:borong/screens/address_screen.dart';
import 'package:borong/screens/maps/location_detail.dart';
import 'package:borong/screens/maps/location_listing.dart';
import 'package:borong/screens/maps/map_main_page.dart';
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

      AddressScreen.routeName: (_) => const AddressScreen(),
      LocationMapMainPage.routeName: (_) => const LocationMapMainPage(),
      LocationDetailPage.routeName: (_) => const LocationDetailPage(),
      LocationListingPage.routeName: (_) => const LocationListingPage(),

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
