import 'dart:async';

import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final String distance;
  final bool isDetail;

  const MapWidget({super.key, required this.distance, required this.isDetail});

  @override
  // ignore: library_private_types_in_public_api
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shadows: [
            BoxShadow(
              color: ContraColors.woodSmoke,
              offset: Offset(0, 2),
            )
          ],
          color: ContraColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(
                color: ContraColors.woodSmoke,
                width: 2,
              ))),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(4),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: 24,
            child: Container(
              width: 64,
              padding: const EdgeInsets.all(4),
              height: 64,
              decoration: const BoxDecoration(
                  color: ContraColors.woodSmoke,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                children: const <Widget>[
                  ContraText(
                    alignment: Alignment.center,
                    text: "1.5",
                    size: 22,
                    color: ContraColors.white,
                    weight: FontWeight.bold,
                  ),
                  ContraText(
                    alignment: Alignment.center,
                    text: "Kms",
                    size: 15,
                    color: ContraColors.white,
                    weight: FontWeight.bold,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
