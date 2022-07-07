import 'package:borong/models/settings.dart';
import 'package:borong/screens/settings/settings_manage_account_screen.dart';
import 'package:borong/screens/settings/settings_manage_privacy_screen.dart';
import 'package:borong/screens/signin_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/settings_list_card_item.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as developer;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static String routeName = "/settings-screen";

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );
  late SettingsCardDetail detailOne;
  late SettingsCardDetail detailTwo;

  List<SettingsCardItemDetail> detailsOne = <SettingsCardItemDetail>[];
  List<SettingsCardItemDetail> detailsTwo = <SettingsCardItemDetail>[];

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    detailsOne.add(SettingsCardItemDetail(
        onTap: () {
          Navigator.pushNamed(context, SettingsManageAccountScreen.routeName);
        },
        title: "Manage account",
        color: ContraColors.lighteningYellow,
        textColor: ContraColors.woodSmoke));
    detailsOne.add(SettingsCardItemDetail(
        onTap: () {
          Navigator.pushNamed(context, SettingsManagePrivacyScreen.routeName);
        },
        title: "Privacy",
        color: ContraColors.lighteningYellow,
        textColor: ContraColors.woodSmoke));
    detailsOne.add(SettingsCardItemDetail(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (
                BuildContext context,
                Animation animation,
                Animation secondaryAnimation,
              ) {
                return const SignInScreen();
              },
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
            (Route route) => false,
          );
        },
        title: "Logout",
        color: ContraColors.flamingo,
        textColor: ContraColors.woodSmoke));

    detailsTwo.add(SettingsCardItemDetail(
        onTap: () {
          developer.log("Pressed");
        },
        title: "Orders",
        color: ContraColors.lighteningYellow,
        textColor: ContraColors.woodSmoke));
    detailsTwo.add(SettingsCardItemDetail(
        onTap: () {
          developer.log("Pressed");
        },
        title: "Transaction",
        color: ContraColors.turquoiseBlue,
        textColor: ContraColors.woodSmoke));
    detailsTwo.add(SettingsCardItemDetail(
        onTap: () {
          developer.log("Pressed");
        },
        title: "Products",
        color: ContraColors.monaLisa,
        textColor: ContraColors.woodSmoke));

    detailOne = SettingsCardDetail(
        title: "Account",
        bgColor: ContraColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsOne);
    detailTwo = SettingsCardDetail(
        title: "Store",
        bgColor: ContraColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsTwo);
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: CustomAppBar(
        height: kToolbarHeight + statusBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ButtonRoundWithShadow(
                            size: 48,
                            borderColor: ContraColors.woodSmoke,
                            color: ContraColors.white,
                            callback: () {
                              Navigator.pop(context);
                            },
                            shadowColor: ContraColors.woodSmoke,
                            iconPath: "assets/icons/arrow_back.svg"),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: ContraText(
                      size: 27,
                      color: ContraColors.woodSmoke,
                      alignment: Alignment.bottomCenter,
                      text: "Settings",
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SettingsListCardItem(
              detail: detailOne,
            ),
            SettingsListCardItem(
              detail: detailTwo,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0)
                  .add(const EdgeInsets.only(bottom: 24)),
              child: Column(
                children: <Widget>[
                  ContraText(
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    color: ContraColors.woodSmoke,
                    weight: FontWeight.w800,
                    text: packageInfo.appName,
                    size: 21,
                  ),
                  ContraText(
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    color: ContraColors.woodSmoke,
                    weight: FontWeight.bold,
                    text: packageInfo.version,
                    size: 21,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
