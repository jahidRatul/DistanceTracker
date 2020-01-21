import 'package:distance_tracker/models/user_location.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);

    double startingLat;
    double startingLon;

    getInitialPoint() {
      startingLat = userLocation.latitude;
      startingLon = userLocation.longitude;
      print(startingLat);
      print(startingLon);
      return [startingLat, startingLon];
    }

    double endingLat;
    double endingLon;

    getEndPoint() {
      endingLat = userLocation.latitude;
      endingLon = userLocation.longitude;

      print(endingLat);
      print(endingLon);
      return [endingLat, endingLon];
    }

//    final Distance distance = new Distance();
//
//    final int meter = distance(
//        new LatLng(startingLat, startingLon), new LatLng(endingLat, endingLon));

    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Calculate your distance in meter with live preview',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              onTap: (null),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your distance',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: getInitialPoint,
              child: Text('Start'),
              textColor: Colors.deepPurple,
            ),
            RaisedButton(
              onPressed: getEndPoint,
              child: Text('End'),
              textColor: Colors.deepPurple,
            ),
            RaisedButton(
              onPressed: getEndPoint,
              child: Text('calculate'),
              textColor: Colors.deepPurple,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                'Location: Lat: ${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
          ],
        ),
      ),
    );
  }
}
