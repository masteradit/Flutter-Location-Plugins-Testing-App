import 'package:flutter/material.dart';

import '../config/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Plugins Demo App'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          RaisedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.locationAndGeocoderPage),
            child: Text('location + geocoder'),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.geolocatorPage),
            child: Text('geolocator'),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () {},
            child: Text('Test'),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () {},
            child: Text('Test'),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () {},
            child: Text('Test'),
          ),
        ],
      ),
    );
  }
}
