import 'dart:async';

import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:developer' as developer;

class MapWidget extends StatefulWidget {
  final void Function(CameraPosition position)? onCameraIdle;
  final void Function(CameraPosition position)? onCameraMove;
  final void Function(Completer<GoogleMapController> mapController)? onMapReady;

  const MapWidget(
      {super.key, this.onCameraIdle, this.onCameraMove, this.onMapReady});

  @override
  // ignore: library_private_types_in_public_api
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();
  late LatLng _center = const LatLng(0, 0);
  late CameraPosition _currentCameraPosition = CameraPosition(target: _center);
  late bool _isLoading = true;
  late bool _isSearchingLocation = true;

  late LocationData _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Location location = Location();

    GoogleMapController mapController = await _controller.future;

    try {
      _currentLocation = await location.getLocation();
      _center = LatLng(_currentLocation.latitude!, _currentLocation.longitude!);
      developer.log("Current Location: $_currentLocation", name: "MapWidget");
      _currentCameraPosition = CameraPosition(
        zoom: 13,
        target: LatLng(
          _currentLocation.latitude!,
          _currentLocation.longitude!,
        ),
      );
      mapController.animateCamera(
          CameraUpdate.newCameraPosition(_currentCameraPosition));
      _isSearchingLocation = false;
      setState(() {});
      if (widget.onMapReady != null) {
        widget.onMapReady!(_controller);
      }
    } catch (err) {
      developer.log(err.toString(), name: '_getCurrentLocation');
      developer.log("error while retrieving location", name: "MapWidget");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() => _isLoading = false);
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    Widget overlay = Container();
    if (_isLoading || _isSearchingLocation) {
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
                onCameraIdle: _onCameraIdle,
                onCameraMove: _onCameraMove,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _currentCameraPosition,
              ),
            ),
          ),
          overlay
        ],
      ),
    );
  }

  void _onCameraIdle() {
    if (_isLoading || _isSearchingLocation) return;
    if (widget.onCameraIdle != null) {
      widget.onCameraIdle!(_currentCameraPosition);
    }
  }

  void _onCameraMove(CameraPosition position) {
    if (_isLoading || _isSearchingLocation) return;
    setState(() {
      _currentCameraPosition = position;
    });
    if (widget.onCameraMove != null) {
      widget.onCameraMove!(position);
    }
  }
}
