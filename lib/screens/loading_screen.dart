import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    // By default Geolocator will use FusedLocationProviderClient on Android
    // when Google Play Services are available. It will fall back to
    // LocationManager when it is not available. You can override the behaviour
    // by setting forceAndroidLocationManager.
    // This line forces Geolocation to work as Google Play services
    // are unavailable.

    Geolocator()..forceAndroidLocationManager = true;

    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
