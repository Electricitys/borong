import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/button_solid_with_icon.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'map_widget.dart';

class LocationDetailPage extends StatefulWidget {
  const LocationDetailPage({super.key});

  static String routeName = "/location_detail_page";

  @override
  // ignore: library_private_types_in_public_api
  _LocationDetailPageState createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContraColors.persianBlue,
      appBar: CustomAppBar(
        height: 92,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ButtonRoundWithShadow(
                      size: 48,
                      borderColor: ContraColors.lighteningYellow,
                      color: ContraColors.lighteningYellow,
                      callback: () {
                        Navigator.pop(context);
                      },
                      shadowColor: ContraColors.woodSmoke,
                      iconPath: "assets/icons/arrow_back_white.svg"),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: ContraText(
                size: 27,
                color: ContraColors.white,
                alignment: Alignment.bottomCenter,
                text: "Directions",
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
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 24,
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(24),
              child: const MapWidget(
                distance: "2.5",
                isDetail: false,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: ContraText(
                      color: ContraColors.white,
                      size: 44,
                      weight: FontWeight.w800,
                      alignment: Alignment.centerLeft,
                      text: "Space 8",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: ContraText(
                      color: ContraColors.white,
                      size: 21,
                      weight: FontWeight.w500,
                      alignment: Alignment.centerLeft,
                      text: "Wolf Crater, 897, \n New Milkyway Mars",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: ButtonPlainWithIcon(
                      text: "Get Direction",
                      color: ContraColors.woodSmoke,
                      callback: () {},
                      size: 48,
                      isPrefix: false,
                      isSuffix: true,
                      textColor: ContraColors.white,
                      iconPath: "assets/icons/ic_navigation_white.svg",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
