import 'package:air_checker/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Air Checker';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: appTitle,
      home: LoadingScreen(
        appTitle: appTitle,
      ),
      // home: HomeScreen(
      //   appTitle: appTitle,
      //   locationAirQuality: null,
      // ),
    );
  }
}
