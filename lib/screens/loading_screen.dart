import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projectrr/screens/location_screen.dart';
import 'package:projectrr/services/networking.dart';
import 'package:projectrr/utilities/location.dart';
import 'package:flutter/material.dart';
import '../utilities/location.dart';

const apiKey='bd57fb6e93d4a7cdaaa83faeace7a22e';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // getLocation();
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();


    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,

        ),
      ),
    );
  }
}


