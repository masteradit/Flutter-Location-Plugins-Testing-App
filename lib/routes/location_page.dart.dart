import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _lat = '';
  String _long = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('location plugin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('lat = $_lat'),
              Text('long = $_long'),
              RaisedButton(
                onPressed: () async {
                  LocationData locationData = await _getLocation();
                  _address = await _getAddressFromCoordinates(
                    latitude: locationData?.latitude,
                    longitude: locationData?.longitude,
                  );
                  setState(() {
                    _lat = locationData?.latitude.toString();
                    _long = locationData?.longitude.toString();
                  });
                },
                child: Text('Get location'),
              ),
              Text('Address = $_address'),
            ],
          ),
        ),
      ),
    );
  }

  Future<LocationData> _getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  Future<String> _getAddressFromCoordinates({
    @required double latitude,
    @required double longitude,
  }) async {
    Coordinates coordinates = Coordinates(latitude, latitude);
    List<Address> addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    return addresses.first.addressLine;
  }
}
