import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'routes/geolocator_page.dart';
import 'routes/home_page.dart';
import 'routes/location_and_geocoder_page.dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.homePage,
      routes: {
        Routes.homePage: (context) => HomePage(),
        Routes.locationAndGeocoderPage: (context) => LocationAndGeocoderPage(),
        Routes.geolocatorPage: (context) => GeolocatorPage(),
      },
    );
  }
}
