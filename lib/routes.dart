import 'package:borong/screens/address_screen.dart';
import 'package:borong/screens/order_detail_screen.dart';
import 'package:borong/screens/orders_screen.dart';
import 'package:borong/screens/profil_screen.dart';
import 'package:borong/screens/settings/setting_screen.dart';
import 'package:borong/screens/settings/settings_manage_account_screen.dart';
import 'package:borong/screens/settings/settings_manage_privacy_screen.dart';
import 'package:flutter/material.dart';
import 'package:borong/screens/signup_screen.dart';
import 'package:borong/screens/signin_screen.dart';
import 'package:borong/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      MainScreen.routeName: (_) => const MainScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      ProfilePage.routeName: (context) => const ProfilePage(),

      // AddressScreen.routeName: (_) => const AddressScreen(),

      // Store
      // OrderListScreen.routeName: (context) => const OrderListScreen(),

      // Settings
      // SettingsScreen.routeName: (context) => const SettingsScreen(),
      // SettingsManageAccountScreen.routeName: (context) =>
      //     const SettingsManageAccountScreen(),
      // SettingsManagePrivacyScreen.routeName: (context) =>
      //     const SettingsManagePrivacyScreen(),
    };
  }

  static PageTransition? onGenerateRoute(routeSettings) {
    switch (routeSettings.name) {
      case AddressScreen.routeName:
        return defaultTransition(
          child: const AddressScreen(),
          type: PageTransitionType.bottomToTop,
        );
      case OrderDetailScreen.routeName:
        return defaultTransition(
          child: const OrderDetailScreen(),
          type: PageTransitionType.bottomToTop,
        );
      case OrderListScreen.routeName:
        return defaultTransition(
          child: const OrderListScreen(),
        );
      case SettingsScreen.routeName:
        return defaultTransition(
          child: const SettingsScreen(),
        );
      case SettingsManageAccountScreen.routeName:
        return defaultTransition(
          child: const SettingsManageAccountScreen(),
        );
      case SettingsManagePrivacyScreen.routeName:
        return defaultTransition(
          child: const SettingsManagePrivacyScreen(),
        );
      default:
        return null;
    }
  }

  static PageTransition defaultTransition(
      {required Widget child,
      PageTransitionType? type,
      Curve? curve,
      Duration? duration,
      Duration? reverseDuration}) {
    return PageTransition(
      child: child,
      type: type ?? PageTransitionType.rightToLeftWithFade,
      curve: curve ?? Curves.easeInOut,
      duration: duration ?? const Duration(milliseconds: 750),
      reverseDuration: reverseDuration ?? const Duration(milliseconds: 400),
    );
  }
}
