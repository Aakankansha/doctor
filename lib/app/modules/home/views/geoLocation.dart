import 'package:geolocator/geolocator.dart';

class GeoDistance {
  Position _currentPosition = Position(
    longitude: 0,
    latitude: 0,
    accuracy: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
    altitude: 0,
    timestamp: DateTime.now(),
  );
  double earthRadius = 6371000;

//Using pLat and pLng as dummy location

//Use Geolocator to find the current location(latitude & longitude)
  Future getUserLocation() async {
    Geolocator.requestPermission();
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

//Calculating the distance between two points with Geolocator plugin
  int getDistances(pLat, pLng) {
    double distance = 0;

    distance = Geolocator.distanceBetween(
        double.parse(pLat),
        double.parse(pLng),
        _currentPosition.latitude,
        _currentPosition.longitude);

    return distance.toInt();
  }
}
