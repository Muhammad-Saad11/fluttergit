import 'package:geolocator/geolocator.dart';
class Location{
  double latitude=0;
  double longitude=0;

  Future<void> getCurrentLocation() async {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
      distanceFilter: 100,
    );
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      print(position);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);

  }
}















  // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   // Location services are not enabled don't continue
  //   // accessing the position and request users of the
  //   // App to enable the location services.
  //   return Future.error('Location services are disabled.');
  // }

  // permission = await Geolocator.checkPermission();

  }
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     // Permissions are denied, next time you could try
  //     // requesting permissions again (this is also where
  //     // Android's shouldShowRequestPermissionRationale
  //     // returned true. According to Android guidelines
  //     // your App should show an explanatory UI now.
  //     return Future.error('Location permissions are denied');
  //   }
  // }
  //
  // if (permission == LocationPermission.deniedForever) {
  //   // Permissions are denied forever, handle appropriately.
  //   return Future.error(
  //       'Location permissions are permanently denied, we cannot request permissions.');
  // }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

