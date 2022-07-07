import 'package:borong/models/settings.dart';
import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/settings_list_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as developer;

class SettingsManagePrivacyScreen extends StatefulWidget {
  final String title;
  const SettingsManagePrivacyScreen({
    Key? key,
    this.title = "Privacy",
  }) : super(key: key);

  static String routeName = "/settings-manage-privacy-screen";

  @override
  // ignore: library_private_types_in_public_api
  _SettingsManagePrivacyScreenState createState() =>
      _SettingsManagePrivacyScreenState();
}

class _SettingsManagePrivacyScreenState
    extends State<SettingsManagePrivacyScreen> {
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
        title: "Password",
        color: ContraColors.caribbeanColor,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Password",
            onInitState: () {
              fieldFocusNode.requestFocus();
            },
            onDispose: () {
              fieldFocusNode.dispose();
            },
            onSubmit: () async {
              developer.log("Submit");
              return true;
            },
            child: Column(
              children: [
                ContraInputText(
                  obscureText: true,
                  focusNode: fieldFocusNode,
                  placeholder: "New Password",
                ),
                const SizedBox(height: 16),
                const ContraInputText(
                  obscureText: true,
                  placeholder: "Confirm Password",
                ),
              ],
            ),
          );
        }));

    detailOne = SettingsCardDetail(
        title: "Security",
        bgColor: CupertinoColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsOne);
  }

  Future<void> _showModalSheet({
    required Future<bool> Function() onSubmit,
    required Widget child,
    required String title,
    VoidCallback? onInitState,
    VoidCallback? onDispose,
  }) async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => ContraSheet(
        onInitState: onInitState,
        onDispose: onDispose,
        title: title,
        action: Row(children: <Widget>[
          ClipOval(
            child: Material(
              child: IconButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text("Sending..."),
                        behavior: SnackBarBehavior.floating,
                      ));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    try {
                      await onSubmit();
                      if (!mounted) return;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Changed"),
                          behavior: SnackBarBehavior.floating,
                        ));
                      return;
                    } catch (err) {
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Error"),
                          behavior: SnackBarBehavior.floating,
                        ));
                    }
                  },
                  color: ContraColors.persianBlue,
                  icon: const Icon(
                    Icons.check,
                  )),
            ),
          )
        ]),
        child: Padding(padding: const EdgeInsets.all(24.0), child: child),
      ),
    );
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
                            color: CupertinoColors.white,
                            callback: () {
                              Navigator.pop(context);
                            },
                            shadowColor: ContraColors.woodSmoke,
                            iconPath: "assets/icons/arrow_back.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ContraText(
                      overflow: TextOverflow.ellipsis,
                      size: 27,
                      color: ContraColors.woodSmoke,
                      alignment: Alignment.bottomCenter,
                      text: widget.title,
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
          ],
        ),
      ),
    );
  }
}
