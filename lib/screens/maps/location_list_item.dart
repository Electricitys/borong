import 'package:borong/screens/maps/map_widget.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'location.dart';

class LocationListItem extends StatelessWidget {
  final Location location;

  const LocationListItem({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: MapWidget(
              distance: location.distance,
              isDetail: false,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  ContraText(
                    color: ContraColors.woodSmoke,
                    size: 24,
                    weight: FontWeight.w800,
                    alignment: Alignment.center,
                    text: "Space 8",
                  ),
                  ContraText(
                    color: ContraColors.trout,
                    size: 21,
                    weight: FontWeight.w500,
                    alignment: Alignment.center,
                    text: "Wolf Crater, 897, Marsh",
                  )
                ],
              ),
              ButtonRoundWithShadow(
                size: 60,
                borderColor: ContraColors.woodSmoke,
                shadowColor: ContraColors.woodSmoke,
                callback: () {},
                color: ContraColors.white,
                iconPath: "assets/icons/ic_navigation.svg",
              )
            ],
          )
        ],
      ),
    );
  }
}
