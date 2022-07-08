import 'package:borong/models/settings.dart';
import 'package:borong/models/user.dart';
import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_date_picker.dart';
import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/contra_select.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/settings_list_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:developer' as developer;

class SettingsManageAccountScreen extends StatefulWidget {
  final String title;
  const SettingsManageAccountScreen({
    Key? key,
    this.title = "Account",
  }) : super(key: key);

  static String routeName = "/settings-manage-account-screen";

  @override
  // ignore: library_private_types_in_public_api
  _SettingsManageAccountScreenState createState() =>
      _SettingsManageAccountScreenState();
}

class _SettingsManageAccountScreenState
    extends State<SettingsManageAccountScreen> {
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
        title: "Name",
        value: "Imanuel Pundoko",
        color: ContraColors.caribbeanColor,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Fullname",
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
                  initialValue: "Imanuel Pundoko",
                  focusNode: fieldFocusNode,
                  placeholder: "Fullname",
                ),
              ],
            ),
          );
        }));
    detailsOne.add(SettingsCardItemDetail(
        title: "Birthday",
        value: "May 7, 1999",
        color: ContraColors.pastelPink,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          int currentYear = DateTime.now().year;
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Birthday",
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ContraDatePicker(
                    initialDateTime: DateTime(currentYear - 19),
                    minimumYear: currentYear - 70,
                    maximumYear: currentYear - 18,
                    onDateTimeChanged: (value) {},
                  ),
                )
              ],
            ),
          );
        }));
    detailsOne.add(SettingsCardItemDetail(
        title: "Gender",
        value: "Male",
        color: ContraColors.foam,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          List<SelectOptions> genderList = [
            SelectOptions(label: UserGender.male, value: UserGender.male),
            SelectOptions(label: UserGender.female, value: UserGender.female)
          ];
          _showModalSheet(
            title: "Edit Gender",
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
                ContraSelect(
                  height: 150,
                  options: genderList,
                  onChanged: ((value) {
                    developer.log(value);
                  }),
                )
              ],
            ),
          );
        }));

    detailsTwo.add(SettingsCardItemDetail(
        title: "Email",
        value: "ilomon10@gmail.com",
        color: ContraColors.lighteningYellow,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Edit",
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
                  initialValue: "ilomon10@gmail.com",
                  focusNode: fieldFocusNode,
                  placeholder: "Edit",
                ),
              ],
            ),
          );
        }));
    detailsTwo.add(SettingsCardItemDetail(
        title: "Phone number",
        value: "+62 852-9948-2331",
        color: ContraColors.caribbeanColor,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Phone Number",
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
                  initialValue: "+62 852-9948-2331",
                  focusNode: fieldFocusNode,
                  placeholder: "Phone Number",
                ),
              ],
            ),
          );
        }));

    detailOne = SettingsCardDetail(
        title: "Personal Information",
        bgColor: CupertinoColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsOne);
    detailTwo = SettingsCardDetail(
        title: "Contact",
        bgColor: CupertinoColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsTwo);
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
              color: Colors.transparent,
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
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: child),
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
                            color: ContraColors.white,
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
            SettingsListCardItem(
              detail: detailTwo,
            ),
          ],
        ),
      ),
    );
  }
}
