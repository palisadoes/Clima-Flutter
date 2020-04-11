import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

const apiKey = '8f902b19215a9aca169b4525b9d9a27f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

//int condition = weatherData['weather'][0]['id'];
//double temperature = weatherData['main']['temp'];
//String cityName = weatherData['name'];
