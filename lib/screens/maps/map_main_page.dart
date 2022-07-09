import 'package:borong/screens/maps/location_detail.dart';
import 'package:borong/screens/maps/location_listing.dart';
import 'package:flutter/material.dart';

class LocationMapMainPage extends StatefulWidget {
  const LocationMapMainPage({super.key});

  static String routeName = "/map";

  @override
  // ignore: library_private_types_in_public_api
  _LocationMapMainPageState createState() => _LocationMapMainPageState();
}

class _LocationMapMainPageState extends State<LocationMapMainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map and Location"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Locations Listing"),
              onTap: () {
                Navigator.pushNamed(context, LocationListingPage.routeName);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(20),
              trailing: const Icon(Icons.navigate_next),
              title: const Text("Location Detail Page"),
              onTap: () {
                Navigator.pushNamed(context, LocationDetailPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
