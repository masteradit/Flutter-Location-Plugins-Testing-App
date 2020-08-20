import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';

class GeolocatorPage extends StatefulWidget {
  @override
  _GeolocatorPageState createState() => _GeolocatorPageState();
}

class _GeolocatorPageState extends State<GeolocatorPage> {
  double latitude;
  double longitude;
  String address = '';

  Geolocator geolocator = Geolocator();

  Future<void> getCurrentLocation() async {
    try {
      Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentAddress() async {
    try {
      List<Placemark> placemarks =
          await geolocator.placemarkFromCoordinates(latitude, longitude);

      Placemark first = placemarks.first;

      var name = first.name != '' ? '${first.name}, ' : '';
      var thoroughfare =
          first.thoroughfare != '' ? '${first.thoroughfare}, ' : '';
      var subLocality = first.subLocality != '' ? '${first.subLocality}, ' : '';
      var locality = first.locality != '' ? '${first.locality}, ' : '';
      var administrativeArea =
          first.administrativeArea != '' ? '${first.administrativeArea}, ' : '';
      var country = first.country != '' ? '${first.country} ' : '';
      var postalCode = first.postalCode != '' ? '(${first.postalCode})' : '';

      setState(() {
        address =
            '$name$thoroughfare$subLocality$locality$administrativeArea$country$postalCode';
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('geolocator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('latitude = $latitude'),
              Text('longitude = $longitude'),
              RaisedButton(
                onPressed: () async {
                  await getCurrentLocation();
                  await getCurrentAddress();
                },
                child: Text('Get location'),
              ),
              Text('Address = $address'),
            ],
          ),
        ),
      ),
    );
  }
}
