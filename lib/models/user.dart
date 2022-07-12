import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserGender {
  static String male = "Male";
  static String female = "Female";
}

class UserDestination {
  String alias;
  String address;
  LatLng position;

  UserDestination({
    required this.alias,
    required this.address,
    required this.position,
  });
}
