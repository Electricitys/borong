import 'dart:io';

import 'package:borong/screens/maps/location_list_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/custom_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'location.dart';

class LocationListingPage extends StatefulWidget {
  const LocationListingPage({super.key});

  static String routeName = "/location_list_page";

  @override
  // ignore: library_private_types_in_public_api
  _LocationListingPageState createState() => _LocationListingPageState();
}

class _LocationListingPageState extends State<LocationListingPage> {
  List<Location> list = <Location>[];

  @override
  void initState() {
    super.initState();
    list.add(Location(
        address: "Wolf Crater, 897, Marsh", name: "Space 8", distance: "1.5"));
    list.add(Location(
        address: "Wolf Crater, 897, Marsh", name: "Space 8", distance: "2.0"));
    list.add(Location(
        address: "Wolf Crater, 897, Marsh", name: "Space 8", distance: "2.5"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 92,
        child: Row(
          children: [
            kIsWeb || Platform.isIOS
                ? const SizedBox(
                    width: 24,
                  )
                : const SizedBox(
                    width: 24,
                  ),
            kIsWeb || Platform.isIOS
                ? ButtonRoundWithShadow(
                    size: 48,
                    borderColor: ContraColors.woodSmoke,
                    color: ContraColors.white,
                    callback: () {
                      Navigator.pop(context);
                    },
                    shadowColor: ContraColors.woodSmoke,
                    iconPath: "assets/icons/close.svg")
                : const SizedBox(),
            const CustomHeader(
              fgColor: ContraColors.woodSmoke,
              isTwoLines: kIsWeb ? false : true,
              bgColor: ContraColors.white,
              color: ContraColors.woodSmoke,
              lineOneText: "Your",
              lineTwotext: "Directions",
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemBuilder: (BuildContext cotext, int index) {
          return LocationListItem(
            location: list[index],
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
