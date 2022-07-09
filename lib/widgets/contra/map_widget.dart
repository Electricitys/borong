import 'dart:async';

import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
  late bool _isLoading = true;

  void _onMapCreated(GoogleMapController controller) {
    setState(() => _isLoading = false);
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget overlay = Container();
    if (_isLoading) {
      overlay = Positioned.fill(
        top: 4,
        right: 4,
        left: 4,
        bottom: 4,
        child: Container(
          decoration: const BoxDecoration(
              color: ContraColors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }
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
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: GoogleMap(
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
          ),
          overlay
        ],
      ),
    );
  }
}
