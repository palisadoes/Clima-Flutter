import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    // By default Geolocator will use FusedLocationProviderClient on Android
    // when Google Play Services are available. It will fall back to
    // LocationManager when it is not available. You can override the behaviour
    // by setting forceAndroidLocationManager.
    // This line forces Geolocation to work as Google Play services
    // are unavailable.

    Geolocator()..forceAndroidLocationManager = true;

    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
