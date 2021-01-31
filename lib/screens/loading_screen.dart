import 'package:air_checker/screens/home_screen.dart';
import 'package:air_checker/services/air_quality.dart';
import 'package:air_checker/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final appTitle;
  LoadingScreen({this.appTitle});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAirQualityData();
  }

  void getAirQualityData() async {
    var airData = await AirQuality().getAirQuality();
    Location location = Location();
    await location.getCurrentLocation();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          // return LocationScreen(
          //   locationAirQuality: airData,
          // );
          return HomeScreen(
            appTitle: widget.appTitle,
            locationAirQuality: airData,
            latitude: location.latitude,
            longitude: location.longitude,
          );
        },
      ),
    );
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
