import 'package:flutter/material.dart';

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
