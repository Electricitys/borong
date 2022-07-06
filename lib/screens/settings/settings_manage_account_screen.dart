import 'package:borong/models/settings.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/settings_list_card_item.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
        onTap: () => {},
        title: "Name",
        value: "Imanuel Pundoko",
        color: ContraColors.caribbeanColor,
        textColor: woodSmoke));
    detailsOne.add(SettingsCardItemDetail(
        onTap: () => {},
        title: "Birthday",
        value: "May 7, 1999",
        color: ContraColors.pastelPink,
        textColor: woodSmoke));
    detailsOne.add(SettingsCardItemDetail(
        onTap: () => {},
        title: "Gender",
        value: "Male",
        color: ContraColors.foam,
        textColor: woodSmoke));

    detailsTwo.add(SettingsCardItemDetail(
        title: "Email",
        value: "ilomon10@gmail.com",
        color: ContraColors.lighteningYellow,
        textColor: woodSmoke));
    detailsTwo.add(SettingsCardItemDetail(
        title: "Phone number",
        value: "+62 852-9948-2331",
        color: ContraColors.caribbeanColor,
        textColor: woodSmoke));

    detailOne = SettingsCardDetail(
        title: "Personal Information",
        bgColor: white,
        borderColor: ContraColors.woodSmoke,
        items: detailsOne);
    detailTwo = SettingsCardDetail(
        title: "Contact",
        bgColor: white,
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
                            borderColor: woodSmoke,
                            color: white,
                            callback: () {
                              Navigator.pop(context);
                            },
                            shadowColor: woodSmoke,
                            iconPath: "assets/icons/arrow_back.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ContraText(
                      overflow: TextOverflow.ellipsis,
                      size: 27,
                      color: woodSmoke,
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
